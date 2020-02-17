package com.pepper.project.he.board.mapper;

import com.pepper.project.he.board.domain.Board;

import java.util.List;

public interface BoardMapper {

    Board selectBoardById(Integer id);
    List<Board> selectBoardList(Board board);

    public int insertBoard(Board board);

    int deleteBoardByIds(String[] ids);

    int updateBoard(Board board);

}
