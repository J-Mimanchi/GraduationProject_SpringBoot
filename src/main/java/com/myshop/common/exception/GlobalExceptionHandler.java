package com.myshop.common.exception;

import cn.dev33.satoken.exception.SaTokenException;
import com.myshop.common.Result;
import com.myshop.common.enums.ResultCodeEnum;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;


@ControllerAdvice(basePackages = "com.myshop.controller")//指定包
@Slf4j//日志
public class GlobalExceptionHandler {

    @ExceptionHandler(SaTokenException.class)//指定处理的异常
    @ResponseBody//返回json串
    public Result saTokenError(HttpServletRequest request, SaTokenException e){
        log.error("权限异常：",e);
        return Result.error(ResultCodeEnum.TOKEN_INVALID_ERROR.code, ResultCodeEnum.TOKEN_INVALID_ERROR.msg);
    }

    @ExceptionHandler(CustomException.class)//指定处理的异常
    @ResponseBody//返回json串
    public Result customError(HttpServletRequest request, CustomException e){
        log.error("业务异常：",e);
        return Result.error(e.getCode(), e.getMsg());
    }

    //统一异常处理@ExceptionHandler,主要用于Exception
    @ExceptionHandler(Exception.class)//指定处理的异常
    @ResponseBody//返回json串
    public Result error(HttpServletRequest request, Exception e){
        log.error("异常信息：",e);
        return Result.error();
    }

}
