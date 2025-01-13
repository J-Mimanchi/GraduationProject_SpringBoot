package com.myshop.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import com.github.pagehelper.PageInfo;
import com.myshop.common.Result;
import com.myshop.entity.Goods;
import com.myshop.service.GoodsService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.util.List;

@RestController
@RequestMapping("/goods")
public class GoodsController {

    @Resource
    GoodsService goodsService;

    /**
     * 新增
     */
    @SaCheckRole("ADMIN")
    @PostMapping("/add")
    public Result add(@RequestBody Goods goods) {
        goodsService.add(goods);
        return Result.success();
    }

    /**
     * 删除
     */
    @SaCheckRole("ADMIN")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        goodsService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @SaCheckRole("ADMIN")
    @DeleteMapping("/deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        goodsService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 更新
     */
    @PutMapping("/update")
    public Result update(@RequestBody Goods goods) {
        goodsService.updateById(goods);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Goods goods = goodsService.selectById(id);
        return Result.success(goods);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Goods goods) {
        List<Goods> list = goodsService.selectAll(goods);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @SaCheckRole("ADMIN")
    @GetMapping("/selectPage")
    public Result selectPage(Goods goods,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) throws ParseException {
        PageInfo<Goods> pageInfo = goodsService.selectPage(goods, pageNum, pageSize);
        return Result.success(pageInfo);
    }

    /**
     * 查询秒杀商品（限量2个）
     */
    @GetMapping("/selectFlash")
    public Result selectFlash(Goods goods) throws ParseException {
        List<Goods> list = goodsService.selectFlash(goods);
        return Result.success(list);
    }

}
