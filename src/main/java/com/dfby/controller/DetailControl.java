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

import java.util.List;

@Controller

public class DetailControl {
    @Autowired
    private TopicService topicService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private ReplyService replyService;
    @RequestMapping("/detail")
    public String list(Topic topic,Reply reply,Page page,Model model) {
        if (page==null) {
            page=new Page();
        }

        model.addAttribute("topic",topicService.selectByPrimaryKey(topic.getTopicid()));
        page.setPageSize(5);
        System.out.println(reply+"======");
        page.setRowCount(replyService.selectCoundByCon(reply));
        System.out.println(page+"~~~~~~");
        List<Reply> replyList=replyService.selectListByCon(reply,page);
        System.out.println(replyList);
        page.setPageList(replyList);
        model.addAttribute("mypage", page);
        model.addAttribute("board",boardService.selectByPrimaryKey(topic.getBoardid()));


        return "detail";
    }

    @RequestMapping("/delete")
    public String delete(Topic topic,Reply reply,Page page,Model model){
        if(replyService.deleteByPrimaryKey(reply.getReplyid())>0){
            model.addAttribute("msg","删除成功");
        }else{
            model.addAttribute("msg","删除失败");
        }
        return "forward:/detail";
    }

    @RequestMapping("/toupdate")
    public String toUpdate(Topic topic,Reply reply,int pageNo,Model model){
        model.addAttribute("reply",replyService.selectByPrimaryKey(reply.getReplyid()));

        model.addAttribute("pageNo",pageNo);
        model.addAttribute("topic",topic);
        return "update";
    }

    @RequestMapping("/update")
    public String update(Topic topic,Reply reply,Integer pageNo,Model model) {
        replyService.updateByPrimaryKeySelective(reply);
        System.out.println(reply);
        System.out.println(topic);
        model.addAttribute("topic",topic);
        model.addAttribute("reply",reply);
        model.addAttribute("pageNo",pageNo);
        return "forward:/detail";
    }

}
