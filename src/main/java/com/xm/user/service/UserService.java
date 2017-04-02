package com.xm.user.service;

import com.xm.user.dao.UserDao;
import com.xm.user.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by xm on 2017/1/5.
 */

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public int addUser(User user){
        return userDao.addUser(user);
    }

    public User getUserByName(String name){
        return userDao.getUserByName(name);
    }

    public int delUserByName(String name){
        return userDao.delUserByName(name);
    }

    public boolean checkUserIsExist(String name){
         int count= userDao.checkUserExist(name);
         boolean result= count>0 ? true :false;
         return result;
    }



}
