package com.xm.base.exceptions;

import org.junit.Test;

/**
 * Created by xm on 2017/3/24.
 */
public class ExceptionUtils {

    @Test
    public void exception(){
        Throwable t=new Throwable();
//        t.printStackTrace();
       for(StackTraceElement st:t.getStackTrace()){
              System.out.println(st);
       }

    }
}
