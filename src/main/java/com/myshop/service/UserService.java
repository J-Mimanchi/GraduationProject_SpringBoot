package com.myshop.service;

import cn.dev33.satoken.stp.StpUtil;
import cn.hutool.crypto.SecureUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myshop.common.Constants;
import com.myshop.common.enums.LogModuleEnum;
import com.myshop.common.enums.RoleEnum;
import com.myshop.common.exception.CustomException;
import com.myshop.common.system.AsyncTaskFactory;
import com.myshop.entity.User;
import com.myshop.mapper.UserMapper;
import com.myshop.utils.SaUtils;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.List;


@Service
public class UserService {

    @Resource
    private UserMapper userMapper;

    /**
     * 密码加密
     */
    private String securePassword(String password) {
        return SecureUtil.md5(password + Constants.PASSWORD_SALT);
    }
    /**
     * 登录
     */
    public User login(User user) {
        String username = user.getUsername();
        // 从数据库查询的数据不一定是非null的，如果是null那么就会报 NULLPOINTEXCEPTION
        User dbUser = userMapper.selectByUsername(username);
        if (dbUser == null) {
            throw new CustomException("用户名或密码错误");
        }
        //密码加盐
        String md5Password = securePassword(user.getPassword());
        if (!md5Password.equals(dbUser.getPassword())) {
            throw new CustomException("用户名或密码错误");
        }
        // 返回token
        StpUtil.login(dbUser.getId());
        String token = StpUtil.getTokenValue();
        dbUser.setToken(token);

        //异步记录日志
        AsyncTaskFactory.recordLog(LogModuleEnum.USER.value, "登录", dbUser.getId());
        return dbUser;
    }
    /**
     * 注册
     */
    public void register(User user) {
        user.setRole(RoleEnum.USER.name());
        // 加密
        user.setPassword(securePassword(user.getPassword()));
        this.add(user);

        //异步记录日志
        AsyncTaskFactory.recordLog(LogModuleEnum.USER.value, "注册", user.getId());
    }
    /**
     * 添加用户
     */
    public void add(User user) {
        if(ObjectUtils.isEmpty(user.getUsername())){
            throw new CustomException("用户名不能为空");
        }
        if(ObjectUtils.isEmpty((user.getRole()))){
            throw new CustomException("角色不能为空");
        }
        User dbUser = userMapper.selectByUsername(user.getUsername());
        if (dbUser != null) {
            throw new CustomException("用户名已存在");
        }
        if(ObjectUtils.isEmpty(user.getPassword())){
            //设置默认密码
            user.setPassword(securePassword(Constants.DEFAULT_PASSWORD));
        }
        if(ObjectUtils.isEmpty(user.getName())){
            //设置默认昵称
            user.setName(user.getUsername());
        }
        userMapper.insert(user);
    }
    /**
     * 修改密码
     */
    public void updatePassword(User user) {
        User dbUser = userMapper.selectByUsername(user.getUsername());
        if (ObjectUtils.isEmpty(dbUser)) {
            throw new CustomException("账户不存在");
        }
        //如果是管理员则不需要验证原密码，如果是普通用户则需要验证原密码
        User loginUser = SaUtils.getLoginUser();
        if(RoleEnum.USER.name().equals(loginUser.getRole())){//校对用户角色
            String md5Password = securePassword(user.getPassword());
            if (!dbUser.getPassword().equals(md5Password)) {
                throw new CustomException("原密码错误");
            }
        }
        user.setPassword(securePassword(user.getNewPassword()));
        userMapper.updatePassword(user);

        //异步记录日志
        AsyncTaskFactory.recordLog(LogModuleEnum.USER.value, "修改密码", loginUser.getId());
    }
    /**
     * 删除用户
     */
    public void deleteById(Integer id) {
        userMapper.deleteById(id);
    }
    /**
     * 批量删除用户
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            this.deleteById(id);
        }
    }
    /**
     * 更新用户
     */
    public void updateById(User user) {
        userMapper.updateById(user);
    }
    /**
     * 查询所有用户
     */
    public List<User> selectAll(User user) {
        return userMapper.selectAll(user);
    }
    /**
     * 根据id查询用户
     */
    public User selectById(Integer id) {
        return userMapper.selectById(id);
    }
    /**
     * 分页查询
     */
    public PageInfo<User> selectPage(User user, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> list = userMapper.selectAll(user);
        return PageInfo.of(list);
    }


}
