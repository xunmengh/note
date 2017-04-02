package com.xm.base.generic;

import java.util.*;

/**
 * Created by xm on 2017/3/22.
 */
public class GenericUtils {
    /*
    *
    * List<T>  泛型类型的擦除， 在泛型内边不能 使用 new T()
    * 解决办法构造函数中显示的指定Class 参数   c.newInstance(); 创建数组 Array.newInstance(type,size)
    *
    *  List<T extends Number>
    *
    *  list< ? extends T>   能够获得元素 不能添加元素      数组类型转换而来 List<subT>
    *  list<?  super T>  添加元素，不能获得元素
    * */
    public static <T> Set<T> union(Set<T> a, Set<T>b){
        HashSet<T> result=new HashSet<T>(a);
        result.addAll(b);
        return  result;
    }

    public static <T> Set<T> intersection(Set<T> a, Set<T>b){
        HashSet<T> result=new HashSet<T>(a);
        result.retainAll(b);
        return result;
    }

    public static <T> boolean  compare(T a,T b){
        return a.equals(b);
    }
    /*
    *   泛型方法与是不是泛型类没有关系
    *
    * */
    public static <T> void print(T t){
        System.out.println(t.getClass().getName());
    }

    public static void main(String args[]){

        System.out.println(compare("1", new String("1")));
        print("");
        print(1);
        print(2.3f);
        List<? extends  Number> ls=new ArrayList<Number>();

        List<Number> ls2=new ArrayList<Number>();
        ls2.add(1);

        System.out.println(ls);

        System.out.println(Arrays.toString(ls.getClass().getTypeParameters()));

        Pair<String> pair=new Pair<String>("1","s");
        pair.equals2(new String("1"));
    }

}

class Generic<T>{
    private Class<T> c;

    public Generic(Class<T> c){ // 显示的指定类型
        this.c=c;
    }
    public T create(){
//        return new T();  泛型类型的擦除，
        try {
            return c.newInstance();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}

class Pair<T>{
    private T first;
    private T second;

    public Pair(T first,T second){
        this.first=first;
        this.second=second;
    }

    public boolean equals2(T v){
        return first.equals(v);
    }

}