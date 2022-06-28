package com.delivery.app.store;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.LikeStoreDAO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.user.dao.UserDTO;

public class StoreLikeOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String li = req.getParameter("li");
		int storenum = Integer.parseInt(req.getParameter("sn"));
		
		UserDTO loginUser = (UserDTO) (req.getSession().getAttribute("loginUser"));
		StoreDAO sdao = new StoreDAO();
		LikeStoreDAO ldao = new LikeStoreDAO();
		PrintWriter out = resp.getWriter();
		
		if(li.equals("cancel")) {
			sdao.downLikeCnt(storenum);
			ldao.removeLike(storenum, loginUser.getUserid());
			out.write(sdao.getStore(storenum).getLikecnt() + "");
		} else {
			sdao.upLikeCnt(storenum);
			ldao.addLike(storenum, loginUser.getUserid());
			out.write(sdao.getStore(storenum).getLikecnt() + "");
		}
		return null;
	}
}