package com.myshop.service;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.revinate.guava.util.concurrent.RateLimiter;
import com.myshop.common.Constants;
import com.myshop.common.config.AliPayConfig;
import com.myshop.common.enums.LogModuleEnum;
import com.myshop.common.enums.OrderStatusEnum;
import com.myshop.common.enums.OrderTypeEnum;
import com.myshop.common.system.AsyncTaskFactory;
import com.myshop.entity.Goods;
import com.myshop.entity.Orders;
import com.myshop.entity.User;
import com.myshop.exception.CustomException;
import com.myshop.mapper.OrdersMapper;
import com.myshop.utils.SaUtils;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

@Service
@Slf4j
public class OrdersService implements InitializingBean {

    @Resource
    private OrdersMapper ordersMapper;

    @Resource
    private GoodsService goodsService;

    @Resource
    private AliPayConfig aliPayConfig;

    private static final ConcurrentHashMap<Integer, Object> orderMap = new ConcurrentHashMap<>();//订单锁 保证同一个人不能并发下单

    private RateLimiter limiter;


    /**
     * 下单  针对团购和普通下单
     *  为什么没有秒杀？
     *  因为秒杀比较特殊 秒杀有单独的数量  需要单独校验  秒杀要做单独的高并发处理
     */
    @Transactional  // 为什么加这个注解？   因为要同时更新商品和订单 等多个数据库表
    public Orders add(Orders orders) {
        User loginUser = SaUtils.getLoginUser();  // 获取当前登录的用户
        // 订单锁怎么做？
        // 类锁 效率很低  只能是一个一个进行，不能保证在同时处理多个订单，张三和李四2个人必须等待前一个人操作完成，后面一个人才能下单
        // 采取分段锁   什么是分段锁  锁是业务编号   比如用户ID  比如订单编号
        Object lock = orderMap.computeIfAbsent(loginUser.getId(), k -> new Object());
        // 加锁  保证同一个人不能并发下单  同一时间只能下单一次
        synchronized (lock) {
            Integer goodsId = orders.getGoodsId();
            Goods goods = goodsService.selectById(goodsId);
            if (ObjectUtil.isNull(goods)) {  // 判断商品是否存在
                throw new CustomException("未找到商品");
            }
            int store = goods.getStore() - orders.getNum();
            if (store < 0) {
                throw new CustomException("商品库存不足");
            }
            // 团购订单  要查询拼团信息
            Integer groupOrderId = orders.getGroupOrderId();  // 待拼团的订单ID
            Orders groupOrder = null;
            if (ObjectUtil.isNotNull(groupOrderId)) {
                groupOrder = this.selectById(groupOrderId);
                if (ObjectUtil.isNull(groupOrder) || !OrderStatusEnum.NOT_PAY.name().equals(groupOrder.getStatus())) {
                    throw new CustomException("拼团已失效");
                }
                if (!orders.getGoodsId().equals(groupOrder.getGoodsId())) {  // 拼的不是一个商品  那就违规了
                    throw new CustomException("拼团信息错误");
                }
            }
            goods.setStore(store);
            goodsService.updateById(goods); // 更新商品的库存

            orders.setGoodsName(goods.getName());
            orders.setGoodsImg(goods.getImg());
            if (OrderTypeEnum.COMMON.name().equals(orders.getType())) {
                // 普通订单
                orders.setGoodsPrice(goods.getOriginPrice());
                orders.setTotal(goods.getOriginPrice().multiply(BigDecimal.valueOf(orders.getNum())));
            } else if (OrderTypeEnum.GROUP.name().equals(orders.getType())) {
                // 团购订单
                orders.setGoodsPrice(goods.getGroupPrice());
                orders.setTotal(goods.getGroupPrice().multiply(BigDecimal.valueOf(orders.getNum())));
            }
            orders.setStatus(OrderStatusEnum.NOT_PAY.name());  // 设置订单为待支付状态
            // 订单唯一标识
            String orderNo = IdUtil.getSnowflakeNextIdStr();
            orders.setOrderNo(orderNo);
            orders.setCreateTime(DateUtil.now());
            orders.setUserId(loginUser.getId());
            // 插入订单数据到数据库
            ordersMapper.insert(orders);
            Integer orderId = orders.getId();  // 把当前的订单ID作为另一个拼团订单的 group_order_id
            if (ObjectUtil.isNotNull(groupOrder)) {
                groupOrder.setGroupOrderId(orderId);
                this.updateById(groupOrder);  // 更新另一个拼团订单的信息
            }
        }

        // 记录日志
        AsyncTaskFactory.recordLog(LogModuleEnum.ORDERS.value, "创建订单", loginUser.getId());
        orderMap.remove(loginUser.getId());  // 解锁
        return orders;
    }

