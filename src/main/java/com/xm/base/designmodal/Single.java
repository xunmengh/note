package com.xm.base.designmodal;

/**
 * Created by xm on 2017/3/29.
 * 创建一个实例，
 */
public class Single {

    private static class SingleHolder{
        private static Single instance=new Single();
    }
    public static Single getInstance(){
        return SingleHolder.instance;
    }
}
