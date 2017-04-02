package com.xm.user.web;

import com.xm.user.domain.User;
import com.xm.user.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by xm on 2016/12/9.
 */
@Controller
@RequestMapping("/user")
public class UserAction {

    @Autowired
    private UserService userService;

    @Autowired
    @Qualifier("userValidator")
    private Validator validator;

    public static final Logger log = LoggerFactory.getLogger(UserAction.class);

   @RequestMapping("/index")
   public String index(HttpSession session){
       User user=(User)session.getAttribute("user");
       if(user!=null){
           return "blog/index";
       }else{
           return "forward:/jsp/user/login.jsp";
       }

   }


   @ResponseBody
   @RequestMapping("/login")
   public Map login( String username, String password,HttpSession session){
       HashMap<String,Object> result=new HashMap<String,Object>();
        User user=userService.getUserByName(username);
       if(user!=null && user.getPassword().equals(password))
       {
           session.setAttribute("user",user);
           result.put("code",1);
           result.put("msg","登录成功");
       }else{
           result.put("code",-1);
           result.put("msg","用户名或者密码不正确");
       }
       return result;
   }

    @ResponseBody
    @RequestMapping("/register")
    public Map register(@Validated User user,
                        BindingResult bindingResult ){
        HashMap<String,Object> result=new HashMap<String,Object>();
        if (bindingResult.hasErrors()) {
            bindingResult.getAllErrors();
        }
        try{
            userService.addUser(user);
            result.put("code",1);
            result.put("msg","添加用户成功");
        }catch (Exception e){
            e.printStackTrace();
            result.put("code",-1);
            result.put("msg","服务忙");
        }

        return result;
    }

    @ResponseBody
    @RequestMapping("/exist")
    public Map exist(String username){
        HashMap<String,Object> result=new HashMap<String,Object>();
        boolean exist=userService.checkUserIsExist(username);
        result.put("valid",!exist);
        return result;
    }



    @ResponseBody
    @RequestMapping("getList")
    public Map getList(HttpSession session){

        User user= (User) session.getAttribute("user");
        HashMap<String,Object> map=new HashMap<String,Object>();
        map.put("code",0);
        map.put("msg","");

        HashMap<String,Object> data=new HashMap<String,Object>();
        data.put("mine",user);

        map.put("data",data);

//        data.put("friend",userService.queryGroup(user.getId()));

        HashMap<String,Object> friend=new HashMap<String,Object>();
        return map;
    }



}
