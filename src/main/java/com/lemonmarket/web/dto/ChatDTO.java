package com.lemonmarket.web.dto;

public class ChatDTO {

	
	// 변수 설정
	int chatIdx;
	int roomIdx;
	int max;
	private String userId;
    private String toId;
    private String contents;
    private String chatDate;
	public int getChatIdx() {
		return chatIdx;
	}
	public void setChatIdx(int chatIdx) {
		this.chatIdx = chatIdx;
	}
	public int getRoomIdx() {
		return roomIdx;
	}
	public void setRoomIdx(int roomIdx) {
		this.roomIdx = roomIdx;
	}
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getToId() {
		return toId;
	}
	public void setToId(String toId) {
		this.toId = toId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getChatDate() {
		return chatDate;
	}
	public void setChatDate(String chatDate) {
		this.chatDate = chatDate;
	}

	
	
}
