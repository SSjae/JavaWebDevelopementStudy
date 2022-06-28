package com.delivery.app.user.dao;

import java.util.List;

import com.delivery.app.store.dao.FoodDTO;
import com.delivery.app.store.dao.FoodFileDTO;
import com.delivery.app.store.dao.FoodOptionDTO;
import com.delivery.app.store.dao.StoreDTO;

public class BasketDTO {
    private StoreDTO store;
    private String userid;
    private FoodDTO food;
    private List<FoodOptionDTO> foodoption;
    private FoodFileDTO foodfile;
    private int foodamount;
    private int foodtotalprice;


    public FoodFileDTO getFoodfile() {
        return foodfile;
    }
    public void setFoodfile(FoodFileDTO foodfile) {
        this.foodfile = foodfile;
    }
    public int getFoodtotalprice() {
        return foodtotalprice;
    }
    public void setFoodtotalprice(int foodtotalprice) {
        this.foodtotalprice = foodtotalprice;
    }
    public StoreDTO getStore() {
        return store;
    }
    public void setStore(StoreDTO store) {
        this.store = store;
    }
    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public FoodDTO getFood() {
        return food;
    }
    public void setFood(FoodDTO food) {
        this.food = food;
    }
    public List<FoodOptionDTO> getFoodoption() {
        return foodoption;
    }
    public void setFoodoption(List<FoodOptionDTO> foodoption) {
        this.foodoption = foodoption;
    }
    public int getFoodamount() {
        return foodamount;
    }
    public void setFoodamount(int foodamount) {
        this.foodamount = foodamount;
    }
}