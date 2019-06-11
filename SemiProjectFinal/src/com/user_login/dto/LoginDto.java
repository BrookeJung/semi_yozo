package com.user_login.dto;

public class LoginDto {

	private int seq;
	private String name;
	private String id;
	private String pw;
	private String email;
	private String addr;


	
	public LoginDto() {
		
	}

	public LoginDto(int seq, String name, String id, String pw,  String email ,String addr) {
		super();
		this.seq = seq;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.addr = addr;
		


	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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
