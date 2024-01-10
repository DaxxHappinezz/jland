package com.myproject.controller;

import com.myproject.domain.Product;
import com.myproject.domain.Review;
import com.myproject.repository.ProductDao;
import com.myproject.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class ProductController {

    @Autowired
    private ProductDao productDao;

    @Autowired
    private ReviewService reviewService;

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

    @GetMapping("/products/{pno}")
    public String product(@PathVariable Integer pno, Model m) {
        Product product = null;
        try {
            // 1. 상품 정보 가져오기
            product = this.productDao.selectByNo(pno);
            if (product == null) {
                throw new Exception("Get product failed.");
            }
            System.out.println("product = " + product);
            m.addAttribute(product);

            // 2. 리뷰 정보 가져오기
            List<Review> reviewList = this.reviewService.getReviewList(pno);
            System.out.println("reviewList = " + reviewList);
            for (Review re : reviewList) {
                System.out.println("re = " + re);
            }
            m.addAttribute("reviewList", reviewList);

            // 3. 리뷰 평균 가져오기
            double avgRating = this.reviewService.getAvgRating(pno);
            m.addAttribute("avgRating", avgRating);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "product/information";
    }
}
