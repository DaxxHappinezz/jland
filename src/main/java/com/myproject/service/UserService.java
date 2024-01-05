package com.myproject.service;

import com.myproject.domain.User;
import com.myproject.repository.UserDao;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    private final UserDao userDao;

    public UserService(UserDao userDao) throws Exception {
        this.userDao = userDao;
    }

    public int getCount() throws Exception {
        return this.userDao.count();
    }
    public User getUser(String id) throws Exception {
        return this.userDao.select(id);
    }
    public int registration(User user) throws Exception {
        return this.userDao.insert(user);
    }
    public int modify(User user) throws Exception {
        return this.userDao.update(user);
    }
    public int remove(String id) throws Exception {
        return this.userDao.delete(id);
    }
    public int removeAll() throws Exception {
        return this.userDao.deleteAll();
    }
}
