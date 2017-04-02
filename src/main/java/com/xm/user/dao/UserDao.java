package com.xm.user.dao;

import com.xm.user.domain.User;

/**
 * Created by xm on 2017/1/4.
 */

public interface UserDao {

    public int addUser(User user);

    public User getUserByName(String name);

    public int delUserByName(String name);

    public int checkUserExist(String name);


/*    public int  editUser(User user);

    public int  deleteUser(int id);

    public List<Group> queryGroup(int id);*/
}
