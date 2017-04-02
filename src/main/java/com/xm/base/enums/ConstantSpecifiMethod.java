package com.xm.base.enums;

/**
 * Created by xm on 2017/3/23.
 */
public enum ConstantSpecifiMethod {
    chat{
        String getDealClass(){
            return "chat";
        }
    },
    addFriend{
        String getDealClass(){
            return "addFriend";
        }
    };
    abstract String getDealClass();
    public static void main(String args[]){
        for(ConstantSpecifiMethod m:values()){
            System.out.println(m.getDealClass());
        }


    }
}
