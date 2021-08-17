package com.dfby.dao;

import com.dfby.pojo.Board;
import com.dfby.pojo.Reply;
import com.dfby.util.Page;

import java.util.List;
import java.util.Map;

public interface ReplyMapper {
    int deleteByPrimaryKey(Integer replyid);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(Integer replyid);

    //List<Reply> selectAll();

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKey(Reply record);

    List<Reply> selectByTopicId(int topicId);

    int selectCoundByCon(Reply record);

    List<Reply> selectListByCon(Map<String, Object> paramMap);


}