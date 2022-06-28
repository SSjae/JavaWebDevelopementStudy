package com.delivery.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.ReviewDTO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;
import com.delivery.app.user.dao.UserDTO;

public class ReviewWriteOkAction implements Action{
	 @Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
			
		UserDTO loginUser = (UserDTO)req.getSession().getAttribute("loginUser");
			
		int storenum = Integer.parseInt(req.getParameter("sn"));
		int starcnt = Integer.parseInt(req.getParameter("starcnt"));
		String reviewcontents = req.getParameter("reviewcontents");
		
		ReviewDAO rdao = new ReviewDAO();
		ReviewDTO review = new ReviewDTO();
		StoreDAO sdao = new StoreDAO();
		StoreDTO sdto = new StoreDTO();
		
		review.setUserid(loginUser.getUserid());
		review.setStorenum(storenum);
		review.setStarcnt(starcnt);
		review.setReviewcontents(reviewcontents);
		
		sdto = sdao.getStore(storenum);
		
		double staravg = sdto.getStarcnt();
		double newStar = (Math.round(staravg * rdao.storeReviewCnt(storenum)) + starcnt) / (rdao.storeReviewCnt(storenum) + 1);
		
		if(rdao.setReview(review) == 1) {
			sdao.setStoreCnt(storenum, newStar);
			out.write("<script>");
			out.write("alert('리뷰가 작성되었습니다.');");
			out.write("location.href='" + req.getContextPath() + "/user/UserOrderhistory.us';");
			out.write("</script>");
		} else {
			out.write("<script>");
			out.write("alert('다시 시도해주세요.');");
			out.write("location.href='" + req.getContextPath() + "/user/UserOrderhistory.us';");
			out.write("</script>");
		}
		return null;
	}
}
