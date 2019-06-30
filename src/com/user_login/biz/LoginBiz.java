package com.user_login.biz;

import java.io.IOException;
import java.util.List;

import com.user_login.dao.LoginDao;
import com.user_login.dto.LoginDto;

public class LoginBiz {
	
	private LoginDao dao = new LoginDao();
	
	public LoginDto login(String id, String pw) {
		return dao.login(id, pw);
	}
	public LoginDto idSearch(String name, String email) {
		return dao.idSearch(name, email);
	}
	public LoginDto pwSearch(String id, String email) {
		return dao.pwSearch(id, email);
	}
	public List<LoginDto> selectList(){
		return dao.selectlist();
	}
	public LoginDto selectOne(int userseq) {
		return dao.selectOne(userseq);
	}
	public int user_insert(LoginDto dto) throws IOException {
		return dao.user_insert(dto);
	}
	public int user_update(LoginDto dto) {
		return dao.user_update(dto);
	}
	public int pwUpdate(String code,String id) {
		return dao.pwUpdate(code, id);
	}
	public int user_delete(int userseq) {
		return dao.user_delete(userseq);
	}
	
	public boolean idChk(String id) {
		return dao.idChk(id);
	}
	
	public LoginDto kakaologin(String id) {
	      return dao.kakaologin(id);
	   }
	
	

}
