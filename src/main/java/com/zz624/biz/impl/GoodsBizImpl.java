package com.zz624.biz.impl;

import com.zz624.biz.GoodsBiz;
import com.zz624.dao.GoodsDao;
import com.zz624.entry.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsBizImpl implements GoodsBiz {

    @Autowired
    private GoodsDao gd;

    @Override
    public List<Goods> findAllGoods() {
        return gd.selectAllGoods();
    }

    @Override
    public List<Goods> findGoodsById(Goods goods) {
        return gd.selectGoodsById(goods);
    }
}
