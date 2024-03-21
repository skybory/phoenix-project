// MytradeDTO.java 수정
package com.lemonmarket.web.dto;

import java.util.List;

public class WishlistDTO {
    
	private int wishlistIdx;
	private int userIdx;
	private int productIdx;
	private int wish;
	public int getWishlistIdx() {
		return wishlistIdx;
	}
	public void setWishlistIdx(int wishlistIdx) {
		this.wishlistIdx = wishlistIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public int getproductIdx() {
		return productIdx;
	}
	public void setproductIdx(int productIdx) {
		this.productIdx = productIdx;
	}
	public int getWish() {
		return wish;
	}
	public void setWish(int wish) {
		this.wish = wish;
	}
	
	
}
