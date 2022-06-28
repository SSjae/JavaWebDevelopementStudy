package com.delivery.app.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.user.dao.BasketDTO;

public class RemoveBasketOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int i = Integer.parseInt(req.getParameter("i"));
		
		@SuppressWarnings("unchecked")
		List<BasketDTO> baskets = (List<BasketDTO>) req.getSession().getAttribute("baskets");
		
		baskets.remove(i);
		
		req.getSession().setAttribute("baskets", baskets);
		return null;
	}
}
