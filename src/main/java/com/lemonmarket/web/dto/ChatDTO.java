package com.lemonmarket.web.dto;

public class ChatDTO {

	
	// 변수 설정
	int chatseq;
	int roomseq;
	int max;
	private String userId;
    private String toId;
    private String contents;
    private String chatDate;
    public int getMax() {
    	return max;
    }
    public void setMax(int max) {
    	this.max = max;
    }
    public String getcontents() {
		return contents;
	}
	public void setcontents(String contents) {
		this.contents = contents;
	}
    public int getchatseq() {
    	return chatseq;
    }
	public void setchatseq(int chatseq) {
		this.chatseq = chatseq;
	}
	public String getuserId() {
		return userId;
	}
	public void setuserId(String userId) {
		this.userId = userId;
	}
	public String getToId() {
		return toId;
	}
	public void setToId(String toId) {
		this.toId = toId;
	}

	public String getchatDate() {
		return chatDate;
	}
	public void setchatDate(String chatDate) {
		this.chatDate = chatDate;
	}
	public int getRoomseq() {
		return roomseq;
	}
	public void setRoomseq(int roomseq) {
		this.roomseq = roomseq;
	}
	
	
	// 게터 세터 추가
	

	
	
	
}
