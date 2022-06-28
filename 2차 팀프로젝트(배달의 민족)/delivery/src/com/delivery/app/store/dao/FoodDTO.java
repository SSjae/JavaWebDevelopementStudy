package com.delivery.app.store.dao;

public class FoodDTO {
	private int foodnum;
	private String foodname;
	private int foodprice;
	private String foodtheme;
	private int ordercnt;
    private int storenum;
    
	public int getFoodnum() {
		return foodnum;
	}
	public void setFoodnum(int foodnum) {
		this.foodnum = foodnum;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public int getFoodprice() {
		return foodprice;
	}
	public void setFoodprice(int foodprice) {
		this.foodprice = foodprice;
	}
	public String getFoodtheme() {
		return foodtheme;
	}
	public void setFoodtheme(String foodtheme) {
		this.foodtheme = foodtheme;
	}
	public int getOrdercnt() {
		return ordercnt;
	}
	public void setOrdercnt(int ordercnt) {
		this.ordercnt = ordercnt;
	}
	public int getStorenum() {
		return storenum;
	}
	public void setStorenum(int storenum) {
		this.storenum = storenum;
	}
}
