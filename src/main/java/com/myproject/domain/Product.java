package com.myproject.domain;

public class Product {
    private Integer pno;
    private String pname;
    private Integer price;
    private String size;
    private Integer quantity;
    private String color;
    private Integer review_cnt;

    public Product(String pname, Integer price, String size, Integer quantity, String color) {
        this.pname = pname;
        this.price = price;
        this.size = size;
        this.quantity = quantity;
        this.color = color;
    }

    public Integer getPno() {
        return pno;
    }

    public void setPno(Integer pno) {
        this.pno = pno;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public Integer getReview_cnt() {
        return review_cnt;
    }

    public void setReview_cnt(Integer review_cnt) {
        this.review_cnt = review_cnt;
    }

    @Override
    public String toString() {
        return "Product{" +
                "pno=" + pno +
                ", pname='" + pname + '\'' +
                ", price=" + price +
                ", size='" + size + '\'' +
                ", quantity=" + quantity +
                ", color='" + color + '\'' +
                ", review_cnt=" + review_cnt +
                '}';
    }
}
