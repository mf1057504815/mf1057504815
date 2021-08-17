package com.dfby.service.impl;

import com.dfby.dao.TopicMapper;
import com.dfby.pojo.Reply;
import com.dfby.pojo.Topic;
import com.dfby.service.TopicService;
import com.dfby.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TopicServiceimpl implements TopicService {
    @Autowired
    private TopicMapper topicMapper;

    @Override
    public int insert(Topic topic) {
        return topicMapper.insert(topic);
    }

    @Override
    public int insertSelective(Topic topic) {
        return topicMapper.insertSelective(topic);
    }

    @Override
    public int deleteByPrimaryKey(int topicid) {
        return topicMapper.deleteByPrimaryKey(topicid);
    }

    @Override
    public int updateByPrimaryKey(Topic topic) {
        return topicMapper.updateByPrimaryKey(topic);
    }

    @Override
    public int updateByPrimaryKeySelective(Topic topic) {
        return topicMapper.updateByPrimaryKeySelective(topic);
    }

    @Override
    public Topic selectByPrimaryKey(int topicid) {
        return topicMapper.selectByPrimaryKey(topicid);
    }

//    @Override
//    public List<Topic> selectAll() {
//        return topicMapper.selectAll();
//    }

    @Override
    public int selectCoundByCon(Topic topic) {
        return topicMapper.selectCoundByCon(topic);
    }


    @Override
    public List<Topic> selectListByCon(Topic topic, Page page) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("topicCon", topic);
        paramMap.put("pageStart", (page.getPageNo() - 1) * page.getPageSize());
        paramMap.put("pageSize",page.getPageSize());
        return topicMapper.selectListByCon(paramMap);
    }
    @Override
    public int selectTimeDesc(){
        return topicMapper.selectTimeDesc();
    };
}
