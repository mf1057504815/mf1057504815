package com.dfby.service;

import com.dfby.pojo.Topic;
import com.dfby.pojo.User;

import java.util.List;

public interface UserService {
    int deleteByPrimaryKey(int uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(int uid);

    //List<User> selectAll();
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User checkLogin(User var1);
}
