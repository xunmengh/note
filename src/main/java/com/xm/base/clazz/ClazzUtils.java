package com.xm.base.clazz;

import org.junit.Test;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import static org.junit.Assert.assertEquals;

/**
 * Created by xm on 2017/3/13.
 *
 *  类声明为final 不能继承
 *  先进行 hashcode 比较，在进行 equal 比较
 */
public class ClazzUtils {


    @Test
    public void clazz() throws NoSuchFieldException, ClassNotFoundException, IllegalAccessException, InstantiationException {

         //Class.forName()    会初始化静态变量
         Class clazz= SubEntity.class; // 不会初始化静态变量

        iteratorFiled(clazz.getFields()); //getFields 能够获得所有的(包括父类的变量)公共的变量，
        Field tField=clazz.getField("t");
        iteratorFiled(clazz.getDeclaredFields());// getDeclaredFields 获得该类的所有变量(公共的或者是私有的，不获取父类的私有变量)
        System.out.println("-----");

        assertEquals("com.xm.base.clazz.SubEntity", clazz.getName());

        assertEquals("com.xm.base.clazz.Entity", clazz.getSuperclass().getName());

        iteratorMethod(clazz.getMethods());// 包括所有的(父类)公共方法

        System.out.println("-----");
        iteratorMethod(clazz.getDeclaredMethods());// 当前类的所有方法

        clazz.getConstructors(); // 获得构造器

        Entity entity = Class.forName("com.xm.base.clazz.SubEntity").asSubclass(Entity.class).newInstance();

        if(entity instanceof SubEntity){

        }
        assertEquals(10, entity.getAge());

        Class[] cs=clazz.getClasses(); // 获得公共的内部类
        for(Class c:cs){
            System.out.println(c);
        }
    }




    private void iteratorFiled(Field[] fields){
        for(Field f:fields){
            System.out.println(f.getName() + " " + f.getType());
        }
    }

    private void iteratorMethod(Method[] methods){
        for(Method m:methods) {
            System.out.println(m.getDeclaringClass() + " " + m.getName() + " " + m.getReturnType() + " " + m.getParameterTypes());
        }
    }

    @Test
    public void method(){
        String []s={};
        Class<?> c=s.getClass();
        assertEquals(String.class,c.getComponentType());
    }



    @Test
    public void reflect(){
        /*
        *    getDeclaredFields
        * */

//        Field[] fields= Entity.class.getDeclaredFields();
        Field[] fields= Entity.class.getFields();
       for(Field f:fields){
            System.out.println(f.getName() + " " + f.getType());
       }
    }
}
