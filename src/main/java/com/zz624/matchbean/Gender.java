package com.zz624.matchbean;

public class Gender {
    private String type;
    private double probability;

    public Gender() {
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return this.type;
    }

    public void setProbability(double probability) {
        this.probability = probability;
    }

    public double getProbability() {
        return this.probability;
    }

    @Override
    public String toString() {
        return "Gender{" +
                "type='" + type + '\'' +
                ", probability=" + probability +
                '}';
    }
}
