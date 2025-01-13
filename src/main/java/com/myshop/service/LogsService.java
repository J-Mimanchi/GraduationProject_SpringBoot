package com.myshop.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myshop.entity.Logs;
import com.myshop.mapper.LogsMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogsService {

    @Resource
    private LogsMapper logsMapper;


    /**
     * 新增
     */
    public void add(Logs logs) {
        logsMapper.insert(logs);
    }

    /**
     * 单个删除
     */
    public void deleteById(Integer id) {
        logsMapper.deleteById(id);
    }

    /**
     * 批量删除
     */
    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            this.deleteById(id);
        }
    }

    /**
     * 更新
     */
    public void updateById(Logs logs) {
        logsMapper.updateById(logs);
    }

    /**
     * 单个查询
     */
    public Logs selectById(Integer id) {
        return logsMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Logs> selectAll(Logs logs) {
        return logsMapper.selectAll(logs);
    }

    /**
     * 分页查询
     */
    public PageInfo<Logs> selectPage(Logs logs, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Logs> list = logsMapper.selectAll(logs);
        return PageInfo.of(list);
    }

}
