package com.myshop.mapper;

import com.myshop.entity.Category;

import java.util.List;

public interface CategoryMapper {

    /**
     * 新增
     */
    void insert(Category category);

    /**
     * 删除
     */
    void deleteById(Integer id);

    /**
     * 更新
     */
    void updateById(Category category);

    /**
     * 根据ID查询
     */
    Category selectById(Integer id);

    /**
     * 条件查询
     */
    List<Category> selectAll(Category category);

}
