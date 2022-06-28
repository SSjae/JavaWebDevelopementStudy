package com.delivery.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.LikeStoreDAO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.user.dao.UserDTO;

public class RemoveLikeStoreOkAction implements Action { 
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		UserDTO loginUser = (UserDTO) (req.getSession().getAttribute("loginUser"));
		int storenum = Integer.parseInt(req.getParameter("sn"));
		
		StoreDAO sdao = new StoreDAO();
		LikeStoreDAO ldao = new LikeStoreDAO();
		
		sdao.downLikeCnt(storenum);
		ldao.removeLike(storenum, loginUser.getUserid());
		

		PrintWriter out = resp.getWriter();

    	out.write("<script>");
      	out.write("alert('삭제되었습니다.');");
      	out.write("location.href='" + req.getContextPath() + "/store/LikeMarket.st';");
	  	out.write("</script>");
		
		return null;
	}
}
