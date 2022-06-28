package com.delivery.app.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.delivery.mybatis.SqlMapConfig;

public class FoodDAO {
	SqlSession sqlsession;
	
	public FoodDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public List<String> storeFoodName(int storenum) {
		List<String> storeFoodName = sqlsession.selectList("Food.storeFoodName", storenum);
		return storeFoodName;
	}

	public List<FoodDTO> storeFood(int storenum) {
		return sqlsession.selectList("Food.storeFood", storenum);
	}

	public List<String> foodTheme(int storenum) {
		return sqlsession.selectList("Food.foodTheme", storenum);
	}

	public FoodDTO getFood(int foodnum) {
		return sqlsession.selectOne("Food.getFood", foodnum);
	}
	public void addOrderCnt(int f) {
		sqlsession.update("Food.addOrderCnt", f);
	}
}
