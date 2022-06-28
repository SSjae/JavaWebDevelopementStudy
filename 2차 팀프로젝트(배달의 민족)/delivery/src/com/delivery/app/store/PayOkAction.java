package com.delivery.app.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.user.dao.BasketDTO;

public class PayOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		@SuppressWarnings("unchecked")
		List<BasketDTO> baskets = (List<BasketDTO>) req.getSession().getAttribute("baskets");
		int totalprice = Integer.parseInt(req.getParameter("totalprice"));
		int deliveryprice = Integer.parseInt(req.getParameter("deliveryprice"));
		String foodhow = req.getParameter("foodhow");
		
		ActionTo acto = new ActionTo();
		acto.setRedirect(false);
		acto.setPath(req.getContextPath() + "/app/delivery/payview.jsp");
		
		return acto;
	}

}
