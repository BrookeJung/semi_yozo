package com.cook.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.cook.dto.LoginDto;

public class LoginDao extends SqlMapConfig{

	String namespace = "loginmapper.";
	public List<LoginDto> selectlist() {
	
		List<LoginDto> list = new ArrayList<LoginDto>();

		
		SqlSession session = null;
		try {
			session=getSqlSessionFactory().openSession(false);
			list = session.selectList(namespace+"selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
		
	}
	public LoginDto selectOne(int seq) {
		
		LoginDto dto = new LoginDto();
		
		SqlSession session = null;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			dto = session.selectOne(namespace+"selectOne", seq);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
		return dto;
	}
	
	public LoginDto idChk(String id) {
		Map<String, String> idChk = new HashMap<String, String>();
		idChk.put("id", id);
		LoginDto dto = new LoginDto();
		dto = idChk(id);
		return dto;
		
	}
	
	public LoginDto login(String id, String pw ) {
		Map<String, String> login = new HashMap<String, String>();
		login.put("id", id);
		login.put("pw", pw);
		LoginDto dto = new LoginDto();
		dto = login(id, pw);
		
		return dto;
	}
	
	public int user_insert(LoginDto dto) {
		int res = 0;
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"insert",dto);
			if(res > 0) {
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
	
	public int user_update(LoginDto dto) {
		int res = 0;
		SqlSession session = null;
		
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(namespace+"user_update", dto);
			
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
	
	public int user_delete(int seq) {
		int res = 0;
		
		SqlSession session = null;
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.delete(namespace+"user_delete", seq);
			
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