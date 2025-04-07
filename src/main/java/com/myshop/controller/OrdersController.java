package com.myshop.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import com.github.pagehelper.PageInfo;
import com.myshop.common.Result;
import com.myshop.entity.Orders;
import com.myshop.entity.User;
import com.myshop.service.OrdersService;
import com.myshop.utils.SaUtils;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrdersController {

    @Resource
    OrdersService ordersService;

    /**
     * 下单
     * 参数：goodsId、num、type、groupOrderId
     */
    @PostMapping("/add")
    public Result add(@RequestBody Orders orders) {
        Orders savedOrders = ordersService.add(orders);
        return Result.success(savedOrders);
    }

    /**
     * 秒杀下单
     * */
    @PostMapping("/addFlashOrder")
    public Result addFlashOrder(@RequestBody Orders orders) {
        Orders savedOrders = ordersService.addFlashOrder(orders);
        return Result.success(savedOrders);
    }

    /**
     * 删除
     */

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        ordersService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */

    @DeleteMapping("/deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        ordersService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 更新
     */
    @PutMapping("/update")
    public Result update(@RequestBody Orders orders) {
        ordersService.updateById(orders);
        return Result.success();
    }

    @GetMapping("/selectMyOrders")
    public Result selectMyOrders(Orders orders,
                                 @RequestParam(defaultValue = "1") Integer pageNum,
                                 @RequestParam(defaultValue = "10") Integer pageSize) {
        // 获取当前登录用户
        User loginUser = SaUtils.getLoginUser();

        // 如果不是管理员，只能查看自己的订单
        if (!"ADMIN".equals(loginUser.getRole())) {
            orders.setUserId(loginUser.getId());
        }

        // 调用服务查询订单
        PageInfo<Orders> pageInfo = ordersService.selectPage(orders, pageNum, pageSize);
        return Result.success(pageInfo);
    }
    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Orders orders = ordersService.selectById(id);
        return Result.success(orders);
    }

    /**
     * 查询所有
     */
    @SaCheckRole("ADMIN")
    @GetMapping("/selectAll")
    public Result selectAll(Orders orders) {
        List<Orders> list = ordersService.selectAll(orders);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Orders orders,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        // 获取当前登录用户
        User loginUser = SaUtils.getLoginUser();
        
        // 如果不是管理员，只能查看自己的订单
        if (!"ADMIN".equals(loginUser.getRole())) {
            orders.setUserId(loginUser.getId());
        }
        
        PageInfo<Orders> pageInfo = ordersService.selectPage(orders, pageNum, pageSize);
        return Result.success(pageInfo);
    }

    /**
     * 根据用户ID查询订单
     */
    @GetMapping("/selectByUserId/{userId}")
    public Result selectByUserId(@PathVariable Integer userId) {
        List<Orders> list = ordersService.selectByUserId(userId);
        return Result.success(list);
    }

    /**
     * 根据用户ID分页查询订单
     */
    @GetMapping("/selectPageByUserId/{userId}")
    public Result selectPageByUserId(@PathVariable Integer userId,
                                    @RequestParam(defaultValue = "1") Integer pageNum,
                                    @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Orders> pageInfo = ordersService.selectPageByUserId(userId, pageNum, pageSize);
        return Result.success(pageInfo);
    }

    /**
     * 前台分页查询团购订单信息
     */
    @GetMapping("/selectGroupPage")
    public Result selectGroupPage(Orders orders,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) throws ParseException {
        PageInfo<Orders> pageInfo = ordersService.selectGroupPage(orders, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
