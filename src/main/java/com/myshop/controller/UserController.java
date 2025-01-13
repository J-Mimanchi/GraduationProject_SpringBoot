package com.myshop.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import com.github.pagehelper.PageInfo;
import com.myshop.common.Result;
import com.myshop.entity.User;
import com.myshop.service.UserService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    UserService userService;
    /**
     * 添加用户
     */
    @SaCheckRole("ADMIN")
    @PostMapping("/add")
    public Result add(@RequestBody User user) {
        userService.add(user);
        return Result.success("添加成功");
    }
    /**
     * 删除用户
     */
    @SaCheckRole("ADMIN")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        userService.deleteById(id);
        return Result.success("删除成功");
    }
    /**
     * 批量删除用户
     */
    @SaCheckRole("ADMIN")
    @DeleteMapping("/deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        userService.deleteBatch(ids);
        return Result.success("删除成功");
    }
    /**
     * 更新用户
     */
    @PutMapping("/update")
    public Result update(@RequestBody User user) {
        userService.updateById(user);
        return Result.success("更新成功");
    }
    /**
     * 根据id查询用户
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        User user = userService.selectById(id);
        return Result.success(user);
    }
    /**
     * 查询所有用户
     */
    @SaCheckRole("ADMIN")
    @GetMapping("/selectAll")
    public Result selectAll(User user) {
        List<User> list = userService.selectAll(user);
        return Result.success(list);
    }
    /**
     * 分页查询
     */
    @SaCheckRole("ADMIN")
    @GetMapping("/selectPage")
    public Result selectPage(User user,
                               @RequestParam(defaultValue = "1") Integer pageNum,
                               @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<User> pageInfo = userService.selectPage(user, pageNum, pageSize);
        return Result.success(pageInfo);
    }
}
