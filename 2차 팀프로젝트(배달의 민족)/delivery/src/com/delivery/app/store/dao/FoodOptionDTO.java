package com.delivery.app.store.dao;

public class FoodOptionDTO {
	private int optionnum;
    private String foodoption;
	private String optionname;
	private int optionprice;
	private boolean isoverlap;
    private int foodnum;
    
	public int getOptionnum() {
		return optionnum;
	}
	public void setOptionnum(int optionnum) {
		this.optionnum = optionnum;
	}
	public String getFoodoption() {
		return foodoption;
	}
	public void setFoodoption(String foodoption) {
		this.foodoption = foodoption;
	}
	public String getOptionname() {
		return optionname;
	}
	public void setOptionname(String optionname) {
		this.optionname = optionname;
	}
	public int getOptionprice() {
		return optionprice;
	}
	public void setOptionprice(int optionprice) {
		this.optionprice = optionprice;
	}
	public boolean isIsoverlap() {
		return isoverlap;
	}
	public void setIsoverlap(boolean isoverlap) {
		this.isoverlap = isoverlap;
	}
	public int getFoodnum() {
		return foodnum;
	}
	public void setFoodnum(int foodnum) {
		this.foodnum = foodnum;
	}  
}
