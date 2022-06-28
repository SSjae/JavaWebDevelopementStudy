package com.delivery.app.store.dao;

public class OrderDTO {
	private int ordernum;
    private String ownercall;
	private String ridercall;
	private String regdate;
	private int totalprice;
	private String userid;
	private int storenum;
	private String foodnum;
    private String optionnum;
    private String foodamount;
    private String foodhow;
    private String foodtotalprice;
    
	
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getOwnercall() {
		return ownercall;
	}
	public void setOwnercall(String ownercall) {
		this.ownercall = ownercall;
	}
	public String getRidercall() {
		return ridercall;
	}
	public void setRidercall(String ridercall) {
		this.ridercall = ridercall;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
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
	public String getFoodnum() {
		return foodnum;
	}
	public void setFoodnum(String foodnum) {
		this.foodnum = foodnum;
	}
	public String getOptionnum() {
		return optionnum;
	}
	public void setOptionnum(String optionnum) {
		this.optionnum = optionnum;
	}
	public String getFoodamount() {
		return foodamount;
	}
	public void setFoodamount(String foodamount) {
		this.foodamount = foodamount;
	}
	public String getFoodhow() {
		return foodhow;
	}
	public void setFoodhow(String foodhow) {
		this.foodhow = foodhow;
	}
	public String getFoodtotalprice() {
		return foodtotalprice;
	}
	public void setFoodtotalprice(String foodtotalprice) {
		this.foodtotalprice = foodtotalprice;
	}
}
