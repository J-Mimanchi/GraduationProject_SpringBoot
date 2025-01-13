package com.myshop.common.config;

import cn.dev33.satoken.interceptor.SaInterceptor;
import cn.dev33.satoken.stp.StpUtil;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//打开拦截器
@Configuration
public class WebConfig implements WebMvcConfigurer {
    // 注册拦截器
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 注册 Sa-Token 拦截器，校验规则为 StpUtil.checkLogin() 登录校验。
        registry.addInterceptor(new SaInterceptor(handle -> StpUtil.checkLogin()))
                .addPathPatterns("/**")
                .excludePathPatterns("/files/download/**")
                .excludePathPatterns("/login")
                .excludePathPatterns("/register")
                .excludePathPatterns("/captcha")
                .excludePathPatterns("/captcha")
                .excludePathPatterns("/alipay/**")
                .excludePathPatterns("/carousel/selectAll")
                .excludePathPatterns("/category/selectAll")
                .excludePathPatterns("/goods/selectFlash")
                .excludePathPatterns("/goods/selectPage")
                .excludePathPatterns("/goods/selectById/**")
                .excludePathPatterns("/orders/selectGroupPage")
                .excludePathPatterns("/comment/selectAll")
        ;
    }
}
