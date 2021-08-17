package com.dfby.dao;

import com.dfby.pojo.Boardtype;

import java.util.List;

public interface BoardtypeMapper {
    int deleteByPrimaryKey(Integer boardtypeid);

    int insert(Boardtype record);

    int insertSelective(Boardtype record);

    Boardtype selectByPrimaryKey(Integer boardtypeid);

    List<Boardtype> selectAll();

    int updateByPrimaryKeySelective(Boardtype record);

    int updateByPrimaryKey(Boardtype record);
}