package com.xm.base.enums;

import java.util.EnumMap;
import java.util.EnumSet;

/**
 * Created by xm on 2017/3/23.
 */
public class EnumUtils {

    /*
    *     enum 继承至java.lang.Enum  不能被其他的继承
    * */

    public static void main(String args[]){
        for(week w:week.values()){
            System.out.println(w.name()+" "+w.ordinal());// ordinal 顺序
        }
        for(week w:week.class.getEnumConstants()){
            System.out.println(w.name()+" "+w.ordinal());// ordinal 顺序
        }

        week w=week.valueOf("Monday");
        System.out.println(w.name()+" "+w.ordinal()+" "+w.getDescription());

        /* 能够添加，删除  */
        EnumSet<week> set=EnumSet.allOf(week.class);
        set.removeAll(EnumSet.of(week.Monday));
        System.out.println(set);

        EnumMap<week,String> emap=new EnumMap<week,String>(week.class);
        emap.put(week.Monday,"mon");
        String shortmsg=emap.get(week.Monday);
        System.out.println(shortmsg);
    }

 }
