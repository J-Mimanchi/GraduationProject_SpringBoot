package com.myshop.mapper;

import com.myshop.entity.Comment;

import java.util.List;

public interface CommentMapper {

    /**
     * 新增
     */
    void insert(Comment comment);

    /**
     * 删除
     */
    void deleteById(Integer id);

    /**
     * 更新
     */
    void updateById(Comment comment);

    /**
     * 根据ID查询
     */
    Comment selectById(Integer id);

    /**
     * 条件查询
     */
    List<Comment> selectAll(Comment comment);

}
