package com.lemonmarket.web.dto;

public class RoomDTO {
	private int roomSeq;
	private String fromId;
	private String prName;
	private String toId;
	private String roomDate;
	private ProductDTO productDTO;
	
	
	
	
	public String getFromId() {
		return fromId;
	}
	public void setFromId(String fromId) {
		this.fromId = fromId;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public String getRoomDate() {
		return roomDate;
	}
	public void setRoomDate(String roomDate) {
		this.roomDate = roomDate;
	}
	public String getToId() {
		return toId;
	}
	public void setToId(String toId) {
		this.toId = toId;
	}
	public int getRoomSeq() {
		return roomSeq;
	}
	public void setRoomSeq(int roomSeq) {
		this.roomSeq = roomSeq;
	}
	public String getfromId() {
		return fromId;
	}
	public void setfromId(String fromId) {
		this.fromId = fromId;
	}
	public String getPrName() {
		return prName;
	}
	public void setPrName(String prName) {
		this.prName = prName;
	}
}
