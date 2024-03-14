package com.lemonmarket.web.dto;

public class CategorieDTO {
	private String categoriesId; // 카테고리 아이디
	private String categoriesName; // 카테고리 이름

	// 게터 세터

	public String getCategoriesId() {
		return categoriesId;
	}

	public void setCategoriesId(String categoriesId) {
		this.categoriesId = categoriesId;
	}

	public String getCategoriesName() {
		return categoriesName;
	}

	public void setCategoriesName(String categoriesName) {
		this.categoriesName = categoriesName;
	}

}
