package com.xm.base.beans;

import org.junit.Test;

import java.beans.*;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by xm on 2017/3/21.
 */
public class BeansUtils {

    @Test
    public void beans(){
        /*
        *result = clz.getMethods();
        *  PropertyDescriptor 获得的属性名称是通过方法名截取的  get
        *
        *  m.getDeclaringClass()  // 方法所在的类名，可能在父类总
        * */

             Method[] method=   Bean.class.getMethods();
        for(Method m : method){
            System.out.println(m.getDeclaringClass());
        }

         try {
            BeanInfo bif= Introspector.getBeanInfo(Bean.class,Object.class/* stopClass*/);//  Object.class 不包含父类的属性
           for(PropertyDescriptor p : bif.getPropertyDescriptors()){
              System.out.println(p.getName() + ": " + p.getPropertyType()) ;
               p.getReadMethod();
            }

            for(MethodDescriptor m : bif.getMethodDescriptors()) {
                System.out.println(m.getMethod().toString()) ;

            }

        } catch (IntrospectionException e) {
            e.printStackTrace();
        }


    }

}

class Bean{
    private int num;
    private String key;
    private List<String> l=new ArrayList<String>();
    private boolean exist;
    private Map<String,String> map=new HashMap<String,String>();

    public String getAlias(){
        return key;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public List<String> getL() {
        return l;
    }

    public void setL(List<String> l) {
        this.l = l;
    }

    public boolean isExist() {
        return exist;
    }

    public void setExist(boolean exist) {
        this.exist = exist;
    }

    public Map<String, String> getMap() {
        return map;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }
}