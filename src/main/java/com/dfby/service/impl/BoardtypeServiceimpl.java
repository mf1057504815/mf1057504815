package com.dfby.service.impl;

import com.dfby.dao.BoardtypeMapper;
import com.dfby.pojo.Board;
import com.dfby.pojo.Boardtype;
import com.dfby.service.BoardtypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardtypeServiceimpl implements BoardtypeService{
    @Autowired
    private BoardtypeMapper boardtypeMapper;

    @Override
    public int insert(Boardtype boardtype) {
        return boardtypeMapper.insert(boardtype);
    }
    @Override
    public int insertSelective(Boardtype boardtype) {
        return boardtypeMapper.insertSelective(boardtype);
    }

    @Override
    public int deleteByPrimaryKey(int boardtypeid) {
        return boardtypeMapper.deleteByPrimaryKey(boardtypeid);
    }
    @Override
    public int updateByPrimaryKey(Boardtype boardtype) {
        return boardtypeMapper.updateByPrimaryKey(boardtype);
    }

    @Override
    public int updateByPrimaryKeySelective(Boardtype boardtype) {
        return boardtypeMapper.updateByPrimaryKeySelective(boardtype);
    }
    @Override
    public Boardtype selectByPrimaryKey(int boardtypeid) {
        return boardtypeMapper.selectByPrimaryKey(boardtypeid);
    }
    @Override
    public List<Boardtype> selectAll() {
        return boardtypeMapper.selectAll();
    }
}
