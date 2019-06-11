package com.refrigerator.dto;

public class RefrigeratorDto {
	
	private String id;
	private String irdnt_nm;
	
	public RefrigeratorDto() {
		super();
	}

	public RefrigeratorDto(String id, String irdnt_nm) {
		super();
		this.id = id;
		this.irdnt_nm = irdnt_nm;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIrdnt_nm() {
		return irdnt_nm;
	}

	public void setIrdnt_nm(String irdnt_nm) {
		this.irdnt_nm = irdnt_nm;
	}
	
	
	

}
