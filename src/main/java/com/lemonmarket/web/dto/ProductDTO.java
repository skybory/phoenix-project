package com.lemonmarket.web.dto;

public class ProductDTO {

	
	// 변수 설정
	
	private int productId;
	private String productImage;
	private String productTitle;
	private String productContentDetail;
	private int	productCost;
	private String userId;
	private String uploadDate;
	
	
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	public String getProductContentDetail() {
		return productContentDetail;
	}
	public void setProductContentDetail(String productContentDetail) {
		this.productContentDetail = productContentDetail;
	}
	public int getProductCost() {
		return productCost;
	}
	public void setProductCost(int productCost) {
		this.productCost = productCost;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	
	
	
	
	
}
