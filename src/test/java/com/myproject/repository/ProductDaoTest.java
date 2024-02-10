package com.myproject.repository;

import com.myproject.domain.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProductDaoTest {

    @Autowired
    ProductDao productDao;

    @Test
    public void insertTestData() throws Exception {
        this.productDao.deleteAll();
        int rowCnt = this.productDao.count();
        assertTrue(rowCnt == 0);

        Product product = new Product("pants", 20000, "s", 3, "black");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);

        product = new Product("fleece", 29000, "l", 3, "navy");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);

        product = new Product("hoodie", 15000, "xl", 3, "mint");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);

        product = new Product("The Globe", 22999, 3, "etc");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);

        product = new Product("Disney Castle", 39999, 3, "etc");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);

    }

    @Test
    public void getCount() throws Exception {
        this.productDao.deleteAll();
        int rowCnt = this.productDao.count();
        System.out.println("rowCnt = " + rowCnt);
        assertTrue(rowCnt == 0);
    }

    @Test
    public void insertTest() throws Exception {
        this.productDao.deleteAll();
        int rowCnt = this.productDao.count();
        assertTrue(rowCnt == 0);

        Product product = new Product("pants", 20000, "s", 1, "black");
        rowCnt = this.productDao.insert(product);
        System.out.println("rowCnt = " + rowCnt);
        assertTrue(rowCnt == 1);

        product.setSize("m");
        product.setColor("blue");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);

        product.setSize("l");
        product.setColor("yello");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);
    }

    @Test
    public void selectTest() throws Exception {
        this.productDao.deleteAll();
        int rowCnt = this.productDao.count();
        assertTrue(rowCnt == 0);

        for (int i = 1; i <= 10 ; i++) {
            Product product = new Product("test "+i, 10, "l", 5, "green");
            product.setReview_cnt(0);
            this.productDao.insert(product);
        }
        rowCnt = this.productDao.count();
        assertTrue(rowCnt == 10);

        List<Product> testList = this.productDao.selectAll();
        for (Product stuff : testList) {
            System.out.println("stuff = " + stuff);
        }
        assertTrue(testList.size() == 10);

    }

    @Test
    public void updateTest() throws Exception {
        this.productDao.deleteAll();
        int rowCnt = this.productDao.count();
        assertTrue(rowCnt == 0);

        Product product = new Product("fleece", 29000, "l", 1, "black");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);

        product = this.productDao.selectByName("fleece");
        product.setSize("m");
        product.setColor("yellow");
        rowCnt = this.productDao.update(product);
        assertTrue(rowCnt == 1);

        Product product2 = this.productDao.selectByNo(product.getPno());
        assertTrue(product2.getColor().equals("yellow"));
    }

    @Test
    public void increaseReviewCountTest() throws Exception {
        this.productDao.deleteAll();
        int rowCnt = this.productDao.count();
        assertTrue(rowCnt == 0);

        Product product = new Product("hoodie", 29000, "l", 1, "black");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);

        product = this.productDao.selectByName("hoodie");
//        rowCnt = this.productDao.increaseReviewCount(product.getPno());
        assertTrue(rowCnt == 1);

        Product product2 = this.productDao.selectByNo(product.getPno());
        assertTrue(product2.getReview_cnt() == 1);

    }

    @Test
    public void deleteTest() throws Exception {
        this.productDao.deleteAll();
        int rowCnt = this.productDao.count();
        assertTrue(rowCnt == 0);

        Product product = new Product("hoodie", 29000, "l", 1, "black");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);

        product = this.productDao.selectByName("hoodie");
        System.out.println("product = " + product);
        Integer getPno = product.getPno();
        rowCnt = this.productDao.delete(getPno);
        assertTrue(rowCnt == 1);

        rowCnt = this.productDao.count();
        assertTrue(rowCnt == 0);

    }
}