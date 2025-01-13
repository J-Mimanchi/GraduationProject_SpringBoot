package com.myshop.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import com.github.pagehelper.PageInfo;
import com.myshop.common.Result;
import com.myshop.entity.Logs;
import com.myshop.service.LogsService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/logs")
public class LogsController {

    @Resource
    LogsService logsService;

    /**
     * 新增
     */
    @SaCheckRole("ADMIN")
    @PostMapping("/add")
    public Result add(@RequestBody Logs logs) {
        logsService.add(logs);
        return Result.success();
    }

    /**
     * 删除
     */
    @SaCheckRole("ADMIN")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        logsService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @SaCheckRole("ADMIN")
    @DeleteMapping("/deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        logsService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 更新
     */
    @PutMapping("/update")
    public Result update(@RequestBody Logs logs) {
        logsService.updateById(logs);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Logs logs = logsService.selectById(id);
        return Result.success(logs);
    }

    /**
     * 查询所有
     */
    @SaCheckRole("ADMIN")
    @GetMapping("/selectAll")
    public Result selectAll(Logs logs) {
        List<Logs> list = logsService.selectAll(logs);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @SaCheckRole("ADMIN")
    @GetMapping("/selectPage")
    public Result selectPage(Logs logs,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Logs> pageInfo = logsService.selectPage(logs, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
