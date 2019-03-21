package com.zz624.entry;

import java.util.List;

public class Goods {
    private Integer id;
    private String goodsname;
    private String imagesrc;
    private List<GoodsDetail> details;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getImagesrc() {
        return imagesrc;
    }

    public void setImagesrc(String imagesrc) {
        this.imagesrc = imagesrc;
    }

    public List<GoodsDetail> getDetails() {
        return details;
    }

    public void setDetails(List<GoodsDetail> details) {
        this.details = details;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id=" + id +
                ", goodsname='" + goodsname + '\'' +
                ", imagesrc='" + imagesrc + '\'' +
                ", details=" + details +
                '}';
    }
}
