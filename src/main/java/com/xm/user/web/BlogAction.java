package com.xm.user.web;

import com.xm.user.domain.Blog;
import com.xm.user.domain.BlogCatalog;
import com.xm.user.service.BlogService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * Created by xm on 2016/12/9.
 */
@Controller
@RequestMapping("/blog")
public class BlogAction {

    @Autowired
    private BlogService blogService;


    public static final Logger log = LoggerFactory.getLogger(BlogAction.class);

   @ResponseBody
   @RequestMapping("/index")
   public Map index(String uid,int  limit,int offset){
       //limit pageSize  offset
       Map<String,Object> map=new HashMap<String,Object>();
       int total=blogService.countBlogCatalog(uid);
       List<BlogCatalog> bCatalogs=blogService.queryBlogCatalog(uid,limit,offset);
       map.put("total",total);
       map.put("rows",bCatalogs);
       return map;
   }

    @ResponseBody
    @RequestMapping("/delCatalog")
    public  Map delCatalog(@RequestParam(value = "ids[]") Integer[] ids,String uid){
        Map<String,Object> map=new HashMap<String,Object>();
        List<Integer> idList=Arrays.asList(ids);
        blogService.deleteBlogCatalog(idList,uid);
        map.put("code",1);
        map.put("msg","成功");
        return map;
    }

    @ResponseBody
    @RequestMapping("/addCatalog")
    public  Map addCatalog(BlogCatalog blogCatalog){
        Map<String,Object> map=new HashMap<String,Object>();
        blogService.addBlogCatalog(blogCatalog);
        map.put("code",1);
        map.put("msg","成功");
        return map;
    }

    @ResponseBody
    @RequestMapping("/editCatalog")
    public Map editCatalog(String name,int id){
        Map<String,Object> map=new HashMap<String,Object>();
        blogService.updateBlogCatalog(name, id, "123456");
        map.put("code",1);
        map.put("msg","成功");
        return map;
    }

    @ResponseBody
    @RequestMapping("/addBlog")
    public Map addBlog(Blog blog){
        Map<String,Object> map=new HashMap<String,Object>();
        blog.setAuthor("123456");
        blog.setBlogCatalog("1");
        blog.setUpdateTime(new Date());
        blogService.addBlog(blog);
        map.put("code", 1);
        map.put("msg","成功");
        map.put("blogid",blog.getId());
        return map;
    }

    @RequestMapping("/editorBlog")
    public String writerBlog(){
        return "blog/editorBlog";
    }

/*
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
    }*/



}
