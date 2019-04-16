
package com.zz624.matchbean;

public class Face_list {
    private String face_token;
    private double face_probability;
    private int age;
    private double beauty;
    private Expression expression;
    private Gender gender;
    private Glasses glasses;

    public Face_list() {
    }

    public void setFace_token(String face_token) {
        this.face_token = face_token;
    }

    public String getFace_token() {
        return this.face_token;
    }

    public void setFace_probability(double face_probability) {
        this.face_probability = face_probability;
    }

    public double getFace_probability() {
        return this.face_probability;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getAge() {
        return this.age;
    }

    public void setBeauty(double beauty) {
        this.beauty = beauty;
    }

    public double getBeauty() {
        return this.beauty;
    }

    public void setExpression(Expression expression) {
        this.expression = expression;
    }

    public Expression getExpression() {
        return this.expression;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public Gender getGender() {
        return this.gender;
    }

    public void setGlasses(Glasses glasses) {
        this.glasses = glasses;
    }

    public Glasses getGlasses() {
        return this.glasses;
    }

    @Override
    public String toString() {
        return "Face_list{" +
                "face_token='" + face_token + '\'' +
                ", face_probability=" + face_probability +
                ", age=" + age +
                ", beauty=" + beauty +
                ", expression=" + expression +
                ", gender=" + gender +
                ", glasses=" + glasses +
                '}';
    }
}
