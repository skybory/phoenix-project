package com.lemonmarket.web.dto;

public class CategoryDTO {
	private String categoryId; // 카테고리 아이디
	private String categoryName; // 카테고리 이름


	// 게터 세터


	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
}
