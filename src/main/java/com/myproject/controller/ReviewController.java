package com.myproject.controller;

import com.myproject.domain.Review;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReviewController {

    @PostMapping("/reviews")
    @ResponseBody
    public ResponseEntity<String> submit(@RequestBody Review review) {
        System.out.println("review = " + review);
        return ResponseEntity.ok()
                .body("REV_OK");
    }
}
