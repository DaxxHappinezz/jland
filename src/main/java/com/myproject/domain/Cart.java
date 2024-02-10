package com.myproject.domain;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Cart {
    private Integer cno;
    private Integer pno;
    private String pname;
    private Integer price;
    private Integer uno;
    private Integer quantity;

    public Cart(Integer pno, String pname, Integer uno, Integer quantity) {
        this.pno = pno;
        this.pname = pname;
        this.uno = uno;
        this.quantity = quantity;
    }
}
