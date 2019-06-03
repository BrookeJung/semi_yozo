package com.cook.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.cook.dto.BoardDto;

public class BoardDao extends SqlMapConfig{

	
	String namespace = "boardmapper.";
	
	public List<BoardDto> selectAll(){
		
		SqlSession session = null;
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			session=getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectList");
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
		
	}
	
	public BoardDto selectOne(int boardno) {
		BoardDto dto = new BoardDto();
		SqlSession session = null;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne", boardno);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
		
	}
	
	public int insert(BoardDto dto) {
		int res = 0;
		
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			res=session.insert(namespace+"writer_insert", dto);
			
			if(res > 0 ) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return res;
	}
	
	public int update(BoardDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(namespace+"writer_update", dto);
			if(res > 0){
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return res;
	}
	
	public int dalete(int boardno) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.delete(namespace+"writerdelete", boardno);
			
			if(res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
		
	}
	
}
