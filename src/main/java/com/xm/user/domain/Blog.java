package com.xm.user.domain;

import java.util.Date;

/**
 * Created by xm on 2017/2/21.
 */
public class Blog {
    private int id;
    private String title;
    private String author;
    private String content;
    private Date updateTime;
    private String blogCatalog;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getBlogCatalog() {
        return blogCatalog;
    }

    public void setBlogCatalog(String blogCatalog) {
        this.blogCatalog = blogCatalog;
    }
}
