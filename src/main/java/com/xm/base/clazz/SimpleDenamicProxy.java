package com.xm.base.clazz;

import net.sf.cglib.proxy.Enhancer;

import java.lang.reflect.Proxy;

/**
 * Created by xm on 2017/3/22.
 */
public class SimpleDenamicProxy {

    public  static void consumer(ProInterface proInterface){
        proInterface.doSomething();
        proInterface.somethingElse("else");
    }

    public static void main(String args[]){
        ProImplement impl=new ProImplement();
        ProInterface proxy= (ProInterface) Proxy.newProxyInstance(ProInterface.class.getClassLoader(),
                new Class[]{ProInterface.class},
                new DynamicProxyHandler(impl));
        consumer(proxy);


    }
}
