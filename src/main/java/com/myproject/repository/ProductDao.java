package com.myproject.repository;

import com.myproject.domain.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDao {

    @Autowired
    SqlSession session;
    private String namespace = "com.myproject.repository.ProductMapper.";

    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }
    public List<Product> selectAll() throws Exception {
        return session.selectList(namespace + "selectAll");
    }
    public Product selectByNo(Integer pno) throws Exception {
        return session.selectOne(namespace + "selectByNo", pno);
    }

    public Product selectByName(String pname) throws Exception {
        return session.selectOne(namespace + "selectByName", pname);
    }
    public int insert(Product product) throws Exception {
        return session.insert(namespace + "insert", product);
    }
    public int update(Product product) throws Exception {
        return session.update(namespace + "update", product);
    }
    public int increaseReviewCount(Integer pno) throws Exception {
        return session.update(namespace + "increaseReviewCount", pno);
    }
    public int delete(Integer pno) throws Exception {
        return session.delete(namespace + "delete", pno);
    }
    public void deleteAll() throws Exception {
        session.delete(namespace + "deleteAll");
    }
}
