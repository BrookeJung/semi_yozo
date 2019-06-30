package com.que_board.biz;

import java.util.List;

import com.que_board.dao.QueBoardDao;
import com.que_board.dto.QueBoardDto;

public class QueBoardBiz {
	
	QueBoardDao dao = new QueBoardDao();
	
	
	public QueBoardDto selectOne(int boardno) {
		return dao.selectOne(boardno);
	}
	
	public int boardInsert(QueBoardDto dto) {
		return dao.boardInsert(dto);
	}
	
	public int boardUpdate(QueBoardDto dto) {
		return dao.boardUpdate(dto);
	}

	public int boardDelete(int groupno) {
		return dao.boardDelete(groupno);
	}
	
	public int boardDel(int boardno) {
		return dao.boardDel(boardno);
	}
	
	public int boardDeleteReply(int boardno) {
		return dao.boardDeleteReply(boardno);
	}


	public int updateAns(int parentno) {
		return dao.updateAns(parentno);
	}
	
	public int insertAns(QueBoardDto dto) {
		return dao.insertAns(dto);
	}
	
	public int getTotalCount(int opt, String condition) {
		return dao.getTotalCount(opt, condition);
	}
	
	public List<QueBoardDto> selectListOption(int opt,String condition,int begin,int end){
		
		return dao.selectListOption(opt, condition, begin, end);
	}
	
	public List<QueBoardDto> selectListReply(int groupno){
		return dao.selectListReply(groupno);
	}
	
	public int replyCntup(int boardno) {
		return dao.replyCntup(boardno);
	}
	
	public int answProc(QueBoardDto dto) {
		int parentno = dto.getBoardno();
		int res1 = dao.updateAns(parentno);
		System.out.println("비즌데여"+parentno);
		int res2 = dao.insertAns(dto);
		System.out.println("Res1:"+res1+"res2:"+res2);
		return res1+res2;
	}
	
	

}