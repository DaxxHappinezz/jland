package com.myproject.controller;

import com.myproject.domain.Product;
import com.myproject.repository.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductDao productDao;

    @GetMapping("/products")
    public String main(Model m) {
        List<Product> productList = null;
        try {
            productList = this.productDao.selectAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("productList = " + productList);
        m.addAttribute("productList", productList);
        return "product/mainList";
    }
}
