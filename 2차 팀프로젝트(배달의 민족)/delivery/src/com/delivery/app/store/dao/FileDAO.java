package com.delivery.app.store.dao;

import org.apache.ibatis.session.SqlSession;

import com.delivery.mybatis.SqlMapConfig;

public class FileDAO {
	SqlSession sqlsession;
	
	public FileDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public StoreFileDTO storeFile(int storenum) {
		return sqlsession.selectOne("File.storeFile", storenum);
	}

	public FoodFileDTO foodFile(int foodnum) {
		return sqlsession.selectOne("File.foodFile", foodnum);
	}
}
