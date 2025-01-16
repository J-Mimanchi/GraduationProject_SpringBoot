package com.myshop.common;

/**
 * 常量类
 */
public interface Constants {

    // 密码加密盐
    String PASSWORD_SALT = "80C61B1B1FDA5B5D825628FD1298D087";
    // 默认密码
    String DEFAULT_PASSWORD = "123";

    // redis key
    String REDIS_KEY_CAPTCHA = "captcha_code:";
    // 验证码过期的时间，单位：分钟
    int CAPTCHA_EXPIRE_MINUTES = 1;

    /**
     * 秒杀限额 10
     */
    Integer FLASH_LIMIT_NUM = 10;

    // 支付宝沙箱网关地址
    String ALIPAY_GATEWAY_URL = "https://openapi-sandbox.dl.alipaydev.com/gateway.do";
    String ALIPAY_FORMAT = "JSON";
    String ALIPAY_CHARSET = "UTF-8";
    String ALIPAY_SIGN_TYPE = "RSA2";

}
