package com.myshop.mapper;

import com.myshop.entity.User;
import org.apache.ibatis.annotations.Update;

import java.util.List;


public interface UserMapper {

    /**
     * 根据用户名查询
     */
    User selectByUsername(String username);

    /**
     * 新增
     */
    void insert(User user);

    /**
     * 删除
     */
    void deleteById(Integer id);

    /**
     * 更新
     */
    void updateById(User user);

    /**
     * 根据ID查询
     */
    User selectById(Integer id);

    /**
     * 条件查询
     */
    List<User> selectAll(User user);

    @Update("update user set password = #{newPassword} where username = #{username}")
    void updatePassword(User user);

}
