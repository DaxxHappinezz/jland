package com.myproject.controller;

import com.myproject.domain.Product;
import com.myproject.repository.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MyController {

    @Autowired
    ProductDao productDao;

    @GetMapping("/service")
    public String help() {
        return "service.tiles";
    }

    @GetMapping("/wishlist")
    public String myWishlist() {
        return "cart/wishlist.tiles";
    }

    // Tiles Test
    @GetMapping("/test")
    public String test() {
        return "test.tiles";
    }
}
