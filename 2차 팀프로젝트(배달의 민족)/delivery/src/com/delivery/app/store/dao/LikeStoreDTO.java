package com.delivery.app.store.dao;

public class LikeStoreDTO {
	private int likestorenum;
	private String userid;
	private int storenum;
	
	public int getLikestorenum() {
		return likestorenum;
	}
	public void setLikestorenum(int likestorenum) {
		this.likestorenum = likestorenum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getStorenum() {
		return storenum;
	}
	public void setStorenum(int storenum) {
		this.storenum = storenum;
	}
}
