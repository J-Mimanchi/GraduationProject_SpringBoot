package com.myshop.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myshop.entity.Carousel;
import com.myshop.mapper.CarouselMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarouselService {
    
    @Resource
    private CarouselMapper carouselMapper;


    /**
     * 新增
     */
    public void add(Carousel carousel) {
        carouselMapper.insert(carousel);
    }

    /**
     * 单个删除
     */
    public void deleteById(Integer id) {
        carouselMapper.deleteById(id);
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
    public void updateById(Carousel carousel) {
        carouselMapper.updateById(carousel);
    }

    /**
     * 单个查询
     */
    public Carousel selectById(Integer id) {
        return carouselMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Carousel> selectAll(Carousel carousel) {
        return carouselMapper.selectAll(carousel);
    }

    /**
     * 分页查询
     */
    public PageInfo<Carousel> selectPage(Carousel carousel, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Carousel> list = carouselMapper.selectAll(carousel);
        return PageInfo.of(list);
    }

}
