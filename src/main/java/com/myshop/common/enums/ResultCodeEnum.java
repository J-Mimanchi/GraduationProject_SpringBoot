package com.myshop.common.enums;

public enum ResultCodeEnum {
    SUCCESS("200", "请求成功"),
    PARAM_ERROR("400", "参数错误"),
    TOKEN_INVALID_ERROR("401", "请重新登录"),
    SYSTEM_ERROR("500", "系统异常");

    public String code;
    public String msg;

    ResultCodeEnum(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}