package com.zz624.controller;

import com.google.gson.Gson;
import com.zz624.biz.GoodsBiz;
import com.zz624.entry.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
public class GoodsController {
    @Autowired
    private GoodsBiz gb;

    @RequestMapping(value="/getAllGoods",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getAllGoods() {
        List<Goods> goodslist = gb.findAllGoods();
        Gson gson = new Gson();
        String json = gson.toJson(goodslist);
        return json;
    }

    @RequestMapping(value="/getGoodsById",produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String getGoodsById(Goods goods) {
        List<Goods> goodslist = gb.findGoodsById(goods);
        Gson gson = new Gson();
        String json = gson.toJson(goodslist);
        System.out.println("json"+json);
        return json;
    }
}
