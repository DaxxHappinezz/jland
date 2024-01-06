package com.myproject.repository;

import com.myproject.domain.Product;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class ProductDaoTest {

    @Autowired
    ProductDao productDao;

    @Test
    public void getCount() {
        this.productDao.deleteAll();
        int rowCnt = this.productDao.count();
        System.out.println("rowCnt = " + rowCnt);
        assertTrue(rowCnt == 0);
    }

    @Test
    public void insertTest() {
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
    public void selectTest() {
        this.productDao.deleteAll();
        Product product = new Product("test", 10, "l", 5, "green");
        this.productDao.insert(product);
        Product test = this.productDao.select("test");
    }

    @Test
    public void updateTest() {
        this.productDao.deleteAll();
        int rowCnt = this.productDao.count();
        assertTrue(rowCnt == 0);

        Product product = new Product("fleece", 29000, "l", 1, "black");
        rowCnt = this.productDao.insert(product);
        assertTrue(rowCnt == 1);
        rowCnt = this.productDao.count();
        System.out.println("rowCnt = " + rowCnt);
        String name = product.getPname();
    }
}