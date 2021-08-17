package com.dfby.service.impl;

import com.dfby.dao.ReplyMapper;
import com.dfby.pojo.Boardtype;
import com.dfby.pojo.Reply;
import com.dfby.pojo.Topic;
import com.dfby.service.ReplyService;
import com.dfby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReplyServiceimpl implements ReplyService {
    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public int insert(Reply reply) {
        return replyMapper.insert(reply);
    }

    @Override
    public int insertSelective(Reply reply) {
        return replyMapper.insertSelective(reply);
    }

    @Override
    public int deleteByPrimaryKey(int replyid) {
        return replyMapper.deleteByPrimaryKey(replyid);
    }

    @Override
    public int updateByPrimaryKey(Reply reply) {
        return replyMapper.updateByPrimaryKey(reply);
    }

    @Override
    public int updateByPrimaryKeySelective(Reply reply) {
        return replyMapper.updateByPrimaryKeySelective(reply);
    }

    @Override
    public Reply selectByPrimaryKey(int replyid) {
        return replyMapper.selectByPrimaryKey(replyid);
    }

    @Override
    public List<Reply> selectByTopicId(int topicId) {
        return replyMapper.selectByTopicId(topicId);
    }
//    @Override
//    public List<Reply> selectAll() {
//        return replyMapper.selectAll();
//    }

    @Override
    public int selectCoundByCon(Reply reply) {
        return replyMapper.selectCoundByCon(reply);
    }

    @Override
    public List<Reply> selectListByCon(Reply reply, Page page) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("replyCon", reply);
        if (page.getPageNo()!=1) {
            paramMap.put("pageStart", (page.getPageNo() - 1) * page.getPageSize() - 1);
            paramMap.put("pageSize", page.getPageSize());
        } else {
            paramMap.put("pageStart", (page.getPageNo() - 1) * page.getPageSize());
            paramMap.put("pageSize", page.getPageSize()-1);
        }

        return replyMapper.selectListByCon(paramMap);
    }
}
