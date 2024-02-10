package com.myproject.controller;

import com.myproject.domain.Product;
import com.myproject.domain.Review;
import com.myproject.repository.ProductDao;
import com.myproject.service.ProductService;
import com.myproject.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductController {

    private final ProductService productService;
    private final ReviewService reviewService;

    @GetMapping("/products")
    public String main(Model m) {
        List<Product> productList = null;
        try {
            productList = this.productService.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        m.addAttribute("productList", productList);
        return "product/mainList";
    }

    @GetMapping("/products/{pno}")
    public String product(@PathVariable Integer pno, Model m) {
        Product product = null;
        try {
            // 1. 상품 정보 가져오기
            product = this.productService.findByNo(pno);
            if (product == null) {
                throw new Exception("Get product failed.");
            }
            m.addAttribute(product);

            // 2. 리뷰 평균 가져오기
            double avgRating = this.reviewService.getAvgRating(pno);
            m.addAttribute("avgRating", avgRating);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/information";
    }
}
