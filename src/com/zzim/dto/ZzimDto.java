package com.zzim.dto;

public class ZzimDto {
	
	private int seq ;
	private String id;
	private int recipe_id;
	private String recipe_nm_ko;
	
	
	public ZzimDto() {
		super();
	}
	public ZzimDto(int seq, String id, int recipe_id, String recipe_nm_ko) {
		super();
		this.seq = seq;
		this.id = id;
		this.recipe_id = recipe_id;
		this.recipe_nm_ko = recipe_nm_ko;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public String getRecipe_nm_ko() {
		return recipe_nm_ko;
	}
	public void setRecipe_nm_ko(String recipe_nm_ko) {
		this.recipe_nm_ko = recipe_nm_ko;
	}
	
	
	
}
