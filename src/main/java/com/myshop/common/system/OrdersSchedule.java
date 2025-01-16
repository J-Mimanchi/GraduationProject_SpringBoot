package com.myshop.common.system;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import com.myshop.common.enums.OrderStatusEnum;
import com.myshop.entity.Orders;
import com.myshop.service.OrdersService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * 处理订单相关的定时任务
 */
@Component
@Slf4j
public class OrdersSchedule {

    @Resource
    private OrdersService ordersService;

    /**
     * 1分钟执行一次  取消过期订单
     * cron表达式  设置定时规则
     */
    @Scheduled(fixedRate = 1, timeUnit = TimeUnit.MINUTES)
    public void orderTask() {
        log.info("===============================定时任务【取消过期的订单】开始=================================");
        // 查询待支付的订单  待支付的订单 15分钟过期
        List<Orders> notPayOrderList = ordersService.selectByStatus(OrderStatusEnum.NOT_PAY.name());
        for (Orders orders : notPayOrderList) {
            String createTime = orders.getCreateTime();  // 订单的创建时间
            DateTime dateTime = DateUtil.parseDateTime(createTime);
            long between = new Date().getTime() - dateTime.getTime();
            if (between >= 900000) {   // 15 * 60 * 1000 = 900000  15分钟
                ordersService.cancel(orders);
            }
        }
        // 拼团中的订单  24小时过期
        List<Orders> inGroupOrderList = ordersService.selectByStatus(OrderStatusEnum.IN_GROUP.name());
        for (Orders orders : inGroupOrderList) {
            String payTime = orders.getPayTime();  // 支付成功表示拼团成功
            DateTime dateTime = DateUtil.parseDateTime(payTime);
            long between = new Date().getTime() - dateTime.getTime();
            if (between >= 86400000) {  // 24 * 60 * 60 * 1000 = 86400000 24小时
                // 取消团购  要先发起退款  再改状态
                ordersService.closeGroupOrder(orders);
            }
        }
        log.info("===============================定时任务【取消过期的订单】结束=================================");
    }

}
