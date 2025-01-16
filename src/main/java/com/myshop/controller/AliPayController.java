package com.myshop.controller;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.json.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.myshop.common.Constants;
import com.myshop.common.Result;
import com.myshop.common.config.AliPayConfig;
import com.myshop.common.enums.LogModuleEnum;
import com.myshop.common.enums.OrderStatusEnum;
import com.myshop.common.enums.OrderTypeEnum;
import com.myshop.common.system.AsyncTaskFactory;
import com.myshop.entity.Orders;
import com.myshop.exception.CustomException;
import com.myshop.service.OrdersService;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/alipay")
@Slf4j
public class AliPayController {

    @Resource
    private AliPayConfig aliPayConfig;

    @Resource
    private OrdersService ordersService;

    /**
     * 支付接口
     *
     * @param orderNo 订单编号
     */
    @GetMapping("/pay")
    public void pay(String orderNo, HttpServletResponse httpResponse) throws IOException {
        Orders orders = ordersService.selectByOrderNo(orderNo);
        if (ObjectUtil.isNull(orders)) {
            throw new CustomException("未找到订单");
        }
        // 1. 创建Client，通用SDK提供的Client，负责调用支付宝的API
        AlipayClient alipayClient = new DefaultAlipayClient(Constants.ALIPAY_GATEWAY_URL, aliPayConfig.getAppId(),
                aliPayConfig.getAppPrivateKey(), Constants.ALIPAY_FORMAT, Constants.ALIPAY_CHARSET, aliPayConfig.getAlipayPublicKey(), Constants.ALIPAY_SIGN_TYPE);

        // 2. 创建 Request并设置Request参数
        AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();  // 发送请求的 Request类
        request.setNotifyUrl(aliPayConfig.getNotifyUrl());
        JSONObject bizContent = new JSONObject();
        bizContent.set("out_trade_no", orders.getOrderNo());  // 我们自己生成的订单编号
        bizContent.set("total_amount", orders.getTotal()); // 订单的总金额
        bizContent.set("subject", orders.getGoodsName() + "x" + orders.getNum());   // 支付的名称  键盘x1
        bizContent.set("product_code", "FAST_INSTANT_TRADE_PAY");  // 固定配置
        request.setBizContent(bizContent.toString());
        request.setReturnUrl("http://127.0.0.1:5174/front/orders"); // 支付完成后自动跳转到本地页面的路径
        // 执行请求，拿到响应的结果，返回给浏览器
        String form = "";
        try {
            form = alipayClient.pageExecute(request).getBody(); // 调用SDK生成表单
        } catch (AlipayApiException e) {
            log.error("支付失败", e);
        }
        httpResponse.setContentType("text/html;charset=" + Constants.ALIPAY_CHARSET);
        httpResponse.getWriter().write(form);// 直接将完整的表单html输出到页面
        httpResponse.getWriter().flush();
        httpResponse.getWriter().close();

        // 记录日志
        AsyncTaskFactory.recordLog(LogModuleEnum.ORDERS.value, "订单发起支付，订单号【" + orderNo + "】", orders.getUserId());
    }

    /**
     * 支付回调接口
     * 支付宝沙箱网关在支付完成后会调用这个接口返回给我们支付消息
     */
    @PostMapping("/notify")  // 注意这里必须是POST接口
    public void notify(HttpServletRequest request) throws AlipayApiException {
        log.info("=========支付宝异步回调========");
        Map<String, String> params = new HashMap<>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (String name : requestParams.keySet()) {
            params.put(name, request.getParameter(name));
        }

        // 验证签名
        String sign = params.get("sign");
        String content = AlipaySignature.getSignCheckContentV1(params);
        boolean checkSignature = AlipaySignature.rsa256CheckContent(content, sign, aliPayConfig.getAlipayPublicKey(), "UTF-8"); // 验证签名
        // 支付宝验签
        if (checkSignature) {
            // 验签通过
            log.info("交易名称: {}", params.get("subject"));
            log.info("交易状态: {}", params.get("trade_status"));
            log.info("支付宝交易凭证号: {}", params.get("trade_no"));
            log.info("商户订单号: {}", params.get("out_trade_no"));
            log.info("交易金额: {}", params.get("total_amount"));
            log.info("买家在支付宝唯一id: {}", params.get("buyer_id"));
            log.info("买家付款时间: {}", params.get("gmt_payment"));
            log.info("买家付款金额: {}", params.get("buyer_pay_amount"));

            String orderNo = params.get("out_trade_no");  // 我们自己的订单编号
            String gmtPayment = params.get("gmt_payment");  // 支付的时间
            String alipayTradeNo = params.get("trade_no");  // 支付订单号
            String tradeStatus = params.get("trade_status");  // 订单支付的状态
            // 只有支付成功了  我们才会关心后续的流程
            if ("TRADE_SUCCESS".equals(tradeStatus)) {
                Orders orders = ordersService.selectByOrderNo(orderNo);
                if (ObjectUtil.isNull(orders)) {
                    throw new CustomException("未找到订单");
                }
                if (OrderTypeEnum.GROUP.name().equals(orders.getType())) {  // 拼团订单
                    orders.setStatus(OrderStatusEnum.IN_GROUP.name());  // 拼团订单 改成拼团中状态
                    Integer groupOrderId = orders.getGroupOrderId();  // 找到一起拼团的订单
                    if (ObjectUtil.isNotNull(groupOrderId)) {
                        Orders groupOrder = ordersService.selectById(groupOrderId);
                        if (ObjectUtil.isNull(groupOrder)) {
                            throw new CustomException("未找到拼团订单");
                        }
                        groupOrder.setStatus(OrderStatusEnum.NOT_SEND.name());
                        ordersService.updateById(groupOrder);  // 修改一起拼团的订单的状态  待发货
                        orders.setStatus(OrderStatusEnum.NOT_SEND.name());  // 待发货
                    }
                } else {
                    // 普通订单和秒杀订单
                    orders.setStatus(OrderStatusEnum.NOT_SEND.name());  // 支付完成后改成待发货状态
                }
                orders.setPayNo(alipayTradeNo);
                orders.setPayTime(gmtPayment);
                ordersService.updateById(orders);  // 更新订单的支付信息

                // 记录日志
                AsyncTaskFactory.recordLog(LogModuleEnum.ORDERS.value, "订单支付回调成功，订单号【" + orderNo + "】", orders.getUserId());
            }
        }
    }

    /**
     * 退款接口
     */
    @GetMapping("/refund")
    public Result refund(String orderNo) {
        Orders orders = ordersService.selectByOrderNo(orderNo);
        if (ObjectUtil.isNull(orders)) {
            throw new CustomException("未找到订单");
        }
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
            }
            Orders dbOrder = ordersService.selectByOrderNo(orderNo);
            dbOrder.setStatus(OrderStatusEnum.REFUND_DONE.name());
            ordersService.updateById(dbOrder);
        } catch (AlipayApiException e) {
            log.error("退款失败", e);
        }

        // 记录日志
        AsyncTaskFactory.recordLog(LogModuleEnum.ORDERS.value, "订单发起退款，订单号【" + orderNo + "】", orders.getUserId());
        return Result.success();
    }

}
