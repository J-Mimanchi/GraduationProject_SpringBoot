package com.myshop.common.config;

import cn.dev33.satoken.stp.StpInterface;
import com.myshop.entity.User;
import com.myshop.utils.SaUtils;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 自定义权限加载接口实现类
 */
@Component    // 保证此类被 SpringBoot 扫描，完成 Sa-Token 的自定义权限验证扩展
public class StpInterfaceImpl implements StpInterface {

    /**
     * 返回一个账号所拥有的权限码集合
     * /user/add   /user/update
     */
    @Override
    public List<String> getPermissionList(Object o, String s) {
        return List.of();
    }

    /**
     * 返回一个账号所拥有的角色标识集合 (权限与角色可分开校验)
     * ADMIN  USER
     */
    @Override
    public List<String> getRoleList(Object o, String s) {
        User loginUser = SaUtils.getLoginUser();
        return List.of(loginUser.getRole());
    }

}