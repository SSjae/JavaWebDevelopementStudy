package com.delivery.app.user;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.LikeStoreDAO;
import com.delivery.app.store.dao.LikeStoreDTO;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.ReviewDTO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;
import com.delivery.app.user.dao.UserDAO;
import com.delivery.app.user.dao.UserDTO;

public class UserRemoveOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		UserDTO org = (UserDTO) req.getSession().getAttribute("loginUser");

		UserDAO udao = new UserDAO();
		LikeStoreDAO ldao = new LikeStoreDAO();
		ReviewDAO rdao = new ReviewDAO();
		StoreDAO sdao = new StoreDAO();

		List<LikeStoreDTO> stores = ldao.getLikeStore(org.getUserid());
		List<ReviewDTO> storeR = rdao.getReviewStore(org.getUserid());

		for (int i = 0; i < stores.size(); i++) {
			sdao.downLikeCnt(stores.get(i).getStorenum());
		}


		 for(int i = 0; i < storeR.size(); i++) {
			StoreDTO sto = sdao.getStore(storeR.get(i).getStorenum());
			
			double staravg = sto.getStarcnt();
			double newStar = 0;
			
			if(rdao.storeReviewCnt(storeR.get(i).getStorenum()) == 1) {
				newStar = 0;
			} else {
				newStar = ((staravg * rdao.storeReviewCnt(storeR.get(i).getStorenum())) - storeR.get(i).getStarcnt()) / (rdao.storeReviewCnt(storeR.get(i).getStorenum()) - 1);			
			}
		 
			sdao.setStoreCnt(sto.getStorenum(), newStar);
		 }
		 

		String userpw = req.getParameter("userpw");

		PrintWriter out = resp.getWriter();

		if (userpw.equals(org.getUserpw())) {
			req.getSession().removeAttribute("loginUser");
			udao.userRemove(org.getUserid());
			out.write("<script>");
			out.write("alert('회원탈퇴가 완료되었습니다.');");
			out.write("location.href='" + req.getContextPath() + "/';");
			out.write("</script>");
		} else {
			out.write("<script>");
			out.write("alert('비밀번호가 틀렸습니다. 다시 시도해 주세요.');");
			out.write("location.href='" + req.getContextPath() + "/user/UserRemove.us';");
			out.write("</script>");
		}
		return null;
	}
}
