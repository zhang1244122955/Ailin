package com.zz624.entry;


public class Shopcar {

  private Integer id;
  private Integer userid;
  private Integer goodsid;
  private Integer number;
  private Integer flag;
  private String color;
  private Double price;
  private String goodsname;
  private String url;
  private String category;

  public String getGoodsname() {
    return goodsname;
  }

  public void setGoodsname(String goodsname) {
    this.goodsname = goodsname;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public Integer getUserid() {
    return userid;
  }

  public void setUserid(Integer userid) {
    this.userid = userid;
  }


  public Integer getGoodsid() {
    return goodsid;
  }

  public void setGoodsid(Integer goodsid) {
    this.goodsid = goodsid;
  }


  public Integer getNumber() {
    return number;
  }

  public void setNumber(Integer number) {
    this.number = number;
  }


  public Integer getFlag() {
    return flag;
  }

  public void setFlag(Integer flag) {
    this.flag = flag;
  }

  public String getColor() {
    return color;
  }

  public void setColor(String color) {
    this.color = color;
  }

  public Double getPrice() {
    return price;
  }

  public void setPrice(Double price) {
    this.price = price;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  @Override
  public String toString() {
    return "Shopcar{" +
            "id=" + id +
            ", userid=" + userid +
            ", goodsid=" + goodsid +
            ", number=" + number +
            ", flag=" + flag +
            ", color='" + color + '\'' +
            ", price=" + price +
            ", goodsname='" + goodsname + '\'' +
            ", url='" + url + '\'' +
            ", category='" + category + '\'' +
            '}';
  }
}
