package com.dfby.dao;

import com.dfby.pojo.Board;

import java.util.List;

public interface BoardMapper {
    int deleteByPrimaryKey(Integer boardid);

    int insert(Board record);

    int insertSelective(Board record);

    Board selectByPrimaryKey(Integer boardid);

    List<Board> selectAll();

    int updateByPrimaryKeySelective(Board record);

    int updateByPrimaryKey(Board record);
}