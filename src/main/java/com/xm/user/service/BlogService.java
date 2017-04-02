package com.xm.user.service;

import com.xm.user.dao.BlogCatalogDao;
import com.xm.user.dao.BlogDao;
import com.xm.user.domain.Blog;
import com.xm.user.domain.BlogCatalog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by xm on 2017/1/5.
 */

@Service
public class BlogService {

    @Autowired
    private BlogDao blogDao;

    @Autowired
    private BlogCatalogDao bcDao;


    public int addBlogCatalog(BlogCatalog blogCatalog){
        return bcDao.addBlogCatalog(blogCatalog);
    }

    //limit pageSize
    //offset 起始位置
    public List<BlogCatalog> queryBlogCatalog(String uid,int limit,int offset){
        return bcDao.queryBlogCatalog(uid,limit,offset);
    }

    public int countBlogCatalog(String uid){
        return bcDao.countBlogCatalog(uid);
    }

    public int addBlog(Blog blog){
        return blogDao.addBlog(blog);
    }

    public int deleteBlogCatalog(List<Integer> idList,String uid){
        return bcDao.deleteBlogCatalog(idList,uid);
    }

    public int updateBlogCatalog(String name,int id,String uid){
        return bcDao.updateBlogCatalog(name,id,uid);
    }

}
