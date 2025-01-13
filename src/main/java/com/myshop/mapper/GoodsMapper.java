package com.myshop.mapper;

import com.myshop.entity.Goods;

import java.util.List;

public interface GoodsMapper {

    /**
     * 新增
     */
    void insert(Goods goods);

    /**
     * 删除
     */
    void deleteById(Integer id);

    /**
     * 更新
     */
    void updateById(Goods goods);

    /**
     * 根据ID查询
     */
    Goods selectById(Integer id);

    /**
     * 条件查询
     */
    List<Goods> selectAll(Goods goods);

}
