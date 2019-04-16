package com.zz624.matchbean;

public class Location {
    private double left;
    private double top;
    private int width;
    private int height;
    private int rotation;

    public Location() {
    }

    public void setLeft(double left) {
        this.left = left;
    }

    public double getLeft() {
        return this.left;
    }

    public void setTop(double top) {
        this.top = top;
    }

    public double getTop() {
        return this.top;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getWidth() {
        return this.width;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getHeight() {
        return this.height;
    }

    public void setRotation(int rotation) {
        this.rotation = rotation;
    }

    public int getRotation() {
        return this.rotation;
    }

    @Override
    public String toString() {
        return "Location{" +
                "left=" + left +
                ", top=" + top +
                ", width=" + width +
                ", height=" + height +
                ", rotation=" + rotation +
                '}';
    }
}
