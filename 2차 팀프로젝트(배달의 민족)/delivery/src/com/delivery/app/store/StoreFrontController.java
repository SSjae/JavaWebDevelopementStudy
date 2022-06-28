package com.delivery.app.store;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.ActionTo;

public class StoreFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
  
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		ActionTo acto = null;
		
		switch (command) {
		case "/store/DelFoodTheme.st":
			try {
				acto = new DelFoodThemeOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/DelFoodTheme : " + e);
			}
			break;
		case "/store/DelMarketMenu.st":
			try {
				acto = new DelMarketMenuOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/DelMarketMenu : " + e);
			}
			break;
		case "/store/StoreLike.st":
			try {
				new StoreLikeOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/StoreLike : " + e);
			}
			break;
		case "/store/ShowReview.st":
			try {
				new ShowReviewOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/ShowReview : " + e);
			}
			break;
		case "/store/LikeMarket.st":
			try {
				acto = new LikeMarketOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/ShowReview : " + e);
			}
			break;
		case "/store/Pay.st":
			try {
				acto = new PayOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("PayOk : " + e);
			}
			break;
		case "/store/PayEnd.st":
			try {
				new PayEndOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("PayEnd : " + e);
			}
			break;
		case "/store/SearchMarket.st":
			try {
				acto = new SearchMarketOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("SearchMarket : " + e);
			}
			break;
		} 
		
		if (acto != null) {
			if (acto.isRedirect()) {
				resp.sendRedirect(acto.getPath());
			} else {
				RequestDispatcher disp = req.getRequestDispatcher(acto.getPath());
				disp.forward((ServletRequest)req, (ServletResponse)resp);
			}  
		}
	}
}