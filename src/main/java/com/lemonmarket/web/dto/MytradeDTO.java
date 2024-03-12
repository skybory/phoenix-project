package com.lemonmarket.web.dto;

public class MytradeDTO {
	
	private String interestList; // 관심목록
	private String salesDetails; //판매내역
	private String purchaseDetails; //구매내역
	
	public String getInterestList() {
		return interestList;
	}
	public void setInterestList(String interestList) {
		this.interestList = interestList;
	}
	public String getSalesDetails() {
		return salesDetails;
	}
	public void setSalesDetails(String salesDetails) {
		this.salesDetails = salesDetails;
	}
	public String getPurchaseDetails() {
		return purchaseDetails;
	}
	public void setPurchaseDetails(String purchaseDetails) {
		this.purchaseDetails = purchaseDetails;
	}
	
	

}
