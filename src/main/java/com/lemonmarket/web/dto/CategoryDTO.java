package com.lemonmarket.web.dto;

public class CategoryDTO {
	private int categoryIdx; // 카테고리 아이디
	private String categoryName; // 카테고리 이름
	private String categoryImage; // 이미지파일
	
	
	public int getCategoryIdx() {
		return categoryIdx;
	}
	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCategoryImage() {
		return categoryImage;
	}
	public void setCategoryImage(String categoryImage) {
		this.categoryImage = categoryImage;
	}

	
	
	
}
