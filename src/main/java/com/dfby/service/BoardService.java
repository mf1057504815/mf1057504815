package com.dfby.service;

import com.dfby.pojo.Board;
import com.dfby.pojo.User;

import java.util.List;

public interface BoardService {
    int deleteByPrimaryKey(int boardid);

    int insert(Board record);

    int insertSelective(Board record);

    Board selectByPrimaryKey(int boardid);

    List<Board> selectAll();
    int updateByPrimaryKeySelective(Board record);

    int updateByPrimaryKey(Board record);
}
