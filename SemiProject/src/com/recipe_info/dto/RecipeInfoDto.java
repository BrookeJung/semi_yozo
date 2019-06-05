package com.recipe_info.dto;

public class RecipeInfoDto {
	
	private int recipe_id;
	private String recipe_nm_ko;
	private String sumry;
	private int nation_code;
	private String nation_nm;
	private int ty_code;
	private String ty_nm;
	private String cooking_time;
	private String calorie;
	private String qnt;
	private String level_nm;
	private String irdnt_code;
	private String img_url;
	private String det_url;
	private String pick;
	private int views;
	
	public RecipeInfoDto() {
		super();
	}

	public RecipeInfoDto(int recipe_id, String recipe_nm_ko, String sumry, int nation_code, String nation_nm,
			int ty_code, String ty_nm, String cooking_time, String calorie, String qnt, String level_nm,
			String irdnt_code, String img_url, String det_url, String pick, int views) {
		super();
		this.recipe_id = recipe_id;
		this.recipe_nm_ko = recipe_nm_ko;
		this.sumry = sumry;
		this.nation_code = nation_code;
		this.nation_nm = nation_nm;
		this.ty_code = ty_code;
		this.ty_nm = ty_nm;
		this.cooking_time = cooking_time;
		this.calorie = calorie;
		this.qnt = qnt;
		this.level_nm = level_nm;
		this.irdnt_code = irdnt_code;
		this.img_url = img_url;
		this.det_url = det_url;
		this.pick = pick;
		this.views = views;
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

	public String getSumry() {
		return sumry;
	}

	public void setSumry(String sumry) {
		this.sumry = sumry;
	}

	public int getNation_code() {
		return nation_code;
	}

	public void setNation_code(int nation_code) {
		this.nation_code = nation_code;
	}

	public String getNation_nm() {
		return nation_nm;
	}

	public void setNation_nm(String nation_nm) {
		this.nation_nm = nation_nm;
	}

	public int getTy_code() {
		return ty_code;
	}

	public void setTy_code(int ty_code) {
		this.ty_code = ty_code;
	}

	public String getTy_nm() {
		return ty_nm;
	}

	public void setTy_nm(String ty_nm) {
		this.ty_nm = ty_nm;
	}

	public String getCooking_time() {
		return cooking_time;
	}

	public void setCooking_time(String cooking_time) {
		this.cooking_time = cooking_time;
	}

	public String getCalorie() {
		return calorie;
	}

	public void setCalorie(String calorie) {
		this.calorie = calorie;
	}

	public String getQnt() {
		return qnt;
	}

	public void setQnt(String qnt) {
		this.qnt = qnt;
	}

	public String getLevel_nm() {
		return level_nm;
	}

	public void setLevel_nm(String level_nm) {
		this.level_nm = level_nm;
	}

	public String getIrdnt_code() {
		return irdnt_code;
	}

	public void setIrdnt_code(String irdnt_code) {
		this.irdnt_code = irdnt_code;
	}

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public String getDet_url() {
		return det_url;
	}

	public void setDet_url(String det_url) {
		this.det_url = det_url;
	}

	public String getPick() {
		return pick;
	}

	public void setPick(String pick) {
		this.pick = pick;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}
	
	
	

	
	
}
