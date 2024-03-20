package com.lemonmarket.web.dto;

public class UserDTO {

	
	// 변수 설정
	private int userIdx;
	private String userId; //사용자 아이디
	private String userPw; //사용자 비밀번호
	private String userAge; //사용자나이
	private String gender; //유저성별
	private String userName; // 사용자 이름
	private String userEmail; // 사용자 이메일
	private String phoneNumber; //사용자 핸드폰번호
	private String userAddress; //사용자 주소
	//private String userZipCode;	//사용자 우편번호
	//private String userReference; //사용자 참고
	//private String userAddrDetail; //사용자 상세주소
	// private String location; //사용자 위치
	
	// 게터 세터 추가
	
	public String getUserId() {
		return userId;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
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
	
	
	
}
