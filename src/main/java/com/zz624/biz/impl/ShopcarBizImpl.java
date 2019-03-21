package com.zz624.biz.impl;

import com.zz624.biz.ShopcarBiz;
import com.zz624.dao.ShopcarDao;
import com.zz624.entry.Shopcar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopcarBizImpl implements ShopcarBiz {

    @Autowired
    private ShopcarDao sd;

    @Override
    public List<Shopcar> findShopcarByUserId(Shopcar shopcar) {
        return sd.selectShopcarByUserId(shopcar);
    }
    @Override
    public Shopcar findShopcarByUserIdAndGoodsIdAndColor(Shopcar shopcar) {
        return sd.selectShopcarByUserIdAndGoodsIdAndColor(shopcar);
    }

    @Override
    public boolean addShopcar(Shopcar shopcar) {
        int i = sd.insertShopcar(shopcar);
        if (i > 0) {
            return true;
        }
        return false;
    }

    @Override
    public boolean modifyShopcar(Shopcar shopcar) {
        int i = sd.updateShopcar(shopcar);
        if (i > 0) {
            return true;
        }
        return false;
    }
}
