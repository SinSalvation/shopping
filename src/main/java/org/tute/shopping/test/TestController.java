package org.tute.shopping.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.tute.shopping.user.dao.UserMapper;

/**
 * Description : TestController
 * Created by code4j on 2016/4/3 0003
 * 09:55
 */
@Controller("test")
@RequestMapping("test")
public class TestController {

    @Autowired
    private UserMapper useMapper;

    @RequestMapping(value="index")
    public String index(){
        return "index";
    }
    @RequestMapping(value="search")
    public String search(){
        return "search";
    }
    @RequestMapping(value="book")
    public String book(){
        return "book";
    }
    @RequestMapping(value="login")
    public String login(){
        return "login";
    }
    @RequestMapping(value="register")
    public String register(){
        return "register";
    }
    @RequestMapping(value="user")
    public String user(){
        return "user";
    }
    @RequestMapping(value="cart")
    public String cart(){
        return "cart";
    }
    @RequestMapping(value="order")
    public String order(){
        return "order";
    }
    @RequestMapping(value="finish")
    public String finish(){
        return "finish";
    }
    @RequestMapping(value="notfound")
    public String notfound(){
        return "404page";
    }
    @RequestMapping(value = "test",method = RequestMethod.POST,produces = "application/json")
    @ResponseBody
    public String test(@RequestParam String username){
        System.out.println("username --> "+username);
        return "done";
    }
}
