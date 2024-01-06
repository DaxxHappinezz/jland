package com.myproject.repository;

import com.myproject.domain.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {

    @Autowired
    SqlSession session;
    private String namespace = "com.myproject.repository.ProductMapper.";

    public int count() {
        return session.selectOne(namespace + "count");
    }
    public Product select(String pname) {
        return session.selectOne(namespace + "select", pname);
    }
    public int insert(Product product) {
        return session.insert(namespace + "insert", product);
    }
    public int update(Product product) {
        return session.update(namespace + "update", product);
    }
    public int delete(Integer pno) {
        return session.delete(namespace + "delete", pno);
    }
    public void deleteAll() {
        session.delete(namespace + "deleteAll");
    }
}
