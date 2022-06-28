package com.delivery.app.store.dao;

public class ReviewDTO {
	private int reviewnum;
	private String reviewcontents;
	private String regdate;
	private int starcnt;
    private String userid;
	private int storenum;
	
	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}
	public String getReviewcontents() {
		return reviewcontents;
	}
	public void setReviewcontents(String reviewcontents) {
		this.reviewcontents = reviewcontents;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getStarcnt() {
		return starcnt;
	}
	public void setStarcnt(int starcnt) {
		this.starcnt = starcnt;
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
