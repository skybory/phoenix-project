package com.lemonmarket.web.dto;

public class ProductDTO {

	
	// 변수 설정
	
	private int productIdx;
	private String userId;
	private String productTitle;
	private String productDescription;
	private String productImage;
	private String productDealType;
	private int productPrice;
	private String productLocation;
	private String productRegisterTime;
	private int productInterestCount;
	private int productChatCount;
	private String categoryId;
	
	
	public int getProductIdx() {
		return productIdx;
	}
	public void setProductIdx(int productId) {
		this.productIdx = productId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getProductDealType() {
		return productDealType;
	}
	public void setProductDealType(String productDealType) {
		this.productDealType = productDealType;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductLocation() {
		return productLocation;
	}
	public void setProductLocation(String productLocation) {
		this.productLocation = productLocation;
	}
	public String getProductRegisterTime() {
		return productRegisterTime;
	}
	public void setProductRegisterTime(String productRegisterTime) {
		this.productRegisterTime = productRegisterTime;
	}
	public int getProductInterestCount() {
		return productInterestCount;
	}
	public void setProductInterestCount(int productInterestCount) {
		this.productInterestCount = productInterestCount;
	}
	public int getProductChatCount() {
		return productChatCount;
	}
	public void setProductChatCount(int productChatCount) {
		this.productChatCount = productChatCount;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	 
}
