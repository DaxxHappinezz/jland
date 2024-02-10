package com.myproject.domain;

import lombok.*;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private Integer pno;
    private String pname;
    private Integer price;
    private String size;
    private Integer quantity;
    private String color;
    private Integer review_cnt;
    private String category;

    public Product(String pname, Integer price, Integer quantity, String category) {
        this.pname = pname;
        this.price = price;
        this.quantity = quantity;
        this.category = category;
    }
    public Product(String pname, Integer price, String size, Integer quantity, String category) {
        this.pname = pname;
        this.price = price;
        this.size = size;
        this.quantity = quantity;
        this.category = category;
    }
}
