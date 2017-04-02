package com.xm.base.clazz;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

/**
 * Created by xm on 2017/3/22.
 */
public class DynamicProxyHandler implements InvocationHandler{

    private Object proxied;

    public DynamicProxyHandler(Object proxied) {
        this.proxied = proxied;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println(proxy.getClass()+" "+method.toString()+" args:"+args);
        return method.invoke(proxied,args);
    }
}
