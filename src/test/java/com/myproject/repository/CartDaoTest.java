package com.myproject.repository;

import com.myproject.domain.Cart;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class CartDaoTest {

    @Autowired
    private CartDao cartDao;

    @Test
    public void getCountTest() throws Exception {
        cartDao.deleteAll();
        int rowCnt = cartDao.count();
        assertTrue(rowCnt == 0);

        Cart cart = new Cart(5, "", 1, 1);
        rowCnt = cartDao.insert(cart);
        assertTrue(rowCnt == 1);

    }
    @Test
    public void getCartTest() throws Exception {
        cartDao.deleteAll();
        int rowCnt = cartDao.count();
        assertTrue(rowCnt == 0);

        Cart cart = new Cart(5, "", 1, 1);
        rowCnt = cartDao.insert(cart);
        assertTrue(rowCnt == 1);

        List<Cart> getCart = cartDao.selectByUser(1);
        assertTrue(getCart.get(0).getUno() == cart.getUno());
    }

    @Test
    public void insertTest() throws Exception {
        cartDao.deleteAll();
        int rowCnt = cartDao.count();
        assertTrue(rowCnt == 0);

        for (int i = 1; i <= 5; i++) {
            Cart cart = new Cart(1+i, "", 3, 1);
            cartDao.insert(cart);
        }
        assertTrue(cartDao.count() == 5);

        List<Cart> getCarts = cartDao.selectByUser(3);
        assertTrue(getCarts.size() == 5);
    }
    @Test
    public void updateTest() throws Exception {
        cartDao.deleteAll();
        int rowCnt = cartDao.count();
        assertTrue(rowCnt == 0);

        Cart cart = new Cart(1, "", 3, 1);
        cartDao.insert(cart);
        assertTrue(cartDao.count() == 1);

        List<Cart> getCarts = cartDao.selectByUser(3);
        assertTrue(getCarts.size() == 1);

        // modify
        List<Cart> getCart = cartDao.selectByUser(3);
        getCart.get(0).setQuantity(3);
        rowCnt = cartDao.update(getCart.get(0));
        assertTrue(rowCnt == 1);

        // result
        List<Cart> myCart = cartDao.selectByUser(3);
        System.out.println("cart.getQuantity() = " + cart.getQuantity());
        System.out.println("myCart.get(0).getQuantity() = " + myCart.get(0).getQuantity());
        assertTrue(myCart.get(0).getQuantity() == getCart.get(0).getQuantity());
    }
    @Test
    public void deleteTest() throws Exception {
        cartDao.deleteAll();
        int rowCnt = cartDao.count();
        assertTrue(rowCnt == 0);

        for (int i = 1; i <= 5; i++) {
            Cart cart = new Cart(1+i, "", 5, 1);
            cartDao.insert(cart);
        }
        assertTrue(cartDao.count() == 5);

        List<Cart> getCarts = cartDao.selectByUser(5);
        assertTrue(getCarts.size() == 5);

        rowCnt = cartDao.delete(getCarts.get(2).getCno(), 5);
        assertTrue(rowCnt == 1);

        getCarts = cartDao.selectByUser(5);
        assertTrue(getCarts.size() == 4);
    }
}