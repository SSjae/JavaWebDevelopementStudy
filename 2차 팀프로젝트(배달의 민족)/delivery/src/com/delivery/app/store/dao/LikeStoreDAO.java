package com.delivery.app.store.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.delivery.mybatis.SqlMapConfig;

public class LikeStoreDAO {
	SqlSession sqlsession;
	
	public LikeStoreDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public int isLike(int storenum, String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("userid", userid);
		datas.put("storenum", storenum);
		
		return sqlsession.selectOne("LikeStore.isLike", datas);
	}

	public void removeLike(int storenum, String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("userid", userid);
		datas.put("storenum", storenum);
		
		sqlsession.delete("LikeStore.removeLike", datas);
	}

	public void addLike(int storenum, String userid) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		datas.put("userid", userid);
		datas.put("storenum", storenum);
		
		sqlsession.insert("LikeStore.addLike", datas);
	}

	public List<LikeStoreDTO> likeStore(String userid) {
		return sqlsession.selectList("LikeStore.likeStore", userid);
	}

	public int likeCnt(String userid) {
		return sqlsession.selectOne("LikeStore.likeCnt", userid);
	}

	public List<LikeStoreDTO> getLikeStore(String userid) {
		return sqlsession.selectList("LikeStore.getLikeStore",userid);
	}
}
