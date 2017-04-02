package com.xm.base.clazz;

/**
 * Created by xm on 2017/3/22.
 */
public class Entity/* <K>*/  {
    private int age=10;
    private String name;
    private String internal;
    public int out;

   /* public void createArray(Class<K> type){
        Array.newInstance(type.getComponentType(), 4);
    }*/


   /* private K[] arry;

    public K[] getArry(){
        return arry;
    }

    public void setArry(K[] v){
        this.arry=v;
    }*/

    public Entity(){

    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private void setInternal(String internal){
        this.internal=internal;
    }

}
