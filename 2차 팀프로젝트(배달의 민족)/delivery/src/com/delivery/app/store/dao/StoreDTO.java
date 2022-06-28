package com.delivery.app.store.dao;

public class StoreDTO {
	private int storenum;
    private String storename;
    private String storephone;
	private String theme;
    private String ownername;
    private String storedetail;
    private String storetime;
	private String zipcode;
    private String addr;
    private String addrdetail;
    private String addretc;
    private String deliverok;
    private String deliverprice;
    private int minprice;
	private int likecnt;
    private double starcnt;
    
    
    public String getDeliverprice() {
		return deliverprice;
	}
	public void setDeliverprice(String deliverprice) {
		this.deliverprice = deliverprice;
	}
	public int getStorenum() {
		return storenum;
	}
	public void setStorenum(int storenum) {
		this.storenum = storenum;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
    public String getStorephone() {
		return storephone;
	}
	public void setStorephone(String storephone) {
		this.storephone = storephone;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getOwnername() {
		return ownername;
	}
	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}
	public String getStoredetail() {
		return storedetail;
	}
	public void setStoredetail(String storedetail) {
		this.storedetail = storedetail;
	}
	public String getStoretime() {
		return storetime;
	}
	public void setStoretime(String storetime) {
		this.storetime = storetime;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getAddretc() {
		return addretc;
	}
	public void setAddretc(String addretc) {
		this.addretc = addretc;
	}
	public String getDeliverok() {
		return deliverok;
	}
	public void setDeliverok(String deliverok) {
		this.deliverok = deliverok;
	}
	public int getMinprice() {
		return minprice;
	}
	public void setMinprice(int minprice) {
		this.minprice = minprice;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}
	public double getStarcnt() {
		return starcnt;
	}
	public void setStarcnt(double starcnt) {
		this.starcnt = starcnt;
	}
}
