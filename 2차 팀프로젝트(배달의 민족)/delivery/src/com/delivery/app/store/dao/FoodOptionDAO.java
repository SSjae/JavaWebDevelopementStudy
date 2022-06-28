package com.delivery.app.store.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.delivery.mybatis.SqlMapConfig;

public class FoodOptionDAO {
	SqlSession sqlsession;
	
	public FoodOptionDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public List<FoodOptionDTO> foodOptions(int foodnum) {
		return sqlsession.selectList("FoodOption.foodOptions", foodnum);
	}

	public FoodOptionDTO getFoodOption(int optionnum) {
		return sqlsession.selectOne("FoodOption.getFoodOption",optionnum);
	}
	
	
}