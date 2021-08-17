package com.dfby.service;

import com.dfby.pojo.Board;
import com.dfby.pojo.Boardtype;

import java.util.List;

public interface BoardtypeService {
    int deleteByPrimaryKey(int boardtypeid);

    int insert(Boardtype record);

    int insertSelective(Boardtype record);

    Boardtype selectByPrimaryKey(int boardtypeid);

    List<Boardtype> selectAll();

    int updateByPrimaryKeySelective(Boardtype record);

    int updateByPrimaryKey(Boardtype record);
}
