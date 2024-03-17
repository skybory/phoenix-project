// MytradeDTO.java 수정
package com.lemonmarket.web.dto;

import java.util.List;

public class MytradeDTO {
    
	private String productId;
	private String userId;
	private List<ProductDTO> purchaseList; // 구매 목록
	
	private int productPrice;
	private String productLocation;
	 private String productTitle;
	
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
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
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public List<ProductDTO> getPurchaseList() {
		return purchaseList;
	}
	public void setPurchaseList(List<ProductDTO> purchaseList) {
		this.purchaseList = purchaseList;
	}
	
	
	
	
	
}
