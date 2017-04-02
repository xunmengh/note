package com.xm.user.validator;

import com.xm.user.domain.User;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by xm on 2017/2/20.
 */
public class UserValidator implements Validator{

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object obj, Errors e) {
        ValidationUtils.rejectIfEmptyOrWhitespace(e, "username", "name.empty");
        ValidationUtils.rejectIfEmpty(e, "password", "name.empty");
        ValidationUtils.rejectIfEmpty(e, "email", "email.empty");

        User user=(User)obj;
        String password=user.getPassword();
        Matcher m=Pattern.compile("\\d{10,}").matcher(password);
        if(!m.matches()){
            e.rejectValue("password", "password.reg_error");
        }

    }
}
