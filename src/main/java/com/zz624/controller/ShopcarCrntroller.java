package com.zz624.controller;

import com.google.gson.Gson;
import com.zz624.biz.ShopcarBiz;
import com.zz624.entry.Shopcar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class ShopcarCrntroller {

    @Autowired
    private ShopcarBiz sb;

    @RequestMapping(value = "/getShopcarByUserId", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getShopcarByUserId(Shopcar shopcar) {
        List<Shopcar> shopcarList = sb.findShopcarByUserId(shopcar);
        Gson gson = new Gson();
        String json = gson.toJson(shopcarList);
        return json;
    }

    @RequestMapping(value = "/setShopcarByUserId", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String setShopcarByUserId(Shopcar shopcar) {
        System.out.println("shopcar" + shopcar.toString());
        Shopcar sc = sb.findShopcarByUserIdAndGoodsIdAndColor(shopcar);
        if (sc != null) {
            sc.setNumber(sc.getNumber() + shopcar.getNumber());
            //修改
            if (sb.modifyShopcar(sc)) {
                return "000";
            } else {
                return "001";
            }
        } else {
            //添加
            if (sb.addShopcar(shopcar)) {
                return "000";
            } else {
                return "001";
            }
        }

    }

    @RequestMapping(value = "/setShopcarNumber", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String setShopcarNumber(Shopcar shopcar) {
        System.out.println("shopcar" + shopcar.toString());

        if (sb.modifyNumber(shopcar)) {
            return "000";
        } else {
            return "001";
        }
    }

    @RequestMapping(value = "/setShopcarFlag", produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String setShopcarFlag(Shopcar shopcar) {
        System.out.println("shopcar" + shopcar.toString());

        if (sb.modifyFlag(shopcar)) {
            return "000";
        } else {
            return "001";
        }
    }

}
