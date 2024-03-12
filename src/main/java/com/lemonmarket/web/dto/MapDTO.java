package com.lemonmarket.web.dto;

public class MapDTO {

	
	// 변수 설정
	

	// 도로명 주소 ex) 서울특별시 강남구 테헤란로1길 10 세경빌딩 3층
	private String city;			// 시		ex) 서울특별시
	private String state;			// 구		ex)	강남구
	private String street;			// 도로명		ex) 테헤란로1길 10
	private String street_detail;	// 상세주소	ex) 세경빌딩 3층
	private String zipCode;			// 우편번호	ex) 06134
	
	
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getStreet_detail() {
		return street_detail;
	}
	public void setStreet_detail(String street_detail) {
		this.street_detail = street_detail;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	
	
}
