package com.xm.user.dao;

import com.xm.user.domain.BlogCatalog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by xm on 2017/2/21.
 */
public interface BlogCatalogDao {
    public int addBlogCatalog(BlogCatalog blogCatalog);

    public int countBlogCatalog(String uid);

    public List<BlogCatalog> queryBlogCatalog(@Param("uid")String uid,@Param("limit")int limit,@Param("offset")int offset);

    public int deleteBlogCatalog(@Param("idList")List<Integer> idList,@Param("uid")String uid);


    public int updateBlogCatalog(@Param("name")String name,@Param("id")int id,@Param("uid")String uid);

}
