package com.xm.base.designmodal;

import java.util.Observable;
import java.util.Observer;

/**
 * Created by xm on 2017/3/29.
 */
public class FileObserver implements Observer {

    private String serverName;

    public FileObserver(String serverName){
        this.serverName=serverName;
    }

    @Override
    public void update(Observable o, Object arg) {
        System.out.println(serverName+"　收到内容改变："+ arg);
    }
}
