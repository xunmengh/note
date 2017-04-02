package com.xm.base.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Created by xm on 2017/3/23.
 */
/*
 *  @Target  注解使用的位置  构造器，field ,局部变量，类，参数
 *  @Retention 保留 注解的作用范围
 *
* */


@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface UseCase {
    /*
    * 只能包含基本类型 和 String  class  enum  annotation
    *
    * */

    public int id();

    public String description() default "no description";
}
