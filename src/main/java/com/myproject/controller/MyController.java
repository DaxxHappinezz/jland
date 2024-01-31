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
    public void help() {}

    @GetMapping("/cart")
    public String myCart(Model m) {
        List<Product> cartList = null;
        try {
            cartList = this.productDao.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        m.addAttribute("cartList", cartList);
        return "cart/cartList";
    }

    @GetMapping("/wishlist")
    public String myWishlist() {
        return "cart/wishlist";
    }
}
