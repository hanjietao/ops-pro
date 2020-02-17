package com.pepper.project.he.board.service;

import com.pepper.project.he.board.domain.Board;

import java.util.List;

public interface IBoardService {

    List<Board> selectBoardList(Board board);
    int insertBoard(Board board);

    int deleteBoardByIds(String ids);

    Board selectBoardById(Integer id);

    int updateBoard(Board board);

}
