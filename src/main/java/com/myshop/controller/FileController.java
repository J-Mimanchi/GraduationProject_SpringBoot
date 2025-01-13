package com.myshop.controller;

import cn.hutool.core.io.FileUtil;
import com.myshop.common.Result;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@RestController
@RequestMapping("/files")
@Slf4j
public class FileController {
    // 文件上传路径  System.getProperty("user.dir") 获取当前项目路径
    private static final String filePath = System.getProperty("user.dir") + "/files/";
    // yml配置文件定义访问路径
    @Value("${fileBaseUrl}")
    private String fileBaseUrl;
    /**
     * 文件上传
     */
    @PostMapping("/upload")
    public Result upload(MultipartFile file) {
        // 定义文件的唯一标识
        String fileName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
        // 拼接完整的文件存储路径
        String realFilePath = filePath + fileName;
        try {
            // 判断文件夹是否存在，不存在则创建
            if (!FileUtil.isDirectory(filePath)) {
                FileUtil.mkdir(filePath);
            }
            // 写入文件
            FileUtil.writeBytes(file.getBytes(), realFilePath);
        } catch (IOException e) {
            log.error("文件上传错误", e);
        }
        String url = fileBaseUrl + "/files/download/" + fileName;
        return Result.success(url);
    }

    /**
     * 文件下载
     */
    @GetMapping("/download/{fileName}")
    public void download(@PathVariable String fileName, HttpServletResponse response) {//HttpServletResponse response是用来设置响应头的
        OutputStream os;//输出流
        // 设置响应头
        response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, StandardCharsets.UTF_8));
        // 设置响应类型
        response.setContentType("application/octet-stream");
        try {
            // 拼接完整的文件存储路径
            String realFilePath = filePath + fileName;
            // 通过文件的存储路径拿到文件流
            byte[] bytes = FileUtil.readBytes(realFilePath);
            os = response.getOutputStream();
            os.write(bytes);
            os.flush();//刷新缓冲区
            os.close();//关闭输出流
        } catch (IOException e) {
            log.error("文件下载错误", e);
        }
    }
}
