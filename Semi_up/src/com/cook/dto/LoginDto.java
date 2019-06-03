package com.cook.dto;

import java.util.Date;

public class LoginDto {

	private int seq;
	private String name;
	private String id;
	private String pw;
	private String addr;
	private String email;
	private int dob;
	private String pick;

	
	public LoginDto() {
		
	}

	public LoginDto(int seq, String name, String id, String pw, String addr, String email, int dob, String pick) {
		super();
		this.seq = seq;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.addr = addr;
		this.email = email;
		this.dob = dob;
		this.pick = pick;

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

	public int getDob() {
		return dob;
	}

	public void setDob(int dob) {
		this.dob = dob;
	}

	public String getPick() {
		return pick;
	}

	public void setPick(String pick) {
		this.pick = pick;
	}

	
}