    /**
     * 秒杀下单
     * 高并发：同一时间  出现大量的请求
     * 00:00 这一刻 数以万计的请求会打过来  高并发的解决方式就是限流
     * https://zhuanlan.zhihu.com/p/60979444
     */
    @Transactional
    public Orders addFlashOrder(Orders orders) {
        // 设置阻塞，限制秒杀请求
        // 限流  限制每秒的请求数量 一次通过10个请求
        limiter.acquire();
        User loginUser = SaUtils.getLoginUser();  // 获取当前登录的用户
        // 订单锁怎么做？
        // 类锁 效率很低  只能是一个一个进行，不能保证在同时处理多个订单，张三和李四2个人必须等待前一个人操作完成，后面一个人才能下单
        // 采取分段锁    锁是业务编号   比如用户ID  比如订单编号
        Object lock = orderMap.computeIfAbsent(loginUser.getId(), k -> new Object());
        // 加锁  保证同一个人不能并发下单  同一时间只能下单一次
        synchronized (lock) {
            Integer goodsId = orders.getGoodsId();
            Goods goods = goodsService.selectById(goodsId);
            if (ObjectUtil.isNull(goods)) {  // 判断商品是否存在
                throw new CustomException("未找到商品");
            }
            // 秒杀额度校验
            int flashStore = goods.getFlashNum() - orders.getNum();
            if (flashStore < 0) {
                throw new CustomException("秒杀商品已抢完");
            }
            // 更新秒杀额度
            goods.setFlashNum(flashStore);
            // 商品库存校验
            int store = goods.getStore() - orders.getNum();
            if (store < 0) {
                throw new CustomException("商品库存不足");
            }
            goods.setStore(store);
            goodsService.updateById(goods); // 更新商品的库存

            orders.setGoodsName(goods.getName());
            orders.setGoodsImg(goods.getImg());
            // 秒杀订单
            orders.setGoodsPrice(goods.getFlashPrice());
            orders.setTotal(goods.getFlashPrice().multiply(BigDecimal.valueOf(orders.getNum())));
            orders.setStatus(OrderStatusEnum.NOT_PAY.name());  // 设置订单为待支付状态
            // 订单唯一标识
            String orderNo = IdUtil.getSnowflakeNextIdStr();
            orders.setOrderNo(orderNo);
            orders.setCreateTime(DateUtil.now());
            orders.setUserId(loginUser.getId());
            // 插入订单数据到数据库
            ordersMapper.insert(orders);
        }

        // 记录日志
        AsyncTaskFactory.recordLog(LogModuleEnum.ORDERS.value, "创建订单成功，订单编号：【" + orders.getOrderNo() + "】", loginUser.getId());
        orderMap.remove(loginUser.getId());  // 解锁
        return orders;
    }

    /**
     * 单个删除
     */
    public void deleteById(Integer id) {
        ordersMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            this.deleteById(id);
        }
    }

    /**
     * 更新
     */
    public void updateById(Orders orders) {
        ordersMapper.updateById(orders);
    }

    /**
     * 单个查询
     */
    public Orders selectById(Integer id) {
        return ordersMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Orders> selectAll(Orders orders) {
        return ordersMapper.selectAll(orders);
    }

    /**
     * 分页查询
     */
    public PageInfo<Orders> selectPage(Orders orders, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Orders> list = ordersMapper.selectAll(orders);
        return PageInfo.of(list);
    }

    /**
     * 前台首页分页查询开团订单
     */
    public PageInfo<Orders> selectGroupPage(Orders orders, Integer pageNum, Integer pageSize) throws ParseException {
        PageHelper.startPage(pageNum, pageSize);
        List<Orders> list = ordersMapper.selectAllGroup(orders);
        for (Orders dbOrder : list) {
            if (ObjectUtil.isNotEmpty(dbOrder.getPayTime())) {
                long now = System.currentTimeMillis();
                Date pay = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dbOrder.getPayTime());
                // 开团结束时间默认是支付后24小时
                long gap = pay.getTime() + 24 * 3600 * 1000 - now;
                dbOrder.setMaxTime(gap / 1000);
            }
        }
        return PageInfo.of(list);
    }

    // 等当前的bean加载完成后会执行这个方法
    @Override
    public void afterPropertiesSet() throws Exception {
        limiter = RateLimiter.create(Constants.FLASH_LIMIT_NUM);
    }

    public Orders selectByOrderNo(String orderNo) {
        return ordersMapper.selectByOrderNo(orderNo);
    }

    public List<Orders> selectByStatus(String status) {
        return ordersMapper.selectByStatus(status);
    }

    /**
     * 取消团购订单
     * 发起退款
     * 更改状态为已取消
     */
    @Transactional
    public void closeGroupOrder(Orders orders) {
        // 1. 创建Client，通用SDK提供的Client，负责调用支付宝的API
        AlipayClient alipayClient = new DefaultAlipayClient(Constants.ALIPAY_GATEWAY_URL, aliPayConfig.getAppId(),
                aliPayConfig.getAppPrivateKey(), Constants.ALIPAY_FORMAT, Constants.ALIPAY_CHARSET, aliPayConfig.getAlipayPublicKey(), Constants.ALIPAY_SIGN_TYPE);

        // 2. 创建 Request并设置Request参数
        AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();
        request.setNotifyUrl(aliPayConfig.getNotifyUrl());
        JSONObject bizContent = new JSONObject();
        bizContent.set("out_trade_no", orders.getOrderNo());  // 我们自己生成的订单编号  必须是不重复的退款订单号
        bizContent.set("refund_amount", orders.getTotal()); // 订单的总金额
        bizContent.set("trade_no", orders.getPayNo()); // 支付宝支付订单号
        bizContent.set("out_request_no", IdUtil.fastSimpleUUID());   // 随机数
        request.setBizContent(bizContent.toString());
        try {
            // 退款调用接口
            AlipayTradeRefundResponse response = alipayClient.execute(request);
            if (response.isSuccess()) {
                log.info("订单号【{}】退款成功", orders.getOrderNo());
                // 取消订单
                this.cancel(orders);
            }
        } catch (AlipayApiException e) {
            log.error("退款失败", e);
        }
    }

    /**
     * 取消订单  释放库存
     */
    @Transactional
    public void cancel(Orders orders) {
        orders.setStatus(OrderStatusEnum.CANCEL.name());
        Integer goodsId = orders.getGoodsId();
        Goods goods = goodsService.selectById(goodsId);
        if (ObjectUtil.isNotNull(goods)) {
            goods.setStore(goods.getStore() + orders.getNum());
            goodsService.updateById(goods); // 更新商品库存
        }
        this.updateById(orders); // 更新订单状态
    }

}
