package com.delivery.app.store.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.delivery.mybatis.SqlMapConfig;

public class ReviewDAO {
	SqlSession sqlsession;
	
	public ReviewDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}

	public int storeReviewCnt(int storenum) {
		int reviewCnt = sqlsession.selectOne("Review.storeReviewCnt", storenum);
		return reviewCnt;
	}

	public List<ReviewDTO> storeReviewNew(int storenum) {
		return sqlsession.selectList("Review.storeReviewNew", storenum);
	}

	public List<ReviewDTO> storeReviewHigh(int storenum) {
		return sqlsession.selectList("Review.storeReviewHigh", storenum);
	}

	public List<ReviewDTO> storeReviewLow(int storenum) {
		return sqlsession.selectList("Review.storeReviewLow", storenum);
	}

	public List<ReviewDTO> MyReviewList(String userid) {
		return sqlsession.selectList("Review.myReviewList", userid);
	}

	public int getOldStar(int reviewnum) {
		return sqlsession.selectOne("Review.getOldStar", reviewnum);
		
	}

	public void changeContents(String reviewcontents, int reviewnum, int starcnt) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("reviewcontents", reviewcontents);
		datas.put("reviewnum", reviewnum);
		datas.put("starcnt", starcnt);
		sqlsession.update("Review.changeContents", datas);
		
	}

	public void delReview(int reviewnum) {
		sqlsession.delete("Review.delReview", reviewnum);
	}

	public int setReview(ReviewDTO review) {
		return sqlsession.insert("Review.setReview", review);
	}

	public boolean checkReview(int storenum, String userid) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("storenum", storenum);
		datas.put("userid", userid);
		int result = sqlsession.selectOne("Review.checkReview",datas);
		return (result == 0);
	}
	
	public List<ReviewDTO> getReviewStore(String userid) {
		return sqlsession.selectList("Review.getReviewStore", userid);
	}

	public int getStoreNum(int reviewnum) {
		return sqlsession.selectOne("Review.getStoreNum", reviewnum);
	}
}
