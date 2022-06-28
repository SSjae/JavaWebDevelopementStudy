package com.delivery.app.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.ReviewDTO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;
import com.delivery.app.user.dao.UserDTO;

public class MyReviewOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDTO loginUser = (UserDTO) (req.getSession().getAttribute("loginUser"));
		StoreDAO sdao = new StoreDAO();
		ReviewDAO rdao = new ReviewDAO();
		ActionTo acto = new ActionTo();
		
		List<ReviewDTO> myreviewlist = rdao.MyReviewList(loginUser.getUserid());
		List<StoreDTO> myreviewstorenum = new ArrayList<StoreDTO>();
		
		if (myreviewlist.size() != 0) {
			for (int i = 0; i < myreviewlist.size(); i++) {
				myreviewstorenum.add(sdao.getStore(myreviewlist.get(i).getStorenum()));
			}
		}
		
		req.setAttribute("review", myreviewlist);
		req.setAttribute("store", myreviewstorenum);
		
		acto.setRedirect(false);
		acto.setPath(req.getContextPath() + "/app/mypage/myreview.jsp");
		return acto;
	}

}
