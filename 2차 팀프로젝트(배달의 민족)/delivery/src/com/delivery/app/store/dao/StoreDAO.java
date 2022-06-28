package com.delivery.app.store.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.delivery.mybatis.SqlMapConfig;

public class StoreDAO {
	SqlSession sqlsession;
	
	public StoreDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public List<StoreDTO> storeTheme(String theme) {
		List<StoreDTO> stores = sqlsession.selectList("Store.storeTheme", theme);
		return stores;
	}

	public StoreDTO getStore(int storenum) {
		return sqlsession.selectOne("Store.getStore", storenum);
	}

	public void downLikeCnt(int storenum) {
		sqlsession.update("Store.downLikeCnt",storenum);
	}

	public void upLikeCnt(int storenum) {
		sqlsession.update("Store.upLikeCnt",storenum);
	}

	public void setStoreCnt(int storenum, double newStar) {
		HashMap<String, Object> datas = new HashMap<>();
		String newStarst = String.format("%.2f", newStar);
		datas.put("storenum", storenum);
		datas.put("newStar", newStarst);
		sqlsession.update("Store.setStoreCnt", datas);
	}

	public List<StoreDTO> searchMarket(String keyword) {
		return sqlsession.selectList("Store.searchMarket", keyword);
	}
}