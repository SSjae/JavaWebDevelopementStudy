package com.delivery.app.user;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.FileDAO;
import com.delivery.app.store.dao.FoodDAO;
import com.delivery.app.store.dao.FoodDTO;
import com.delivery.app.store.dao.FoodOptionDAO;
import com.delivery.app.store.dao.FoodOptionDTO;
import com.delivery.app.store.dao.OrderDAO;
import com.delivery.app.store.dao.OrderDTO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;
import com.delivery.app.store.dao.StoreFileDTO;
import com.delivery.app.user.dao.UserDTO;

public class UserOrderhistoryOkAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDTO loginUser = (UserDTO)req.getSession().getAttribute("loginUser");
		
		OrderDAO odao = new OrderDAO();
		StoreDAO sdao = new StoreDAO();
		FoodDAO fdao = new FoodDAO();
		FoodOptionDAO fodao = new FoodOptionDAO();
		FileDAO fidao = new FileDAO();
		
		List<OrderDTO> orders = odao.orders(loginUser.getUserid());
		List<StoreDTO> orderStore = new ArrayList<StoreDTO>();
		List<StoreFileDTO> storeFile = new ArrayList<StoreFileDTO>();
		
		List<List<FoodDTO>> foods = new ArrayList<List<FoodDTO>>();
		List<List<FoodOptionDTO>> foodOptions = new ArrayList<List<FoodOptionDTO>>();
		List<String[]> foodamount = new ArrayList<String[]>();
		List<String[]> foodtotalprice = new ArrayList<String[]>();
		
		
		for(int i = 0; i < orders.size(); i++) {
			if(orders.get(i).getOwnercall().equals(null)) {
				orders.get(i).setOwnercall("");
			}
			if(orders.get(i).getRidercall().equals(null)) {
				orders.get(i).setRidercall("");
			}
			
			String[] fd = new String[100];
			String[] on = new String[100];
			String[] fa = new String[100];
			String[] ft = new String[100];
			List<FoodDTO> f = new ArrayList<FoodDTO>();
			List<FoodOptionDTO> fo = new ArrayList<FoodOptionDTO>();
			
			fd = orders.get(i).getFoodnum().split(",");
			fa = orders.get(i).getFoodamount().split(",");
			ft = orders.get(i).getFoodtotalprice().split(",");
			
			if(orders.get(i).getOptionnum().length() > 0) {
				on = orders.get(i).getOptionnum().split(",");	
				for(int j = 0; j < on.length; j++) {
					fo.add(fodao.getFoodOption(Integer.parseInt(on[j])));
				}			
			}
			
			for(int j = 0; j < fd.length; j++) {
				f.add(fdao.getFood(Integer.parseInt(fd[j])));
			}
			
			orderStore.add(sdao.getStore(orders.get(i).getStorenum()));
			storeFile.add(fidao.storeFile(orders.get(i).getStorenum()));
			
			foods.add(f);
			foodOptions.add(fo);
			foodamount.add(fa);
			foodtotalprice.add(ft);
		}
		
		req.setAttribute("orders", orders);
		req.setAttribute("orderStore", orderStore);
		req.setAttribute("storeFile", storeFile);
		req.setAttribute("foods", foods);
		req.setAttribute("foodOptions", foodOptions);
		req.setAttribute("foodamount", foodamount);
		req.setAttribute("foodtotalprice", foodtotalprice);
		
		ActionTo acto = new ActionTo();
		
		acto.setRedirect(false);
		acto.setPath(req.getContextPath()+"/app/mypage/orderhistoryview.jsp");
		return acto;
	}

}
