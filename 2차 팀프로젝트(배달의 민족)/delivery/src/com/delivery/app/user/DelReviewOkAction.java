package com.delivery.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;

public class DelReviewOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ReviewDAO rdao = new ReviewDAO();
		StoreDTO sdto = new StoreDTO();
		StoreDAO sdao = new StoreDAO();
		
		int reviewnum = Integer.parseInt(req.getParameter("reviewnum"));
		int oldStar = rdao.getOldStar(reviewnum);
		int storenum = rdao.getStoreNum(reviewnum);
		
		sdto = sdao.getStore(storenum);
		
		double staravg = sdto.getStarcnt();
		double newStar = 0;
		
		if(rdao.storeReviewCnt(storenum) == 1) {
			newStar = 0;
		} else {
			newStar = ((staravg * rdao.storeReviewCnt(storenum)) - oldStar) / (rdao.storeReviewCnt(storenum) - 1);			
		}
		
		sdao.setStoreCnt(storenum, newStar);
		
		rdao.delReview(reviewnum);
		
		ActionTo acto = new ActionTo();
		acto.setRedirect(true);
		acto.setPath(req.getContextPath() + "/user/MyReview.us");
		
		return acto;
	}
}