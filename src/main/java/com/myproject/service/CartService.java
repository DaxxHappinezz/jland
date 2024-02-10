package com.myproject.service;

import com.myproject.domain.Cart;
import com.myproject.repository.CartDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {
    @Autowired
    private CartDao cartDao;

    public int getCount() throws Exception {
        return cartDao.count();
    }
    public List<Cart> findAll() throws Exception {
        return cartDao.selectAll();
    }
    public Cart findByCartNo(Integer cno) throws Exception {
        return cartDao.selectByCno(cno);
    }
    public List<Cart> findAllByUser(Integer uno) throws Exception {
        return cartDao.selectByUser(uno);
    }
    public int save(Cart cart) throws Exception {
        return cartDao.insert(cart);
    }
    public int modify(Cart cart) throws Exception {
        return cartDao.update(cart);
    }
    public int remove(Integer cno, Integer uno) throws Exception {
        return cartDao.delete(cno, uno);
    }
    public int removeAll() throws Exception {
        return cartDao.deleteAll();
    }
}
