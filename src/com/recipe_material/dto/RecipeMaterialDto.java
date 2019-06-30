package com.recipe_material.dto;

// 레시피재료 DTO
public class RecipeMaterialDto {
	
//	레시피코드
	private int recipe_id;
//	재료순번
	private int irdnt_sn;
//	재료명
	private String irdnt_nm;
//	재료용량
	private String irdnt_cpcty;
//	재료타입 코드
	private String irdnt_ty_code;
//	재료 타입명
	private String irdnt_ty_nm;
	
	private int price;
	
	public int getPrice() {
		return price;
	}







	public void setPrice(int price) {
		this.price = price;
	}







	public RecipeMaterialDto() {
		
	}
	
	
	
	



	public RecipeMaterialDto(int recipe_id, int irdnt_sn, String irdnt_nm, String irdnt_cpcty, String irdnt_ty_code,
			String irdnt_ty_nm, int price) {
		super();
		this.recipe_id = recipe_id;
		this.irdnt_sn = irdnt_sn;
		this.irdnt_nm = irdnt_nm;
		this.irdnt_cpcty = irdnt_cpcty;
		this.irdnt_ty_code = irdnt_ty_code;
		this.irdnt_ty_nm = irdnt_ty_nm;
		this.price = price;
	}







	public RecipeMaterialDto(int recipe_id, int irdnt_sn, String irdnt_nm, String irdnt_cpcty, String irdnt_ty_code,
			String irdnt_ty_nm) {
		this.recipe_id = recipe_id;
		this.irdnt_sn = irdnt_sn;
		this.irdnt_nm = irdnt_nm;
		this.irdnt_cpcty = irdnt_cpcty;
		this.irdnt_ty_code = irdnt_ty_code;
		this.irdnt_ty_nm = irdnt_ty_nm;
	}
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public int getIrdnt_sn() {
		return irdnt_sn;
	}
	public void setIrdnt_sn(int irdnt_sn) {
		this.irdnt_sn = irdnt_sn;
	}
	public String getIrdnt_nm() {
		return irdnt_nm;
	}
	public void setIrdnt_nm(String irdnt_nm) {
		this.irdnt_nm = irdnt_nm;
	}
	public String getIrdnt_cpcty() {
		return irdnt_cpcty;
	}
	public void setIrdnt_cpcty(String irdnt_cpcty) {
		this.irdnt_cpcty = irdnt_cpcty;
	}
	public String getIrdnt_ty_code() {
		return irdnt_ty_code;
	}
	public void setIrdnt_ty_code(String irdnt_ty_code) {
		this.irdnt_ty_code = irdnt_ty_code;
	}
	public String getIrdnt_ty_nm() {
		return irdnt_ty_nm;
	}
	public void setIrdnt_ty_nm(String irdnt_ty_nm) {
		this.irdnt_ty_nm = irdnt_ty_nm;
	}
	
	
} 
