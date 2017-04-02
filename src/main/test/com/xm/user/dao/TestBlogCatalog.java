package com.xm.user.dao;

import com.xm.user.domain.BlogCatalog;
import com.xm.user.domain.User;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

import static org.junit.Assert.assertNotEquals;

/**
 * Created by xm on 2017/2/21.
 */
public class TestBlogCatalog {
    BlogCatalogDao blogCatalogDao;

    UserDao userDao;

    @Before
    public void init(){
        ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext(new String[] {"spring//applicationContext.xml"});
        blogCatalogDao=context.getBean("blogCatalogDao",BlogCatalogDao.class);
        userDao=context.getBean("userDao",UserDao.class);
    }

    @Test
    public void testAddBlogCatalog(){

        User u=userDao.getUserByName("123456");
        BlogCatalog bc=new BlogCatalog();
        bc.setUser(u);
        for(int  i=1;i<100;i++){
            bc.setName("blog"+i);

            blogCatalogDao.addBlogCatalog(bc);
        }

        assertNotEquals(bc.getId(),0);
    }

   // @Test
    public void queryBlogCatalog(){
        List<BlogCatalog> bgs=blogCatalogDao.queryBlogCatalog("123456",1,0);
        System.out.println(bgs);
        assertNotEquals(bgs.size(),0);
    }

}


