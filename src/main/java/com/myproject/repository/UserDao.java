package com.myproject.repository;

import com.myproject.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {

    @Autowired
    SqlSession session;
    String namespace = "com.myproject.repository.UserMapper.";

    public int count() throws Exception {
        return session.selectOne(namespace + "count");
    }
    public User select(String id) throws Exception {
        return session.selectOne(namespace + "select", id);
    }
    public int insert(User user) throws Exception {
        return session.insert(namespace + "insert", user);
    }
    public int update(User user) throws Exception {
        return session.insert(namespace + "update", user);
    }
    public int delete(String id) throws Exception {
        return session.delete(namespace + "delete", id);
    }
    public int deleteAll() throws Exception {
        return session.delete(namespace + "deleteAll");
    }

}
