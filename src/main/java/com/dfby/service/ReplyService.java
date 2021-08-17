package com.dfby.service;

import com.dfby.pojo.Boardtype;
import com.dfby.pojo.Reply;
import com.dfby.pojo.Topic;
import com.dfby.util.Page;

import java.util.List;

public interface ReplyService {
    int deleteByPrimaryKey(int replyid);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(int replyid);
    //List<Reply> selectAll();
    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKey(Reply record);

    List<Reply> selectByTopicId(int topicId);

    int selectCoundByCon(Reply record);

    List<Reply> selectListByCon(Reply reply, Page page);
}
