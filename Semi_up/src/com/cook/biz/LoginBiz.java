package com.cook.biz;

import java.util.List;

import com.cook.dao.LoginDao;
import com.cook.dto.LoginDto;

public class LoginBiz {
	
	private LoginDao dao = new LoginDao();
	
	public LoginDto login(String id, String pw) {
		return dao.login(id, pw);
	}
	public List<LoginDto> seleList(){
		return dao.selectlist();
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
