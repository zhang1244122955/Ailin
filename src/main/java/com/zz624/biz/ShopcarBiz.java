package com.zz624.biz;

import com.zz624.entry.Shopcar;

import java.util.List;

public interface ShopcarBiz {

    //通过用户id查找购物车记录
    List<Shopcar> findShopcarByUserId(Shopcar shopcar);

    //通过用户id查找单条记录
    Shopcar findShopcarByUserIdAndGoodsIdAndColor(Shopcar shopcar);

    // 添加购物车记录
    boolean addShopcar(Shopcar shopcar);

    // 修改购物车记录
    boolean modifyShopcar(Shopcar shopcar);

}
