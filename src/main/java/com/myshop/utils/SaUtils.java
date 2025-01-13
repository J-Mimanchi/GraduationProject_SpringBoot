package com.myshop.utils;

import cn.dev33.satoken.stp.StpUtil;
import com.myshop.entity.User;
import com.myshop.mapper.UserMapper;

/**
 * Sa-Token工具类
 */
public class SaUtils {
    /**
     * 获取当前的登录用户
     */
    public static User getLoginUser() {
        Object loginId = StpUtil.getLoginId();
        if (loginId != null) {
            Integer userId = Integer.valueOf(loginId.toString());// 转换为int
            UserMapper userMapper = SpringUtils.getBean(UserMapper.class);// 获取UserMapper
            return userMapper.selectById(userId);
        }
        return null;
    }

}
