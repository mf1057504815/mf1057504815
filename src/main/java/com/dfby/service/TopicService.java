package com.dfby.service;

import com.dfby.pojo.Boardtype;
import com.dfby.pojo.Topic;
import com.dfby.util.Page;

import java.util.List;
import java.util.Map;

public interface TopicService {
    int deleteByPrimaryKey(int topicid);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectByPrimaryKey(int topicid);

    //List<Topic> selectAll();
    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);

    int selectCoundByCon(Topic topic);

     List<Topic> selectListByCon(Topic topic, Page page);

    int selectTimeDesc();
}
