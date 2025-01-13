package com.myshop.entity;

import lombok.Data;

@Data
public class Carousel {
    private Integer id;
    private Integer goodsId;
    private String img;

    private String goodsName;
}
