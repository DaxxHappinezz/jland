package com.myproject.controller;

import com.myproject.domain.Review;
import com.myproject.service.ReviewService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class ReviewController {

    private final ReviewService reviewService;
    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @PostMapping("/reviews")
    @ResponseBody
    public ResponseEntity<String> submit(@RequestBody Review review) {
        System.out.println("review = " + review);
        review.setUno(1);
        try {
            int rowCnt = reviewService.writeReview(review);

            if (rowCnt != 1) {
                throw new RuntimeException("Requested insert review Failed.");
            }

            return ResponseEntity.ok()
                    .body("REV_OK");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("REV_ERR");
        }
    }

    @PatchMapping("/reviews/up/{rno}")
    public ResponseEntity<Object> upCount(@PathVariable Integer rno) {
        System.out.println("rno = " + rno);
//        int up = 1;
        try {
            int rowCnt = this.reviewService.helpCalculation(rno, "up");
            System.out.println("rowCnt = " + rowCnt);
            if (rowCnt != 1) {
                throw new Exception("Review Update Up Failed.");
            }
            Integer up_cnt = this.reviewService.getReviewByReviewNo(rno).getUp();
            System.out.println("up_cnt = " + up_cnt);
            Map<String, Object> responseObject = new HashMap<>();
            responseObject.put("up_cnt", up_cnt);

            return ResponseEntity.status(HttpStatus.OK)
                    .body(responseObject);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest()
                    .body("UPD_UP_ERR");
        }
    }

    @PatchMapping("/reviews/down/{rno}")
    public ResponseEntity<Object> downCount(@PathVariable Integer rno) {
        System.out.println("downCount()");
        System.out.println("rno = " + rno);
//        int down = -1;
        try {
            int rowCnt = this.reviewService.helpCalculation(rno, "down");
            System.out.println("rowCnt = " + rowCnt);

            if (rowCnt != 1) {
                throw new Exception("Review Update Down Failed.");
            }
            Integer down_cnt = this.reviewService.getReviewByReviewNo(rno).getDown();
            System.out.println("down_cnt = " + down_cnt);
            Map<String, Object> responseObject = new HashMap<>();
            responseObject.put("down_cnt", down_cnt);

            return ResponseEntity.status(HttpStatus.OK)
                    .body(responseObject);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest()
                    .body("UPD_DOWN_ERR");
        }
    }
}
