package com.myshop.mapper;

import com.myshop.entity.Logs;

import java.util.List;

public interface LogsMapper {

    /**
     * 新增
     */
    void insert(Logs logs);

    /**
     * 删除
     */
    void deleteById(Integer id);

    /**
     * 更新
     */
    void updateById(Logs logs);

    /**
     * 根据ID查询
     */
    Logs selectById(Integer id);

    /**
     * 条件查询
     */
    List<Logs> selectAll(Logs logs);

}
