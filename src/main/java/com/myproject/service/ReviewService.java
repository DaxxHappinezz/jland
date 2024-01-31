package com.myproject.service;

import com.myproject.domain.Review;
import com.myproject.repository.ProductDao;
import com.myproject.repository.ReviewDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReviewService {
    
    private final ReviewDao reviewDao;
    private final ProductDao productDao;

    public ReviewService(ReviewDao reviewDao, ProductDao productDao) {
        this.reviewDao = reviewDao;
        this.productDao = productDao;
    }

    public int getCount() throws Exception {
        return this.reviewDao.count();
    }
    public double getAvgRating(Integer pno) throws Exception {
        return this.reviewDao.avg_rating(pno);
    }
    public List<Review> getReviewList(Integer pno) throws Exception {
        return this.reviewDao.selectAll(pno);
    }
    public Review getReview(Integer pno, Integer uno) throws Exception {
        Map map = new HashMap<>();
        map.put("pno", pno);
        map.put("uno", uno);
        return this.reviewDao.select(map);
    }
    public Review getReviewByReviewNo(Integer rno) throws Exception {
        return this.reviewDao.selectByRno(rno);
    }
    @Transactional(rollbackFor = Exception.class)
    public int writeReview(Review review) throws Exception {
        int countValue = 1;
        productDao.changeReviewCount(review.getPno(), countValue);
        return this.reviewDao.insert(review);
    }
    public int modifyReview(Review review) throws Exception {
        return this.reviewDao.update(review);
    }
    public int helpCalculation(int rno, String help) throws Exception {
        Map map = new HashMap();
        map.put("rno", rno);
        map.put("help", help);
        return this.reviewDao.upDown_calc(map);
    }
//    public int upCalculation(int rno, int up) throws Exception {
//        Map map = new HashMap();
//        map.put("rno", rno);
//        map.put("up", up);
//        return this.reviewDao.up_calc(map);
//    }
//    public int downCalculation(int rno, int down) throws Exception {
//        Map map = new HashMap();
//        map.put("rno", rno);
//        map.put("down", down);
//        return this.reviewDao.down_calc(map);
//    }
    @Transactional(rollbackFor = Exception.class)
    public int remove(int pno, int uno) throws Exception {
        int countValue = -1;
        productDao.changeReviewCount(pno, countValue);
        Map<String, Integer> map = new HashMap<>();
        map.put("pno", pno);
        map.put("uno", uno);
        return this.reviewDao.delete(map);
    }
    public void removeAllForAdmin() throws Exception {
        this.reviewDao.deleteAll();
    }
}
