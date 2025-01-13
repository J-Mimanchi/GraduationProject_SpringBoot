package com.myshop.common.system;

import cn.hutool.core.date.DateUtil;
import com.myshop.entity.Logs;
import com.myshop.mapper.LogsMapper;
import com.myshop.utils.IpUtils;
import com.myshop.utils.SpringUtils;

import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.Timer;

/**
 * 管理所有多线程任务的线程执行工厂
 */
public class AsyncTaskFactory {

    // 获取Spring管理的线程池
    private static final ThreadPoolTaskExecutor EXECUTOR = SpringUtils.getBean("threadPoolTaskExecutor");

    /**
     * 定义多线程执行任务
     * 记录日志
     * 模块、操作、操作人的ID、IP、操作时间
     */
    public static void recordLog(String module, String operate, Integer userId) {
        String ip = IpUtils.getIpAddr();// 获取请求的IP
        EXECUTOR.execute(() -> {
            // 创建日志对象  存储到数据库
            Logs logs = Logs.builder()
                    .module(module)
                    .operate(operate)
                    .userId(userId)
                    .ip(ip)
                    .time(DateUtil.now())
                    .build();
            LogsMapper logsMapper = SpringUtils.getBean(LogsMapper.class);
            logsMapper.insert(logs);
        });
    }

}