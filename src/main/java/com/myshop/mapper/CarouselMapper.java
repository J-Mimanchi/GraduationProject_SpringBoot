package com.myshop.mapper;

import com.myshop.entity.Carousel;

import java.util.List;

public interface CarouselMapper {

    /**
     * 新增
     */
    void insert(Carousel carousel);

    /**
     * 删除
     */
    void deleteById(Integer id);

    /**
     * 更新
     */
    void updateById(Carousel carousel);

    /**
     * 根据ID查询
     */
    Carousel selectById(Integer id);

    /**
     * 条件查询
     */
    List<Carousel> selectAll(Carousel carousel);

}
