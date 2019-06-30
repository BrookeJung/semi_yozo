package com.user_login.dto;

public class LoginDto {

	private int userseq;
	private String name;
	private String id;
	private String pw;
	private String phone;
	private String email;
	private String addr;
	private String zonecode;
	private String enabled;
	private String role;
	
	public LoginDto() {
		
	}

	public LoginDto(int userseq, String name, String id, String pw, String phone, String email ,String addr, String zonecode,String enabled, String role) {
		super();
		this.userseq = userseq;
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
		this.zonecode = zonecode;
		this.enabled = enabled;
		this.role = role;


	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	

	public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
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
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getZonecode() {
		return zonecode;
	}

	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}


	
}
