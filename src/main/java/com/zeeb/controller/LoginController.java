package com.zeeb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.ModelMap;

/**
 * Created by cain on 17/6/25.
 */
@Controller


public class LoginController {
    //登录
    @RequestMapping("/login")
    public String Login(){
        return "login/login";
    }
    //注册
    @RequestMapping("/register")
    public String Register(){
        return "login/register";
    }

}
