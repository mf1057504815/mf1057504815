package com.dfby.controller;

import com.dfby.pojo.User;
import com.dfby.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class RegControl {
    @Autowired
    private UserService userService;
    @RequestMapping("/reg")
    @ResponseBody
    public String addBook(User user){
        if(userService.insertSelective(user)>0){
            return "success";
        }else {
            return "error";
        }
    }
}
