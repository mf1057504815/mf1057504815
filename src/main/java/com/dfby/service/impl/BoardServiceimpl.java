package com.dfby.service.impl;

import com.dfby.dao.BoardMapper;
import com.dfby.pojo.Board;
import com.dfby.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceimpl implements BoardService {
    @Autowired
    private BoardMapper boardMapper;

    @Override
    public int insert(Board board) {
        return boardMapper.insert(board);
    }
    @Override
    public int insertSelective(Board board) {
        return boardMapper.insertSelective(board);
    }

    @Override
    public int deleteByPrimaryKey(int boardid) {
        return boardMapper.deleteByPrimaryKey(boardid);
    }
    @Override
    public int updateByPrimaryKey(Board board) {
        return boardMapper.updateByPrimaryKey(board);
    }

    @Override
    public int updateByPrimaryKeySelective(Board board) {
        return boardMapper.updateByPrimaryKeySelective(board);
    }
    @Override
    public Board selectByPrimaryKey(int boardid) {
        return boardMapper.selectByPrimaryKey(boardid);
    }

    @Override
    public List<Board> selectAll() {
        return boardMapper.selectAll();
    }
}
