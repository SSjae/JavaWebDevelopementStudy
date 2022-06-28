package com.delivery.app.store;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.FileDAO;
import com.delivery.app.store.dao.FoodDAO;
import com.delivery.app.store.dao.FoodDTO;
import com.delivery.app.store.dao.FoodFileDTO;
import com.delivery.app.store.dao.FoodOptionDAO;
import com.delivery.app.store.dao.FoodOptionDTO;
import com.delivery.app.store.dao.LikeStoreDAO;
import com.delivery.app.store.dao.OrderDAO;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.ReviewDTO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;
import com.delivery.app.user.dao.UserDAO;
import com.delivery.app.user.dao.UserDTO;

public class DelMarketMenuOkAction implements Action { 
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int storenum = Integer.parseInt(req.getParameter("sn"));
		
		UserDTO loginUser = (UserDTO) (req.getSession().getAttribute("loginUser"));
		
		UserDAO udao = new UserDAO();
		StoreDAO sdao = new StoreDAO();
		ReviewDAO rdao = new ReviewDAO();
		OrderDAO odao = new OrderDAO();
		LikeStoreDAO ldao = new LikeStoreDAO();
		FoodDAO fdao = new FoodDAO();
		FileDAO fidao = new FileDAO();
		FoodOptionDAO fodao = new FoodOptionDAO();
		
		StoreDTO store = sdao.getStore(storenum);
		int ordercnt = odao.storeOrderCnt(storenum);
		int reviewcnt = rdao.storeReviewCnt(storenum);
		int isLike = 0;
		if(loginUser != null) {
			isLike = ldao.isLike(storenum, loginUser.getUserid());
		}
		
		List<ReviewDTO> storereview = rdao.storeReviewNew(storenum);
		
		int[] starcnts = {0,0,0,0,0};
		
		List<UserDTO> reviewUser = new ArrayList<UserDTO>();
		for(int i = 0; i < storereview.size(); i++) {
			reviewUser.add(udao.reviewUser(storereview.get(i).getUserid()));
			int starcnt = storereview.get(i).getStarcnt();
			
			switch (starcnt) {
			case 5:
				starcnts[4]++;
				break;
			case 4:
				starcnts[3]++;
				break;
			case 3:
				starcnts[2]++;
				break;
			case 2:
				starcnts[1]++;
				break;
			case 1:
				starcnts[0]++;
				break;
			default:
				break;
			}
		}
		
		List<FoodDTO> foods = fdao.storeFood(storenum);
		List<String> foodTheme = fdao.foodTheme(storenum);
		List<FoodFileDTO> foodFile = new ArrayList<FoodFileDTO>();
		List<List<FoodOptionDTO>> foodOptions = new ArrayList<List<FoodOptionDTO>>();
		
		for(int i = 0; i < foods.size(); i++) {
			foodFile.add(fidao.foodFile(foods.get(i).getFoodnum()));
			foodOptions.add(fodao.foodOptions(foods.get(i).getFoodnum()));
		}
		
		req.setAttribute("store", store);
		req.setAttribute("ordercnt", ordercnt);
		req.setAttribute("reviewcnt", reviewcnt);
		req.setAttribute("like", isLike);
		req.setAttribute("storereview", storereview);
		req.setAttribute("starcnts", starcnts);
		req.setAttribute("reviewuser", reviewUser);
		req.setAttribute("foods", foods);
		req.setAttribute("foodtheme", foodTheme);
		req.setAttribute("foodFile", foodFile);
		req.setAttribute("foodOptions", foodOptions);
		
		ActionTo acto = new ActionTo();
		
		acto.setRedirect(false);
		acto.setPath(req.getContextPath()+"/app/delivery/delmarketmenuview.jsp");
		return acto;
	}
}
