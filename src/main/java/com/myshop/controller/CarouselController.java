package com.myshop.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import com.github.pagehelper.PageInfo;
import com.myshop.common.Result;
import com.myshop.entity.Carousel;
import com.myshop.service.CarouselService;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/carousel")
public class CarouselController {

    @Resource
    CarouselService carouselService;

    /**
     * 新增
     */
    @SaCheckRole("ADMIN")
    @PostMapping("/add")
    public Result add(@RequestBody Carousel carousel) {
        carouselService.add(carousel);
        return Result.success();
    }

    /**
     * 删除
     */
    @SaCheckRole("ADMIN")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        carouselService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @SaCheckRole("ADMIN")
    @DeleteMapping("/deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        carouselService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 更新
     */
    @PutMapping("/update")
    public Result update(@RequestBody Carousel carousel) {
        carouselService.updateById(carousel);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Carousel carousel = carouselService.selectById(id);
        return Result.success(carousel);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Carousel carousel) {
        List<Carousel> list = carouselService.selectAll(carousel);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @SaCheckRole("ADMIN")
    @GetMapping("/selectPage")
    public Result selectPage(Carousel carousel,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Carousel> pageInfo = carouselService.selectPage(carousel, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
