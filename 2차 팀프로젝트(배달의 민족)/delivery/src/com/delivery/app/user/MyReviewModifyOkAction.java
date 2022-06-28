package com.delivery.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;

public class MyReviewModifyOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ReviewDAO rdao = new ReviewDAO();
		StoreDTO sdto = new StoreDTO();
		StoreDAO sdao = new StoreDAO();
		
		String reviewcontents = req.getParameter("reviewcontents");
		int reviewnum = Integer.parseInt(req.getParameter("reviewnum"));
		int storenum = Integer.parseInt(req.getParameter("storenum"));
		int starcnt = Integer.parseInt(req.getParameter("starcnt"));
		int oldStar = rdao.getOldStar(reviewnum);
		
		sdto = sdao.getStore(storenum);
		
		double staravg = sdto.getStarcnt();
		double newStar = ((staravg * rdao.storeReviewCnt(storenum)) - oldStar + starcnt) / rdao.storeReviewCnt(storenum);
		
		sdao.setStoreCnt(storenum, newStar);
		
		rdao.changeContents(reviewcontents, reviewnum, starcnt);
		
		ActionTo acto = new ActionTo();
		acto.setRedirect(true);
		acto.setPath(req.getContextPath() + "/user/MyReview.us");
		return acto;
	}

}
