package com.zz624.entry;

public class Order {

  private Integer id;
  private Integer userid;
  private Integer goodsid;
  private Integer number;
  private String color;
  private Double price;
  private String goodsname;
  private String paytime;
  private Integer sex;
  private Integer age;
  private String paydate;
  private Double sumprice;

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


  public String getGoodsname() {
    return goodsname;
  }

  public void setGoodsname(String goodsname) {
    this.goodsname = goodsname;
  }


  public String getPaytime() {
    return paytime;
  }

  public void setPaytime(String paytime) {
    this.paytime = paytime;
  }

  public Integer getSex() {
    return sex;
  }

  public void setSex(Integer sex) {
    this.sex = sex;
  }

  public Integer getAge() {
    return age;
  }

  public void setAge(Integer age) {
    this.age = age;
  }

  public String getPaydate() {
    return paydate;
  }

  public void setPaydate(String paydate) {
    this.paydate = paydate;
  }

  public Double getSumprice() {
    return sumprice;
  }

  public void setSumprice(Double sumprice) {
    this.sumprice = sumprice;
  }

  @Override
  public String toString() {
    return "Order{" +
            "id=" + id +
            ", userid=" + userid +
            ", goodsid=" + goodsid +
            ", number=" + number +
            ", color='" + color + '\'' +
            ", price=" + price +
            ", goodsname='" + goodsname + '\'' +
            ", paytime='" + paytime + '\'' +
            ", sex=" + sex +
            ", age=" + age +
            ", paydate='" + paydate + '\'' +
            ", sumprice=" + sumprice +
            '}';
  }
}
