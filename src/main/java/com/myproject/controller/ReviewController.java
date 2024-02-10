package com.myproject.controller;

import com.myproject.domain.PageHandler;
import com.myproject.domain.Review;
import com.myproject.service.ReviewService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reviews")
public class ReviewController {

    private final ReviewService reviewService;
    public ReviewController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @GetMapping // ?pno=222
    @ResponseBody
    public ResponseEntity<Object> getReviewList(Integer pno) {
        List<Review> reviewList = null;
        try {
            reviewList = reviewService.getReviewList(pno);
            return ResponseEntity.status(HttpStatus.OK)
                    .body(reviewList);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Try again.");
        }
    }
    @GetMapping("/page") // /reviews/page?pno=222
    @ResponseBody
    public ResponseEntity<Object> getPageReviewList(Integer pno, Integer currentPage, Integer pageSize) {
        if (currentPage == null) currentPage = 1;
        if (pageSize == null) pageSize = 5;
        List<Review> pageReviewList = null;
        try {
            pageReviewList = reviewService.getPageReviewList(pno, (currentPage -1) * 5, pageSize);
            int reviewCnt = reviewService.getCount(pno);
            PageHandler ph = new PageHandler(reviewCnt, currentPage, pageSize, pageReviewList);

            return ResponseEntity.status(HttpStatus.OK)
                    .body(ph);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body("Try again.");
        }
    }

    @PostMapping
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
    @PutMapping("/{rno}")
    public ResponseEntity<String> modify(@PathVariable("rno") Integer rno, @RequestBody Review review) {
        System.out.println("rno = " + rno);
        System.out.println("review = " + review);
        review.setUno(1);
        try {
            int rowCnt = reviewService.modifyReview(review);

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

    @PatchMapping("/up/{rno}")
    public ResponseEntity<Object> upCount(@PathVariable Integer rno) {
        System.out.println("rno = " + rno);
        try {
            int rowCnt = this.reviewService.helpCalculation(rno, "up");
            if (rowCnt != 1) {
                throw new Exception("Review Update Up Failed.");
            }
            Integer up_cnt = this.reviewService.getReviewByReviewNo(rno).getUp();
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

    @PatchMapping("/down/{rno}")
    public ResponseEntity<Object> downCount(@PathVariable Integer rno) {
        try {
            int rowCnt = this.reviewService.helpCalculation(rno, "down");

            if (rowCnt != 1) {
                throw new Exception("Review Update Down Failed.");
            }
            Integer down_cnt = this.reviewService.getReviewByReviewNo(rno).getDown();
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
