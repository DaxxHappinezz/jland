package com.myproject.repository;

import com.myproject.domain.Cart;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDao {

    @Autowired
    SqlSession session;
    private String namespace = "com.myproject.repository.CartMapper.";

    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }
    public List<Cart> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }
    public Cart selectByCno(Integer cno) throws Exception {
        return session.selectOne(namespace + "selectByCno", cno);
    }
    public List<Cart> selectByUser(Integer uno) throws Exception {
        return session.selectList(namespace + "selectByUser", uno);
    }
    public int insert(Cart cart) throws Exception {
        return session.insert(namespace + "insert", cart);
    }
    public int update(Cart cart) throws Exception {
        return session.update(namespace + "update", cart);
    }
    public int delete(Integer cno, Integer uno) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("cno", cno);
        map.put("uno", uno);
        return session.delete(namespace + "delete", map);
    }
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }
}
