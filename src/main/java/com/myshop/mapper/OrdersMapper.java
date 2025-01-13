package com.myshop.mapper;

import com.myshop.entity.Orders;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrdersMapper {

    /**
     * 新增
     */
    void insert(Orders orders);

    /**
     * 删除
     */
    void deleteById(Integer id);

    /**
     * 更新
     */
    void updateById(Orders orders);

    /**
     * 根据ID查询
     */
    Orders selectById(Integer id);

    /**
     * 条件查询
     */
    List<Orders> selectAll(Orders orders);

    @Select("select * from orders where order_no = #{orderNo}")
    Orders selectByOrderNo(String orderNo);

    @Select("select * from orders where status = #{status}")
    List<Orders> selectByStatus(String status);

    List<Orders> selectAllGroup(Orders orders);
}
