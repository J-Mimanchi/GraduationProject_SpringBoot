package com.myshop.exception;

import com.myshop.common.enums.ResultCodeEnum;
import lombok.Data;

@Data
public class CustomException extends RuntimeException{
    private String code;
    private String msg;

    public CustomException(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public CustomException(String msg) {
        this.code = ResultCodeEnum.SYSTEM_ERROR.code;
        this.msg = msg;
    }

    public CustomException(ResultCodeEnum resultCodeEnum) {
        this.code = resultCodeEnum.code;
        this.msg = resultCodeEnum.msg;
    }

}
