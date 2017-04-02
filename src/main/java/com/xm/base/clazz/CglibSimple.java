package com.xm.base.clazz;

import net.sf.cglib.proxy.*;
import org.junit.Test;

import java.lang.reflect.Method;

import static org.junit.Assert.assertEquals;

/**
 * Created by xm on 2017/3/22.
 */
public class CglibSimple {
    public String test(String t){
        System.out.println("CglibSimple "+t);
        return "hello "+t;
    }

    public String filter(){
        return "filter";
    }


   /*
   *  对返回结果的过滤
   * */
   @Test
   public  void testFixedValue(){
       Enhancer enhancer = new Enhancer();
       enhancer.setSuperclass(CglibSimple.class);
       enhancer.setCallback(new FixedValue() {
           @Override
           public Object loadObject() throws Exception {
               System.out.println("loadObject");
               return "Hello cglib!";
           }
       });
       CglibSimple proxy = (CglibSimple) enhancer.create();
       assertEquals("Hello cglib!", proxy.test("123"));
   }


    /*
    *
    *    对方法的过滤
    * */
    @Test
    public  void testMethodInterceptor() throws Exception {
        Enhancer enhancer = new Enhancer();
        enhancer.setSuperclass(CglibSimple.class);
        enhancer.setCallback(new MethodInterceptor() {
            @Override
            public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy)
                    throws Throwable {
                System.out.println("intercept");

                return proxy.invokeSuper(obj, args);

            }
        });
        CglibSimple proxy = (CglibSimple) enhancer.create();
        proxy.hashCode(); // Does not throw an exception or result in an endless loop.
    }

    @Test
    public    void testCallFilter()throws Exception{
        Enhancer enhancer = new Enhancer();
        enhancer.setSuperclass(CglibSimple.class);
        enhancer.setCallbackFilter(new CallbackFilter() {
            @Override
            public int accept(Method method) {
                if(method.getName().equals("filter")){
                    return 1;
                }else{
                    return 0;
                }
            }
        });

        Callback c0=new MethodInterceptor() {
            @Override
            public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy)
                    throws Throwable {
                System.out.println("test");

                return proxy.invokeSuper(obj, args);

            }
        };


        Callback c1=new MethodInterceptor() {
            @Override
            public Object intercept(Object obj, Method method, Object[] args, MethodProxy proxy)
                    throws Throwable {
                System.out.println("filter");

                return proxy.invokeSuper(obj, args);

            }
        };
        enhancer.setCallbacks(new Callback[]{c0,c1});

        CglibSimple proxy = (CglibSimple) enhancer.create();
        proxy.test("123");
        proxy.filter();
    }

}
