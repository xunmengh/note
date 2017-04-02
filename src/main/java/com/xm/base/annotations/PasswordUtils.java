package com.xm.base.annotations;

import java.lang.reflect.Method;

/**
 * Created by xm on 2017/3/23.
 *
 */
public class PasswordUtils {

    @UseCase(id = 12)
    public boolean validatePassword(String password){
        return password.matches("\\w*");

    }

    public static void main(String args[]){
        for(Method m : PasswordUtils.class.getDeclaredMethods()){
            UseCase useCase= m.getAnnotation(UseCase.class);
            if(useCase!=null){
               System.out.println(useCase.id()+" "+useCase.description());
            }
        }
    }
}
