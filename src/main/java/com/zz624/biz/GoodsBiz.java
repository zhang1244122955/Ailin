package com.zz624.biz;

import com.zz624.entry.Goods;

import java.util.List;

public interface GoodsBiz {
    //查询所有商品
    List<Goods> findAllGoods();
    //查询商品通过id
    List<Goods> findGoodsById(Goods goods);
}
