package com.delivery.app.store;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.FoodDAO;
import com.delivery.app.store.dao.OrderDAO;
import com.delivery.app.store.dao.OrderDTO;
import com.delivery.app.user.dao.BasketDTO;
import com.delivery.app.user.dao.UserDAO;
import com.delivery.app.user.dao.UserDTO;

public class PayEndOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		@SuppressWarnings("unchecked")
		List<BasketDTO> baskets = (List<BasketDTO>) req.getSession().getAttribute("baskets");
		OrderDTO odto = new OrderDTO();
		OrderDAO odao = new OrderDAO();
		UserDAO udao = new UserDAO();
		FoodDAO fdao = new FoodDAO();
		
		int totalprice = Integer.parseInt(req.getParameter("totalprice"));
		String foodhow = req.getParameter("foodhow");
		String ownercall = req.getParameter("ownercall");
		String ridercall = "";
		if(foodhow.equals("배달")) {
			ridercall = req.getParameter("ridercall");
		}
		String foodnum = baskets.get(0).getFood().getFoodnum() + "";
		String optionnum = "";
		String foodamount = baskets.get(0).getFoodamount() + "";
		String foodtotalprice = baskets.get(0).getFoodtotalprice() + "";
		UserDTO loginUser = (UserDTO) req.getSession().getAttribute("loginUser");
		String userid = loginUser.getUserid();
		
		if (baskets.size() >= 1) {
			for (int i = 1; i < baskets.size(); i++) {
				
				foodnum += "," + baskets.get(i).getFood().getFoodnum();
				foodamount += "," + baskets.get(i).getFoodamount();
				foodtotalprice += "," + baskets.get(i).getFoodtotalprice();
			}
		}
		
		for(int i = 0; i < baskets.size(); i++) {
            if(baskets.get(i).getFoodoption().size() != 0) {
                for(int j = 0; j < baskets.get(i).getFoodoption().size(); j++) {
                    optionnum += "," + baskets.get(i).getFoodoption().get(j).getOptionnum();
                }
            }
        }
		
		if(optionnum.length() != 0) {
			optionnum = optionnum.substring(1, optionnum.length());
		}
		
		odto.setFoodnum(foodnum);
		odto.setOptionnum(optionnum);
		odto.setFoodamount(foodamount);
		odto.setFoodhow(foodhow);
		odto.setOwnercall(ownercall);
		odto.setRidercall(ridercall);
		odto.setStorenum(baskets.get(0).getStore().getStorenum());
		odto.setTotalprice(totalprice);
		odto.setUserid(userid);
		odto.setFoodtotalprice(foodtotalprice);
		
		odao.addOrder(odto);
		udao.addOrderCnt(userid);
		
		if (udao.getOrderCnt(userid) < 6) {
			udao.setGrade(1, userid);
			loginUser.setGrade(1);
		} else if (udao.getOrderCnt(userid) >= 6 && udao.getOrderCnt(userid) <= 10) {
			udao.setGrade(2, userid);
			loginUser.setGrade(2);
		} else {
			udao.setGrade(3, userid);
			loginUser.setGrade(3);
		}
		
		loginUser.setOrdercnt(udao.getOrderCnt(userid));
		req.getSession().setAttribute("loginUser", loginUser);
		
		
		String[] f = foodnum.split(",");
		
		for (int i = 0; i < f.length; i++) {
			fdao.addOrderCnt(Integer.parseInt(f[i]));
		}
		
		baskets.clear();
		req.getSession().setAttribute("baskets", baskets);

		return null;
	}

}
