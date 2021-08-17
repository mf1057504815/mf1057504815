package com.dfby.controller;

import com.dfby.pojo.Reply;
import com.dfby.pojo.Topic;
import com.dfby.service.BoardService;
import com.dfby.service.ReplyService;
import com.dfby.service.TopicService;
import com.dfby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/post")
public class PostControl {
    @Autowired
    private TopicService topicService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private ReplyService replyService;

    @RequestMapping("/toreply")
    public String toreply(Reply reply,Topic topic,int pageNo,Model model) {
        //model.addAttribute("boardid",boardid);
        model.addAttribute("reply", reply);
        model.addAttribute("topic", topic);
        model.addAttribute("pageNo", pageNo);
        System.out.println(pageNo);

        return "post";
    }

    @RequestMapping("/reply")
    public String reply(Topic topic, Reply reply,Integer PageNo, Model model) {


        if (replyService.insertSelective(reply) > 0) {
            model.addAttribute("msgg", "回帖成功");
        } else {
            model.addAttribute("msgg", "回帖失败");
        }
        return "forward:/detail";
    }

    @RequestMapping("/totopic")
    public String totopic(Topic topic, Model model) {
        model.addAttribute("topic", topic);
        return "newpost";
    }

    @RequestMapping("/topic")
    public String topic(Topic topic, int boardid, Model model) {

        if (topicService.insertSelective(topic) > 0) {
            model.addAttribute("msggg", "发贴成功");
        } else {
            model.addAttribute("msggg", "发贴失败");
        }
        System.out.println(topic);
        model.addAttribute("topic", topic);
        model.addAttribute("boardid", boardid);
        model.addAttribute("topicid", topicService.selectTimeDesc());
        return "redirect:/detail";
    }

}


