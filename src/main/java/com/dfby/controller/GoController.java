package com.dfby.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoController {

    @RequestMapping("/go/{path}")
    public String go(@PathVariable String path){
        System.out.println(path+"~~~~~");
        return path;
    }
}
