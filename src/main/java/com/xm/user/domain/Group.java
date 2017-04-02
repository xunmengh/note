package com.xm.user.domain;

import com.alibaba.fastjson.annotation.JSONField;

import java.util.List;

/**
 * Created by xm on 2017/1/5.
 */
public class Group {
    @JSONField(name="id")
    String gid;
    @JSONField(name="groupname")
    String gname;
    @JSONField(name="list")
    List<User> friends;

    public String getGid() {
        return gid;
    }

    public void setGid(String gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public List<User> getFriends() {
        return friends;
    }

    public void setFriends(List<User> friends) {
        this.friends = friends;
    }
}
