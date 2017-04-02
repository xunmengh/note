package com.xm.base.designmodal;

import java.util.Observable;

/**
 * Created by xm on 2017/3/29.
 */
public class FileObservable extends Observable {

    public void setContent(String content){
        this.setChanged();// 设置状态改变
       notifyObservers(content);
    }

    public static void main(String args[]){
        FileObserver f=new FileObserver("server1");

        FileObserver f2=new FileObserver("server2");

        FileObserver f3=new FileObserver("server3");

        FileObservable o=new FileObservable();

        o.addObserver(f);
        o.addObserver(f2);
        o.addObserver(f3);

        o.setContent("1234");
    }
}
