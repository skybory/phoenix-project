package com.lemonmarket.web.dto;

public class LocationDTO {
	
	private double latitude;		// 위도
	private double longitude;		// 경도
	
	// 카카오맵 API를 사용하면 위도와 경도를 이용한 Reverse Geocoding을 통해 주소값을 알 수 있음.
	
	
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
}
