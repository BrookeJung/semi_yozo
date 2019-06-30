package com.user_login.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.user_login.dto.LoginDto;

public class LoginDao extends SqlMapConfig{

	String namespace = "loginmapper.";
	boolean idnotused;
	public List<LoginDto> selectlist() {
	
		List<LoginDto> list = new ArrayList<LoginDto>();

		
		SqlSession session = null;
		try {
			session=getSqlSessionFactory().openSession();
			list = session.selectList(namespace+"selectlist");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return list;
		
	}
	public LoginDto selectOne(int userseq) {
		
		LoginDto dto = new LoginDto();
		
		SqlSession session = null;
		
		try {
			session=getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"selectOne", userseq);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
	}
	
	public boolean idChk(String id) {
		Map<String, String> idChk = new HashMap<String, String>();

		idChk.put("id", id);
		SqlSession session = null;
		LoginDto dto = new LoginDto();
		try { 
			session=getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"idChk",idChk);
			if(dto == null) {
				idnotused = true;
			}else {
				idnotused = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return idnotused;
		
	}
	public LoginDto idSearch(String name, String email) {

		Map<String, Object> idSearch = new HashMap<String, Object>();
		idSearch.put("name", name);
		idSearch.put("email", email);
		SqlSession session = null;
		LoginDto dto = new LoginDto();

		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "idSearch", idSearch);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return dto;
	}
	public LoginDto pwSearch(String id, String email) {

		Map<String, Object> pwSearch = new HashMap<String, Object>();
		pwSearch.put("id", id);
		pwSearch.put("email", email);
		SqlSession session = null;
		LoginDto dto = new LoginDto();

		try {
			session = getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace + "pwSearch", pwSearch);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return dto;
	}
	public LoginDto login(String id, String pw ) {
		Map<String, String> login = new HashMap<String, String>();
		login.put("id", id);
		login.put("pw", pw);
		SqlSession session = null;
		LoginDto dto = new LoginDto();
		
		try {
			session=getSqlSessionFactory().openSession();
			dto = session.selectOne(namespace+"login",login);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public int user_insert(LoginDto dto) {
		int res = 0;
		
		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(false);
			res = session.insert(namespace+"user_insert",dto);
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
	
	public int pwUpdate(String code,String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pw", code);
		map.put("id", id);
		
		SqlSession session = null;
	
		int res = 0;
		
			try {
				session=getSqlSessionFactory().openSession(false);
				res = session.update(namespace+"pwUpdate", map);
				if(res>0) {
					session.commit();
					System.out.println("성공쓰");
				}
			} catch (IOException e) {
				session.rollback();
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
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
	
	public int user_delete(int userseq) {
		int res = 0;
		
		SqlSession session = null;
		try {
			session=getSqlSessionFactory().openSession(false);
			res=session.update(namespace+"user_delete", userseq);
			
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
	
	public LoginDto kakaologin(String id) {
	      Map<String, String> kakaologin = new HashMap<String, String>();
	      kakaologin.put("id", id);
	      SqlSession session = null;
	      LoginDto dto = new LoginDto();
	      
	      try {
	         session=getSqlSessionFactory().openSession();
	         dto = session.selectOne(namespace+"kakaologin",kakaologin);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return dto;
	   }
	

}
