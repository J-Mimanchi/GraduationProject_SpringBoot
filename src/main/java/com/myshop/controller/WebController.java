package com.myshop.controller;


import com.myshop.common.Result;
import com.myshop.entity.User;
import com.myshop.service.UserService;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
public class WebController {

    @Resource
    private UserService userService;





    /**
     * 登录接口
     */
    @PostMapping("/login")
    public Result login(@RequestBody User user) {
        User dbUser = userService.login(user);
        return Result.success(dbUser);
    }

    /**
     * 注册接口
     */
    @PostMapping("/register")
    public Result register(@RequestBody User user) {
        userService.register(user);
        return Result.success();
    }

    /**
     * 修改密码
     */
    @PutMapping("/updatePassword")
    public Result updatePassword(@RequestBody User user) {
        userService.updatePassword(user);
        return Result.success();
    }

}
