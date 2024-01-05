package com.myproject.repository;

import com.myproject.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDaoTest {

    @Autowired
    UserDao userDao;

    @Test
    public void getCountUserTest() throws Exception {
        int rowCnt = this.userDao.count();
        System.out.println("rowCnt = " + rowCnt);
        assertTrue(rowCnt == 1);
    }

    @Test
    public void insertUserTest() throws Exception {
        this.userDao.deleteAll();
        User user = new User("test", "this", "test", "asdf");
        int rowCnt =  this.userDao.insert(user);
        assertTrue(rowCnt == 1);
        User getUser = this.userDao.select(user.getId());
        assertTrue(getUser.getId().equals("test"));
    }

    @Test
    public void updateUserTest() throws Exception {
        this.userDao.deleteAll();
        User user = new User("test", "this", "test", "asdf");
        int cnt = this.userDao.insert(user);
        assertTrue(cnt == 1);

        User getUser = this.userDao.select(user.getId());
        System.out.println("getUser = " + getUser);
        assertTrue(getUser.getId().equals("test"));

        getUser.setGivenName("master");
        getUser.setEmail("master@master.com");
        int rowCnt = this.userDao.update(getUser);
        assertTrue(rowCnt == 1);

        User getUser2 = this.userDao.select(user.getId());
        System.out.println("getUser2 = " + getUser2);
        assertTrue(getUser2.getId().equals("test"));
        assertTrue(getUser2.getGivenName().equals("master"));
        assertTrue(getUser2.getEmail().equals("master@master.com"));
        assertTrue(getUser.getUno() == getUser2.getUno());

    }

    @Test
    public void deleteUserTest() throws Exception {
        this.userDao.deleteAll();
        User user = new User("test", "seo", "test", "asdf");
        int rowCnt = this.userDao.insert(user);
        assertTrue(rowCnt == 1);

        int rowCnt2 = this.userDao.delete("test");
        assertTrue(rowCnt2 == 1);

        User getUser2 = this.userDao.select("test");
        assertTrue(getUser2 == null);

    }
}