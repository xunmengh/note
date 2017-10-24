package com.xm.user.dao;

import com.xm.user.domain.User;
import com.xm.user.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.assertEquals;

/**
 * Created by xm on 2017/2/20.
 */
public class TestUserDao {
    UserDao userDao;

    UserService userService;
    @Before
    public void init(){
        ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext(new String[] {"spring//applicationContext.xml"});

        userDao=context.getBean("userDao",UserDao.class);
        userService=context.getBean("userService",UserService.class);

    }

    @Test
    public void testAddUser(){
       boolean exist= userService.checkUserIsExist("testUser");
        if(exist){
            userDao.delUserByName("testUser");
        }
        User user=new User();
        user.setUsername("testUser");
        user.setPassword("123456");
        user.setEmail("123456@qq.com");
        userDao.addUser(user);
        User u=userDao.getUserByName("testUser");
        assertEquals(u.getEmail(),"123456@qq.com");

       int count=userDao.checkUserExist("testUser");
        assertEquals(count,1);
        userDao.delUserByName("testUser");
    }
}
