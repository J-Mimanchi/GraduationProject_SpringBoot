package com.myshop.entity;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 订单信息
 */
@Data
public class Orders {
    /** ID */
    private Integer id;
    /** 商品ID */
    private Integer goodsId;
    /** 商品名称 */
    private String goodsName;
    /** 商品图片 */
    private String goodsImg;
    /** 商品单价 */
    private BigDecimal goodsPrice;
    /** 购买数量 */
    private Integer num;
    /** 商品总价 */
    private BigDecimal total;
    /** 订单编号 */
    private String orderNo;
    /** 创建人ID */
    private Integer userId;
    /** 创建时间 */
    private String createTime;
    /** 支付单号 */
    private String payNo;
    /** 支付时间 */
    private String payTime;
    /** 订单状态 */
    private String status;
    /** 订单类型 COMMON  GROUP  FLASH */
    private String type;
    /** 正在拼团的订单ID */
    private Integer groupOrderId;
    /** 收货人姓名 */
    private String receiverName;
    /** 收货人手机号 */
    private String receiverPhone;
    /** 收货地址 */
    private String receiverAddress;

    private String userName;
    private String userAvatar;
    private Long maxTime;

}
