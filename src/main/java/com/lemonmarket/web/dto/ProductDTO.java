package com.lemonmarket.web.dto;

public class ProductDTO {

	
	private int productIdx;
	private int userIdx;
	private String userId;
	private String productTitle;
	private String productDescription;
	private String productImage;
	private String productDealType;
	private int productPrice;
	private String productLocation;
	private String productRegisterDate;
	private int productInterestCount;
	private int productChatCount;
	private int categoryIdx;
	private int purchaseUserIdx;
	private String userName;
	private String productSellDate;
	
	
	public int getPurchaseUserIdx() {
		return purchaseUserIdx;
	}
	public void setPurchaseUserIdx(int purchaseUserIdx) {
		this.purchaseUserIdx = purchaseUserIdx;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getProductSellDate() {
		return productSellDate;
	}
	public void setProductSellDate(String productSellDate) {
		this.productSellDate = productSellDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductIdx() {
		return productIdx;
	}
	public void setProductIdx(int productIdx) {
		this.productIdx = productIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
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
	public String getProductRegisterDate() {
		return productRegisterDate;
	}
	public void setProductRegisterDate(String productRegisterDate) {
		this.productRegisterDate = productRegisterDate;
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
	public int getCategoryIdx() {
		return categoryIdx;
	}
	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
}
