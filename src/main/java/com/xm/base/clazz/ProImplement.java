package com.xm.base.clazz;

/**
 * Created by xm on 2017/3/22.
 */
public class ProImplement implements ProInterface {

    @Override
    public void doSomething() {
          System.out.println("doSomething");
    }

    @Override
    public void somethingElse(String arg) {
        System.out.println("somethingElse :"+arg);
    }
}
