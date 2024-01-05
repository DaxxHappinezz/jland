package com.myproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

    @GetMapping("/test")
    public void test() {}

    @GetMapping("/cart")
    public String myCart() {
        return "user/cart";
    }

    @GetMapping("/wishlist")
    public String myWishlist() {
        return "user/wishlist";
    }
}
