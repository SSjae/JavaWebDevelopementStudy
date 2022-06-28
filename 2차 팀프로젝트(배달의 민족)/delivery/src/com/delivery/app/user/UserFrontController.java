package com.delivery.app.user;

import com.delivery.action.ActionTo;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserFrontController extends HttpServlet {
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
		case "/user/UserLogin.us":
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/user/loginview.jsp");
			break;
		case "/user/UserJoin.us":
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/user/joinview.jsp");
			break;
		case "/user/FindIdPw.us":
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/user/findidpwview.jsp");
			break;
		case "/user/FindIdPwResult.us":
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/user/findidpwresultview.jsp");
			break;
		case "/user/UserPage.us":
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/mypage/mypage.jsp");
			break;
		case "/user/UserRemove.us":
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/user/removeuser.jsp");
			break;
		case "/user/UserModify.us":
			acto = new ActionTo();
			acto.setRedirect(false);
			acto.setPath("/app/mypage/modifyview.jsp");
			break;
		case "/user/UserJoinOk.us": 
			try {
				new UserJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/UserJoinOk : " + e);
			} 
			break;
		case "/user/UserLoginOk.us":
			try {
				new UserLoginOkAction().execute(req, resp);
			} catch (Exception exception) {
				System.out.println("/UserLoginOk : " + exception);
			} 
			break;
		case "/user/CheckIdOk.us":
			try {
				new CheckIdOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/CheckIdOk : " + e);
			} 
			break;
		case "/user/SMSNumOk.us":
			try {
				new SMSNumOkAction().execute(req, resp);
			} catch (Exception exception) {
				System.out.println("/AuthNumOk : " + exception);
			} 
			break;
		case "/user/FindIdOk.us":
			try {
				new FindIdOkAction().execute(req, resp);
			} catch (Exception exception) {
				System.out.println("/FindIdOk : " + exception);
			} 
			break;
		case "/user/FindPwOk.us":
			try {
				new FindPwOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/FindPwOk : " + e);
			} 
			break;
		case "/user/FindResetPwOk.us":
			try {
				new FindResetPwOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/FindResetPwOk : " + e);
			} 
			break;
		case "/user/UserLogout.us":
			try {
				new UserLogoutOkAction().execute(req, resp);
			} catch (Exception exception) {
				System.out.println("/UserLogoutOk : " + exception);
			} 
			break;
		case "/user/UserRemoveOk.us":
			try {
				new UserRemoveOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/UserRemoveOk : " + e);
			}
			break;
		case "/user/UserModifyOk.us":
			try {
				new UserModifyOkAction().execute(req, resp);
			} catch (Exception e1) {
				System.out.println("/UserModifyOk : "+e1);
			}
			break;
		case "/user/RemoveLikeStore.us":
			try {
				new RemoveLikeStoreOkAction().execute(req, resp);
			} catch (Exception e1) {
				System.out.println("/RemoveLikeStoreOk : "+e1);
			}
			break;
		case "/user/MyReview.us":
			try {
				acto = new MyReviewOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/MyReviewOk : " + e);
			}
			break;
		case "/user/ModifyReview.us":
			try {
				acto = new MyReviewModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/MyReviewModifyOk : " + e);
			}
			break;
		case "/user/DelReview.us":
			try {
				acto = new DelReviewOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/DelReviewOk : " + e);
			}
			break;
		case "/user/UserOrderhistory.us":
			try {
				acto = new UserOrderhistoryOkAction().execute(req, resp);
			} catch (Exception e2) {
				System.out.println("/UserOrderhistoryOk : "+e2);
			}
			break;
		case "/user/RemoveUserOrderhistory.us":
			try {
				new RemoveUserOrderhistoryOkAction().execute(req, resp);
			} catch (Exception e2) {
				System.out.println("/RemoveUserOrderhistoryOk : "+e2);
			}
			break;
		case "/user/ReviewWrite.us":
			try {
				new ReviewWriteOkAction().execute(req, resp);
			} catch (Exception e2) {
				System.out.println("/ReviewWriteOk : "+e2);
			}
			break;
		case "/user/CheckReview.us":
			try {
				new CheckReviewOkAction().execute(req, resp);
			} catch (Exception e2) {
				System.out.println("/CheckReviewOk : "+e2);
			}
			break;
		case "/user/Basket.us":
			try {
				new BasketOkAction().execute(req, resp);
			} catch (Exception e2) {
				System.out.println("/BasketOk : "+e2);
			}
			break;
		case "/user/RemoveBasket.us":
			try {
				new RemoveBasketOkAction().execute(req, resp);
			} catch (Exception e2) {
				System.out.println("/RemoveBasketOk : "+e2);
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