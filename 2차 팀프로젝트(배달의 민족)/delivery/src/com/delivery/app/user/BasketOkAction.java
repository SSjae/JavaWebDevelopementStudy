package com.delivery.app.user;

import java.io.PrintWriter;
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
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;
import com.delivery.app.user.dao.BasketDTO;
import com.delivery.app.user.dao.UserDTO;

public class BasketOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = resp.getWriter();
		
		UserDTO loginUser = (UserDTO)req.getSession().getAttribute("loginUser");
		
		String path = req.getParameter("path");
		int i = Integer.parseInt(req.getParameter("i"));
		
		int storenum = Integer.parseInt(req.getParameter("storenum"));
		int foodnum = Integer.parseInt(req.getParameter("foodnum"));
		int foodamount = Integer.parseInt(req.getParameter("foodamount"));
		int foodtotalprice = Integer.parseInt(req.getParameter("foodtotalprice"));
				
		List<String> checknum = new ArrayList<String>();
		String radionum = "";
		String[] optionnum1 = new String[100];
		
		if(path.equals("top")) {
			radionum = req.getParameter("demo-radio" + i);
			optionnum1 = req.getParameterValues("demo-checkbox" + i);
		} else if (path.equals("all")) {
			radionum = req.getParameter("demo-radio-" + i);
			optionnum1 = req.getParameterValues("demo-checkbox-" + i);
		} else {
			radionum = req.getParameter("demo-radio--" + i);
			optionnum1 = req.getParameterValues("demo-checkbox--" + i);
		}
		
		if(optionnum1.length != 0) {
			for(int j = 0; j < optionnum1.length; j++) {
				if(!optionnum1[j].equals("")) {
					checknum.add(optionnum1[j]);
				}
			}
		}

		@SuppressWarnings("unchecked")
		List<BasketDTO> baskets = (List<BasketDTO>) req.getSession().getAttribute("baskets");
		
		if(baskets.size() == 0 || baskets.get(0).getStore().getStorenum() == storenum) {
			StoreDAO sdao = new StoreDAO();
			FoodDAO fdao = new FoodDAO();
			FoodOptionDAO fodao = new FoodOptionDAO();
			FileDAO fidao = new FileDAO();
			
			StoreDTO store = sdao.getStore(storenum);
			FoodDTO food = fdao.getFood(foodnum);
			FoodFileDTO foodFile = fidao.foodFile(foodnum);
			List<FoodOptionDTO> foodoptions = new ArrayList<FoodOptionDTO>();
			
			
			if(!radionum.equals("")) {
				foodoptions.add(fodao.getFoodOption(Integer.parseInt(radionum)));
			}
			
			if(!checknum.isEmpty()) {
				for(int k = 0; k < checknum.size(); k++) {
					foodoptions.add(fodao.getFoodOption(Integer.parseInt(checknum.get(k))));
				}
			}
			
			BasketDTO basket = new BasketDTO();
			
			basket.setStore(store);
			basket.setFood(food);
			basket.setUserid(loginUser.getUserid());
			basket.setFoodoption(foodoptions);
			basket.setFoodamount(foodamount);
			basket.setFoodtotalprice(foodtotalprice);
			basket.setFoodfile(foodFile);
			
			baskets.add(basket);
			req.getSession().setAttribute("baskets", baskets);
			
			out.write("<script>");
			out.write("alert('장바구니에 담겼습니다.');");
			out.write("location.href='" + req.getContextPath() + "/store/DelMarketMenu.st?sn=" + storenum + "';");
			out.write("</script>");
		} else {
			out.write("<script>");
			out.write("alert('장바구니에는 같은 가게의 음식만 가능합니다.');");
			out.write("location.href='" + req.getContextPath() + "/store/DelMarketMenu.st?sn=" + storenum + "';");
			out.write("</script>");
		}
		
		return null;
	}
}
