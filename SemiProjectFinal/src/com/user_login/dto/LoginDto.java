package com.user_login.dto;

public class LoginDto {

	private int userseq;
	private String name;
	private String id;
	private String pw;
	private String email;
	private String addr;


	
	public LoginDto() {
		
	}

	public LoginDto(int userseq, String name, String id, String pw,  String email ,String addr) {
		super();
		this.userseq = userseq;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.addr = addr;
		


	}

	public int getUserSeq() {
		return userseq;
	}

	public void setUserSeq(int userseq) {
		this.userseq = userseq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	
}
