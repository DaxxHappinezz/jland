package com.myproject.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class PageHandlerTest {
    @Test
    public void paginationTest() {
        PageHandler ph = new PageHandler(200, 3, 5, null);
        System.out.println("before - ph = " + ph);
        ph.print();
    }
    @Test
    public void paginationTest2() {
        PageHandler ph = new PageHandler(200, 10, 5, null);
        System.out.println("before - ph = " + ph);
        ph.print();
    }
    @Test
    public void paginationTest3() {
        PageHandler ph = new PageHandler(200, 15, 5, null);
        System.out.println("before - ph = " + ph);
        ph.print();
    }
    @Test
    public void paginationTest4() {
        PageHandler ph = new PageHandler(200, 23, 5, null);
        System.out.println("before - ph = " + ph);
        ph.print();
    }
    @Test
    public void paginationTest5() {
        PageHandler ph = new PageHandler(200, 40, 5, null);
        System.out.println("before - ph = " + ph);
        ph.print();
        assertTrue(ph.getCurrentPage() == ph.getTotalPageCnt());
    }
}