package com.delivery.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.OrderDAO;

public class RemoveUserOrderhistoryOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		int ordernum = Integer.parseInt(req.getParameter("on"));
		
		OrderDAO odao = new OrderDAO();
		
		if(odao.removeOrder(ordernum) == 1) {
			out.write("<script>");
			out.write("alert('주문내역이 삭제되었습니다.');");
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
