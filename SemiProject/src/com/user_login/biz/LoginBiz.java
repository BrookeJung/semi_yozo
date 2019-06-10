package com.user_login.biz;

import java.util.List;

import com.user_login.LoginDao;
import com.user_login.LoginDto;

public class LoginBiz {
	
	private LoginDao dao = new LoginDao();
	
	public LoginDto login(String id, String pw) {
		return dao.login(id, pw);
	}
	public List<LoginDto> seleList(){
		return dao.selectlist();
	}
	public LoginDto idChk(String id) {
		return dao.idChk(id);
	}
	public LoginDto selectOne(int seq) {
		return dao.selectOne(seq);
	}
	public int user_insert(LoginDto dto) {
		return dao.user_insert(dto);
	}
	public int user_update(LoginDto dto) {
		return dao.user_update(dto);
	}
	public int user_delete(int seq) {
		return dao.user_delete(seq);
	}

}
