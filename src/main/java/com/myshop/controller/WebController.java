package com.myshop.controller;


import cn.hutool.core.codec.Base64;
import cn.hutool.core.util.IdUtil;
import com.google.code.kaptcha.Producer;
import com.myshop.common.Constants;
import com.myshop.common.Result;
import com.myshop.entity.User;
import com.myshop.service.UserService;
import com.myshop.utils.RedisUtils;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@Slf4j
public class WebController {

    @Resource
    private UserService userService;

    @Resource
    private Producer producer;

    /**
     * 获取图形算术验证码
     */
    @GetMapping("/captcha")
    public Result getCaptcha() {
        // 验证码存储到redis
        String uuid = IdUtil.fastSimpleUUID();//生成一个uuid返回给前端
        String captchaKey = Constants.REDIS_KEY_CAPTCHA + uuid;

        // 1+1=2   1+1@2
        String captchaText = producer.createText();//创建验证码
        String captchaStr = captchaText.substring(0, captchaText.lastIndexOf("@"));//截取算术运算的表达式一直到@之前
        String captchaCode = captchaText.substring(captchaText.lastIndexOf("@") + 1);//截取表达式的结果
        // 将算术运算结果存储到redis
        RedisUtils.setCacheObject(captchaKey, captchaCode, Constants.CAPTCHA_EXPIRE_MINUTES, TimeUnit.MINUTES);
        // 返回图片的base64编码
        try (FastByteArrayOutputStream outputStream = new FastByteArrayOutputStream()){
            BufferedImage image = producer.createImage(captchaStr);//创建图片
            ImageIO.write(image, "jpg", outputStream);//将图片写入到输出流
            Map<String, Object> map = new HashMap<>();
            map.put("uuid", uuid);
            map.put("img", Base64.encode(outputStream.toByteArray()));//将图片转换为base64编码
            return Result.success(map);
        } catch (Exception e) {
            log.error("生成验证码错误", e);
            return Result.error("获取验证码错误");
        }
    }


    /**
     * 登录接口
     */
    @PostMapping("/login")
    public Result login(@RequestBody User user) {
        User dbUser = userService.login(user);
        return Result.success(dbUser);
    }

    /**
     * 注册接口
     */
    @PostMapping("/register")
    public Result register(@RequestBody User user) {
        userService.register(user);
        return Result.success();
    }

    /**
     * 修改密码
     */
    @PutMapping("/updatePassword")
    public Result updatePassword(@RequestBody User user) {
        userService.updatePassword(user);
        return Result.success();
    }

}
