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
	public List<LoginDto> seleList(){
		return dao.selectlist();
	}
	public LoginDto idSearch(String name, String email) {
		return dao.idSearch(name, email);
	}
	public LoginDto selectOne(int seq) {
		return dao.selectOne(seq);
	}
	public int user_insert(LoginDto dto) throws IOException {
		return dao.user_insert(dto);
	}
	public int user_update(LoginDto dto) {
		return dao.user_update(dto);
	}
	public int user_delete(int seq) {
		return dao.user_delete(seq);
	}
	
	public boolean idChk(String id) {
		return dao.idChk(id);
	}
	

}
