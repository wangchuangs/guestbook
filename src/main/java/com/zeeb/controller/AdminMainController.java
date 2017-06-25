package com.zeeb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by cain on 17/6/25.
 */
@Controller

public class AdminMainController {
    @RequestMapping("/admin")
    public String showadmin(){
        return "/admin/main";
    }
}
