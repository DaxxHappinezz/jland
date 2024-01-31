//package com.myproject.repository;
//
//import com.myproject.domain.Review;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import static org.junit.Assert.*;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
//public class ReviewDaoTest {
//
//    @Autowired
//    ReviewDao reviewDao;
//
//    @Autowired
//    ProductDao productDao;
//
//    @Test
//    public void insertTestData() throws Exception {
//        this.reviewDao.deleteAll();
//
//
//        for (int i = 1; i <= 5; i++) {
//            int uno = 1;
//            for (int j = 1; j <= 10; j++) {
//                int randomNum = (int)(Math.random() * 5) + 1;
//                Review review = new Review(i, uno++, "test title", "test comment", randomNum);
////                this.productDao.increaseReviewCount(i);
//                this.reviewDao.insert(review);
//            }
//        }
//
//        int rowCtn = this.reviewDao.count();
//        assertTrue(rowCtn == 50);
//    }
//
//    @Test
//    public void getAvgRatingTest() throws Exception {
//        this.reviewDao.deleteAll();
//        int reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 0);
//
//        Review review = new Review(1, 1, "no title", "no comment", 1);
//        int rowCnt = this.reviewDao.insert(review);
//        assertTrue(rowCnt == 1);
//
//        int pno = 1;
//        double avgRating = this.reviewDao.avg_rating(pno);
//        assertTrue(avgRating == 1.0);
//        System.out.println("avgRating = " + avgRating);
//
//        review = new Review(1, 0, "master title", "master comment", 5);
//        rowCnt = this.reviewDao.insert(review);
//        assertTrue(rowCnt == 1);
//
//        avgRating = this.reviewDao.avg_rating(pno);
//        System.out.println("avgRating = " + avgRating);
//        assertTrue(avgRating == 3.0);
//
//        review = new Review(1, 0, "master title", "master comment", 2);
//        rowCnt = this.reviewDao.insert(review);
//        assertTrue(rowCnt == 1);
//
//        avgRating = this.reviewDao.avg_rating(pno);
//        System.out.println("avgRating = " + avgRating);
//        assertTrue(avgRating == 2.7);
//    }
//
//    @Test
//    public void getCountTest() throws Exception {
//        this.reviewDao.deleteAll();
//        int reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 0);
//
//        Review review = new Review(1, 1, "no title", "no comment", 1);
//        int rowCnt = this.reviewDao.insert(review);
//        assertTrue(rowCnt == 1);
//    }
//
//    @Test
//    public void getReviewTest() throws Exception {
//        this.reviewDao.deleteAll();
//        int reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 0);
//
//        for (int i = 1; i <= 10 ; i++) {
//            Review review = new Review(i, i, "test title"+i, "test comment"+i, 4);
//            this.reviewDao.insert(review);
//        }
//
//        Map map = new HashMap<>();
//        map.put("uno", 3);
//        map.put("pno", 3);
//        Review getReview = this.reviewDao.select(map);
//        assertTrue(getReview.getPno() == 3);
//        assertTrue(getReview.getComment().equals("test comment3"));
//    }
//
//    @Test
//    public void addReviewTest() throws Exception {
//        this.reviewDao.deleteAll();
//        int reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 0);
//
//        for (int i = 1; i <= 5 ; i++) {
//            Review review = new Review(i, 1+i, "add review title", "add review test", 5);
//            this.reviewDao.insert(review);
//        }
//
//        Map map = new HashMap<>();
//        map.put("uno", 3);
//        map.put("pno", 2);
//        Review getReview = this.reviewDao.select(map);
//        assertTrue(getReview.getPno() == 2);
//
//        List<Review> list = this.reviewDao.selectAll(getReview.getPno());
//        for (Review rv : list) {
//            System.out.println("rv = " + rv);
//        }
//    }
//
//    @Test
//    public void updateTest() throws Exception {
//        this.reviewDao.deleteAll();
//        int reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 0);
//
//        Review review = new Review(1, 1, "update review title", "update review test comment", 1);
//        int rowCnt = this.reviewDao.insert(review);
//        assertTrue(rowCnt == 1);
//
//        Map map = new HashMap();
//        map.put("uno", 1);
//        map.put("pno", 1);
//        Review getReview = this.reviewDao.select(map);
//        getReview.setComment("modified test comment");
//        this.reviewDao.update(getReview);
//
//        map.put("uno", getReview.getUno());
//        map.put("pno", getReview.getPno());
//        Review getReview2 = this.reviewDao.select(map);
//        assertTrue(getReview2.getComment().equals("modified test comment"));
//        assertTrue(getReview2.getUpdated() != getReview2.getCreated());
//    }
//    @Test
//    public void deleteTest() throws Exception {
//        this.reviewDao.deleteAll();
//        int reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 0);
//
//        for (int i = 1; i <= 5 ; i++) {
//            Review review = new Review(i, 1+i, "add review title", "add review test", 1);
//            this.reviewDao.insert(review);
//        }
//        reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 5);
//
//        Map map = new HashMap();
//        map.put("uno", 4);
//        map.put("pno", 3);
//        Review getReview = this.reviewDao.select(map);
//        System.out.println("getReview = " + getReview);
//
//        this.reviewDao.delete(map);
//        reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 4);
//        getReview = this.reviewDao.select(map);
//        assertTrue(getReview == null);
//
//    }
//
//    @Test
//    public void upCalculationTest() throws Exception {
//        this.reviewDao.deleteAll();
//        int reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 0);
//
//        Review review = new Review(1, 1, "review up calculation title", "review up calculation test comment", 1);
//        int rowCnt = this.reviewDao.insert(review);
//        assertTrue(rowCnt == 1);
//
//        Map map = new HashMap();
//        int pno = 1;
//        int uno = 1;
//        int up = 1;
//        map.put("pno", pno);
//        map.put("uno", uno);
//        Review getReview = this.reviewDao.select(map);
//        System.out.println("getReview = " + getReview);
//        assertTrue(getReview.getUp() == 0);
//
//        map.put("up", up);
//        this.reviewDao.up_calc(map);
//        getReview = this.reviewDao.select(map);
//        System.out.println("getReview = " + getReview);
//        assertTrue(getReview.getUp() == 1);
//
//        up = -1;
//        map.put("up", up);
//        this.reviewDao.up_calc(map);
//        getReview = this.reviewDao.select(map);
//        System.out.println("getReview = " + getReview);
//        assertTrue(getReview.getUp() == 0);
//    }
//
//    @Test
//    public void downCalculationTest() throws Exception {
//        this.reviewDao.deleteAll();
//        int reviewCnt = this.reviewDao.count();
//        assertTrue(reviewCnt == 0);
//
//        Review review = new Review(1, 1, "review down title", "review down calculation test comment", 1);
//        int rowCnt = this.reviewDao.insert(review);
//        assertTrue(rowCnt == 1);
//
//        Map map = new HashMap();
//        int pno = 1;
//        int uno = 1;
//        int down = 1;
//        map.put("pno", pno);
//        map.put("uno", uno);
//        Review getReview = this.reviewDao.select(map);
//        System.out.println("getReview = " + getReview);
//        assertTrue(getReview.getDown() == 0);
//
//        map.put("down", down);
//        this.reviewDao.down_calc(map);
//        getReview = this.reviewDao.select(map);
//        System.out.println("getReview = " + getReview);
//        assertTrue(getReview.getDown() == 1);
//
//        down = -1;
//        map.put("down", down);
//        this.reviewDao.down_calc(map);
//        getReview = this.reviewDao.select(map);
//        System.out.println("getReview = " + getReview);
//        assertTrue(getReview.getDown() == 0);
//    }
//}