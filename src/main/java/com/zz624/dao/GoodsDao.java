package com.zz624.dao;

import com.zz624.entry.Goods;

import java.util.List;

public interface GoodsDao {
    //查询所有商品
    List<Goods> selectAllGoods();
    //查询商品通过id
    List<Goods> selectGoodsById(Goods goods);
}
