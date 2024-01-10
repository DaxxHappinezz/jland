package com.myproject.repository;

import com.myproject.domain.Review;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ReviewDao {

    @Autowired
    private SqlSession session;
    private String namespace = "com.myproject.repository.ReviewMapper.";

    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }
    public double avg_rating(Integer pno) throws Exception {
        return session.selectOne(namespace + "avg_rating", pno);
    }
    public List<Review> selectAll (Integer pno) throws Exception {
        return session.selectList(namespace + "selectAll", pno);
    }
    public Review select(Map map) throws Exception {
        return session.selectOne(namespace + "select", map);
    }
    public int insert(Review review) throws Exception {
        return session.insert(namespace + "insert", review);
    }
    public int update(Review review) throws Exception {
        return session.update(namespace + "update", review);
    }
    public int up_calc(Map map) throws Exception {
        return session.update(namespace + "up_calc", map);
    }
    public int down_calc(Map map) throws Exception {
        return session.update(namespace + "down_calc", map);
    }
    public int delete(Map map) throws Exception {
        return session.delete(namespace + "delete", map);
    }
    public void deleteAll() throws Exception {
        session.delete(namespace + "deleteAll");
    }
}
