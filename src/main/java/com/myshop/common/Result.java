package com.myshop.common;

import lombok.Data;

@Data
public class Result {

    private static final String CODE_SUCCESS = "200";
    private static final String CODE_ERROR = "500";
    private static final String MSG_SUCCESS = "请求成功";
    private static final String MSG_ERROR = "请求失败";

    private String code;  // 200 表示请求成功  除了200之外的码表示请求失败
    private String msg;   // 请求失败的原因
    private Object data;  // 这是后端返回的数据

    public static Result result(String code, String msg) {
        Result result = new Result();
        result.setCode(code);
        result.setMsg(msg);
        return result;
    }

    public static Result success() {
        return result(CODE_SUCCESS, MSG_SUCCESS);
    }

    public static Result success(Object data) {
        Result result = result(CODE_SUCCESS, MSG_SUCCESS);
        result.setData(data);
        return result;
    }

    public static Result error() {
        return error(MSG_ERROR);
    }

    public static Result error(String msg) {
        return result(CODE_ERROR, msg);
    }

    public static Result error(String code, String msg) {
        return result(code, msg);
    }
}
