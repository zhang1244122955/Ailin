package com.zz624.dao;

import com.zz624.entry.Shopcar;

import java.util.List;

public interface ShopcarDao {

    //通过用户查询购物车记录
    List<Shopcar> selectShopcarByUserId(Shopcar shopcar);

    //通过用户查询购物车记录
    List<Shopcar> selectShopcarByIds(String ids);


    //通过用户查询购物车记录
    Shopcar selectShopcarByUserIdAndGoodsIdAndColor(Shopcar shopcar);


    // 添加购物车记录
    int insertShopcar(Shopcar shopcar);

    // 修改购物车记录
    int updateShopcar(Shopcar shopcar);

    // 修改购物车数量
    int updateNumber(Shopcar shopcar);

    // 修改购物车状态
    int updateFlag(Shopcar shopcar);

    // 修改购物车状态
    int updateFlagByIds(String ids);
}
