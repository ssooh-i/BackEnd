package board.model.dao;

import java.util.List;

import board.model.dto.BoardDto;

public interface BoardDao {
// 기본 5개 C, R(List), R, U, D 만들기
	int insertBoard(BoardDto board);
	List<BoardDto> getlistBoard();
	BoardDto searchBoard(BoardDto board);
	int updateBoard(BoardDto board);
	int deleteBoard(BoardDto board);
}
