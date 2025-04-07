package com.myshop.controller;

import cn.dev33.satoken.annotation.SaCheckRole;
import com.github.pagehelper.PageInfo;
import com.myshop.common.Result;
import com.myshop.entity.Comment;
import com.myshop.entity.User;
import com.myshop.service.CommentService;
import com.myshop.utils.SaUtils;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/comment")
public class CommentController {

    @Resource
    CommentService commentService;

    /**
     * 新增
     */

    @PostMapping("/add")
    public Result add(@RequestBody Comment comment) {
        commentService.add(comment);
        return Result.success();
    }

    /**
     * 删除
     */

    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        // 获取当前登录用户
        User loginUser = SaUtils.getLoginUser();
        
        // 获取要删除的评论
        Comment comment = commentService.selectById(id);
        if (comment == null) {
            return Result.error("评论不存在");
        }
        
        // 如果不是管理员，只能删除自己的评论
        if (!"ADMIN".equals(loginUser.getRole()) && !comment.getUserId().equals(loginUser.getId())) {
            return Result.error("您没有权限删除此评论");
        }
        
        commentService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @SaCheckRole("ADMIN")
    @DeleteMapping("/deleteBatch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        commentService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 更新
     */
    @PutMapping("/update")
    public Result update(@RequestBody Comment comment) {
        commentService.updateById(comment);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Comment comment = commentService.selectById(id);
        return Result.success(comment);
    }

    /**
     * 查询所有
     */
   // @SaCheckRole("ADMIN")
    @GetMapping("/selectAll")
    public Result selectAll(Comment comment) {
        List<Comment> list = commentService.selectAll(comment);
        return Result.success(list);
    }

    /**
     * 分页查询
     */

    @GetMapping("/selectPage")
    public Result selectPage(Comment comment,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        // 获取当前登录用户
        User loginUser = SaUtils.getLoginUser();
        
        // 如果不是管理员，只能查看自己的评价
        if (!"ADMIN".equals(loginUser.getRole())) {
            comment.setUserId(loginUser.getId());
        }
        
        PageInfo<Comment> pageInfo = commentService.selectPage(comment, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
