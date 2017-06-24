package com.zeeb.controller;

import com.zeeb.model.CategoryEntity;
import com.zeeb.model.MessageEntity;
import com.zeeb.model.UserEntity;
import com.zeeb.repository.CategoryRepository;
import com.zeeb.repository.MessageRepository;
import com.zeeb.repository.UserGroupRepository;
import com.zeeb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.List;

/**
 * Created by cain on 17/6/24.
 */

@Controller

public class MessageController {
    // 自动装配数据库接口，不需要再写原始的Connection来操作数据库
    @Autowired
    MessageRepository messageRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    CategoryRepository categoryRepository;
//返回首页
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getMessage(ModelMap modelMap) {
        // 查询message表中所有记录
        List<MessageEntity> messageList = messageRepository.findAll();
        List<CategoryEntity> categoryEntityList =categoryRepository.findAll();
        // 将所有记录传递给要返回的jsp页面，放在messageList当中
        modelMap.addAttribute("messageList", messageList);
        modelMap.addAttribute("categoryEntityList",categoryEntityList);
        return "home/home";
    }

    //查看留言详情,默认使用GET方法时，method可以缺省
    @RequestMapping("/message/detail/{id}")
    public String showMessage(@PathVariable("id") int id, ModelMap modelMap){
        //查询messag中单个message
        MessageEntity message = messageRepository.findOne(id);
        //将message注入jsp
        modelMap.addAttribute("message",message);
        return "home/messagedetail";
    }
    //添加留言请求
    @RequestMapping("/message/add")
    public String addMessage(ModelMap modelMap){
        List<UserEntity> userEntityList = userRepository.findAll();
        List<CategoryEntity> categoryEntityList =categoryRepository.findAll();
        //向页面注入用户和分类列表
        modelMap.addAttribute("userEntityList",userEntityList);
        modelMap.addAttribute("categoryEntityList",categoryEntityList);
        return "home/addmessage";
    }


    //新增留言,处理留言post请求
    @RequestMapping(value = "/addmessage",method = RequestMethod.POST)
    public String addMessagePost(@ModelAttribute("message") MessageEntity message){
        //保存并刷新
        messageRepository.saveAndFlush(message);
        //重定向到首页
        return "redirect:/";
    }

}
