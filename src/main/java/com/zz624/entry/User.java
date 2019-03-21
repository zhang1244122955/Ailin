package com.zz624.entry;


public class User {

    private Integer id;
    private String phone;
    private Integer sex;
    private Integer age;
    private String name;
    private double balance;
    private String facetoken;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }


    public String getFacetoken() {
        return facetoken;
    }

    public void setFacetoken(String facetoken) {
        this.facetoken = facetoken;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", name='" + name + '\'' +
                ", balance=" + balance +
                ", facetoken='" + facetoken + '\'' +
                '}';
    }
}
