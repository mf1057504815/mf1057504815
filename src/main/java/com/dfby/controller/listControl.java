package com.dfby.controller;

import com.dfby.pojo.Board;
import com.dfby.pojo.Boardtype;
import com.dfby.pojo.Topic;
import com.dfby.service.BoardService;
import com.dfby.service.BoardtypeService;
import com.dfby.service.TopicService;
import com.dfby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class listControl {
    @Autowired
    private TopicService topicService;

    @Autowired
    private BoardService boardService;
    @RequestMapping("/list")
    public String list(Topic topic,Page page,Model model) {

        if (page==null) {
            page=new Page();
        }
        page.setPageSize(10);
        page.setRowCount(topicService.selectCoundByCon(topic));
        List<Topic> topicList=topicService.selectListByCon(topic,page);
        page.setPageList(topicList);
        model.addAttribute("mypage", page);
        model.addAttribute("board",boardService.selectByPrimaryKey(topic.getBoardid()));

        System.out.println(topic+"======");
        System.out.println(page+"~~~~~~");
        System.out.println(topicList);
        return "list";
    }
}
