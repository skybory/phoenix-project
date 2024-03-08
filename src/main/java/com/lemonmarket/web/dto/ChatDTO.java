package com.lemonmarket.web.dto;

public class ChatDTO {

	
	// 변수 설정
	
	private String userId; //사용자 아이디
	private String userAge; //사용자나이
	private String gender; //유저성별
	private String userName; // 사용자 이름
	private String userEmail; // 사용자 이메일
	private String phoneNumber; //사용자 핸드폰번호
	private String userAddress; //사용자 주소
	private String location; // 사용자 위치(거래용)
	private String registDate; // 사용자 가입일
	private String profileUrl; //사용자 프로필 URL
	private boolean isPremium; // 프리미엄회원 여부
	
	// 게터 세터 추가
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserAge() {
		return userAge;
	}
	public void setUserAge(String userAge) {
		this.userAge = userAge;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getProfileUrl() {
		return profileUrl;
	}
	public void setProfileUrl(String profileUrl) {
		this.profileUrl = profileUrl;
	}
	public boolean isPremium() {
		return isPremium;
	}
	public void setPremium(boolean isPremium) {
		this.isPremium = isPremium;
	}
	
	
	
	
	
	
	
}
