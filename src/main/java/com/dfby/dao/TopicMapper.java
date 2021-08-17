package com.dfby.dao;

import com.dfby.pojo.Reply;
import com.dfby.pojo.Topic;

import java.util.List;
import java.util.Map;

public interface TopicMapper {
    int deleteByPrimaryKey(Integer topicid);

    int insert(Topic record);

    int insertSelective(Topic record);

    Topic selectByPrimaryKey(Integer topicid);

    //List<Topic> selectAll();

    int updateByPrimaryKeySelective(Topic record);

    int updateByPrimaryKey(Topic record);

    int selectCoundByCon(Topic topic);

    List<Topic> selectListByCon(Map<String, Object> paramMap);

    int selectTimeDesc();

}