package com.myproject.repository;

import com.myproject.domain.Product;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ProductDao {

    private final SqlSession session;
    private final String namespace = "com.myproject.repository.ProductMapper.";

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
    public int changeReviewCount(Integer pno, Integer countValue) throws Exception {
        Map<String,  Object> map = new HashMap<>();
        map.put("pno", pno);
        map.put("countValue", countValue);
        return session.update(namespace + "changeReviewCount", map);
    }
    public int changeQuantity(Integer pno, Integer countValue) throws Exception {
        Map<String,  Object> map = new HashMap<>();
        map.put("pno", pno);
        map.put("countValue", countValue);
        return session.update(namespace + "changeReviewCount", map);
    }
    public int delete(Integer pno) throws Exception {
        return session.delete(namespace + "delete", pno);
    }
    public void deleteAll() throws Exception {
        session.delete(namespace + "deleteAll");
    }
}
