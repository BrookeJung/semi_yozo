package com.que_board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.que_board.db.SqlMapConfig;
import com.que_board.dto.QueBoardDto;

public class QueBoardDao extends SqlMapConfig {

	String namespace = "board.mapper.";
	SqlMapConfig sqlmapconfig = new SqlMapConfig();


	public QueBoardDto selectOne(int boardno) {
		QueBoardDto dto = new QueBoardDto();
		SqlSession session = null;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("boardno", boardno);
		session = getSqlSessionFactory().openSession();
		dto = session.selectOne(namespace + "selectOne", map);

		return dto;
	}

	public int boardInsert(QueBoardDto dto) {
		int res = 0;

		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "boardInsert", dto);

			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return res;
	}

	public int boardUpdate(QueBoardDto dto) {
		int res = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "boardUpdate", dto);

			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int boardDelete(int groupno) {
		int res = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "boardDelete", groupno);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}
	
	public int boardDel(int boardno) {
		int res = 0;
		SqlSession session = null;

		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "boardDel", boardno);
			if (res > 0) {
				session.commit();
			}

		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int boardDeleteReply(int boardno) {

		int res = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.delete(namespace + "boardDeleteReply", boardno);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	}



	public int updateAns(int parentno) {
		int res = 0;
		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.update(namespace + "updateAns", parentno);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}

	public int insertAns(QueBoardDto dto) {
		int res = 0;

		SqlSession session = null;
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace + "insertAns", dto);

			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return res;
	}

	public int getTotalCount(int opt, String condition) {
		int cnt = 0;
		SqlSession session = null;
		List<QueBoardDto> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("opt", opt + "");

	    if (opt == 0) {
			map.put("title", condition);
		} else if (opt == 1) {
			map.put("content", condition);
		} else if (opt == 2) {
			map.put("title", condition);
			map.put("content", condition);
		} else if (opt==3){
			map.put("writer", condition);
		} else {
			map.put("boardno",0);
		}

		try {
			session = getSqlSessionFactory().openSession();
			cnt = session.selectOne(namespace + "getTotalCount",map);
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			session.close();
		}

		return cnt;
	}

	public List<QueBoardDto> selectListOption(int opt, String condition, int begin, int end) {
		List<QueBoardDto> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);

		SqlSession session = null;

	    if (opt == 0) {
			map.put("title", condition);
		} else if (opt == 1) {
			map.put("content", condition);
		} else if (opt == 2) {
			map.put("title", condition);
			map.put("content", condition);
		} else if (opt==3){
			map.put("writer", condition);
		} else {
			map.put("boardno",0);
		}

		try {
			session = getSqlSessionFactory().openSession();
			list = session.selectList(namespace + "selectListOption", map);
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			session.close();
		}

		return list;
	}

	public List<QueBoardDto> selectListReply(int groupno) {

		SqlSessionFactory sqlSessionFactory = sqlmapconfig.getSqlSessionFactory();

		SqlSession session = sqlSessionFactory.openSession();
		List<QueBoardDto> list = session.selectList(namespace + "selectListReply", groupno);
		session.close();

		return list;
	}

	public int replyCntup(int boardno) {
		int res = 0;
		SqlSessionFactory sqlSessionFactory = sqlmapconfig.getSqlSessionFactory();
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession(false);
			res = session.update(namespace + "replyCntup", boardno);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;

	}

}
