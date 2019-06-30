package com.recipe_process.dto;

public class RecipeProcessDto {
	
	private int recipe_id;
	private int cooking_no;
	private String cooking_dc;
	private String stre_step_image_url;
	private String ster_tip;
	private String id;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public RecipeProcessDto() {
		
	}
	public RecipeProcessDto(int recipe_id, int cooking_no, String cooking_dc, String stre_step_image_url,
			String ster_tip) {
		super();
		this.recipe_id = recipe_id;
		this.cooking_no = cooking_no;
		this.cooking_dc = cooking_dc;
		this.stre_step_image_url = stre_step_image_url;
		this.ster_tip = ster_tip;
		
	}
	
	public RecipeProcessDto(int recipe_id, int cooking_no, String cooking_dc, String stre_step_image_url,
			String ster_tip,String id) {
		super();
		this.recipe_id = recipe_id;
		this.cooking_no = cooking_no;
		this.cooking_dc = cooking_dc;
		this.stre_step_image_url = stre_step_image_url;
		this.ster_tip = ster_tip;
		this.id=id;
	}
	
	public int getRecipe_id() {
		return recipe_id;
	}
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	public int getCooking_no() {
		return cooking_no;
	}
	public void setCooking_no(int cooking_no) {
		this.cooking_no = cooking_no;
	}
	public String getCooking_dc() {
		return cooking_dc;
	}
	public void setCooking_dc(String cooking_dc) {
		this.cooking_dc = cooking_dc;
	}
	public String getStre_step_image_url() {
		return stre_step_image_url;
	}
	public void setStre_step_image_url(String stre_step_image_url) {
		this.stre_step_image_url = stre_step_image_url;
	}
	public String getSter_tip() {
		return ster_tip;
	}
	public void setSter_tip(String ster_tip) {
		this.ster_tip = ster_tip;
	}
	
	
	
}
