package com.biz;

import java.util.List;

import com.dao.BoardDao;
import com.dto.BoardDto;

public class BoardBiz {
	
	private BoardDao dao = new BoardDao();
	
	public List<BoardDto> selectAll(){
		return dao.selectAll();
	}
	public BoardDto selectOne(int boardno) {
		return dao.selectOne(boardno);
	}
	public int insert(BoardDto dto) {
		return dao.insert(dto);
	}
	public int update(BoardDto dto) {
		return dao.update(dto);
	}
	public int dalete(int boardno) {
		return dao.dalete(boardno);
	}

}
