package com.lemonmarket.web.dto;

import java.util.List;

public class AdDTO {

	
	// 변수 설정
	private int adId;
	private String adTheme;
	private String adBanner;
	private List<String> addLocation;
	
	
	
	public int getAdId() {
		return adId;
	}
	public void setAdId(int adId) {
		this.adId = adId;
	}
	public String getAdTheme() {
		return adTheme;
	}
	public void setAdTheme(String adTheme) {
		this.adTheme = adTheme;
	}
	public String getAdBanner() {
		return adBanner;
	}
	public void setAdBanner(String adBanner) {
		this.adBanner = adBanner;
	}
	public List<String> getAddLocation() {
		return addLocation;
	}
	public void setAddLocation(List<String> addLocation) {
		this.addLocation = addLocation;
	}
	
	
	
	
	
}
