package com.myshop.service;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ObjectUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.myshop.entity.Goods;
import com.myshop.mapper.GoodsMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class GoodsService {
    
    @Resource
    private GoodsMapper goodsMapper;


    /**
     * 新增
     */
    public void add(Goods goods) {
        goods.setDate(DateUtil.today());
        goodsMapper.insert(goods);
    }

    /**
     * 单个删除
     */
    public void deleteById(Integer id) {
        goodsMapper.deleteById(id);
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
    public void updateById(Goods goods) {
        goodsMapper.updateById(goods);
    }

    /**
     * 单个查询
     */
    public Goods selectById(Integer id) {
        return goodsMapper.selectById(id);
    }

    /**
     * 查询所有
     */
    public List<Goods> selectAll(Goods goods) {
        return goodsMapper.selectAll(goods);
    }

    /**
     * 分页查询
     */
    public PageInfo<Goods> selectPage(Goods goods, Integer pageNum, Integer pageSize) throws ParseException {
        PageHelper.startPage(pageNum, pageSize);
        List<Goods> list = goodsMapper.selectAll(goods);
        extracted(list);
        return PageInfo.of(list);
    }

    public List<Goods> selectFlash(Goods goods) throws ParseException {
        List<Goods> list = goodsMapper.selectAll(goods);
        extracted(list);
        return list.size() > 2 ? list.subList(0, 2) : list;
    }

    private static void extracted(List<Goods> list) throws ParseException {
        for (Goods dbGoods : list) {
            // 计算出该秒杀商品剩余的时间（秒）
            if (dbGoods.getHasFlash() && ObjectUtil.isNotEmpty(dbGoods.getFlashTime())) {
                long now = System.currentTimeMillis();
                Date end = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dbGoods.getFlashTime());
                long gap = (end.getTime() - now) / 1000;
                dbGoods.setMaxTime(gap);
            }
        }
    }
}
