// MytradeDTO.java 수정
package com.lemonmarket.web.dto;

import java.util.List;

public class MytradeDTO {
    
	private String productId;
	private String userId;
	private List<ProductDTO> purchaseList; // 구매 목록
	
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