package com.delivery.app.store;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.FileDAO;
import com.delivery.app.store.dao.StoreFileDTO;
import com.delivery.app.store.dao.FoodDAO;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;

public class DelFoodThemeOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String theme = req.getParameter("th");
		
		StoreDAO sdao = new StoreDAO();
		ReviewDAO rdao = new ReviewDAO();
		FoodDAO fdao = new FoodDAO();
		FileDAO fidao = new FileDAO();
		
		List<StoreDTO> stores = sdao.storeTheme(theme);
		theme = theme.replace("_", " ");
		
		List<List<String>> foodsName = new ArrayList<List<String>>();
		int[] reviewcnt = new int[stores.size()];
		
		List<StoreFileDTO> storeFile = new ArrayList<StoreFileDTO>();
		
		for(int i = 0; i < stores.size(); i++) {
			reviewcnt[i] = rdao.storeReviewCnt(stores.get(i).getStorenum());
			foodsName.add(fdao.storeFoodName(stores.get(i).getStorenum()));
			storeFile.add(fidao.storeFile(stores.get(i).getStorenum()));
		}
		
		req.setAttribute("stores", stores);
		req.setAttribute("theme", theme);
		req.setAttribute("reviewCnt", reviewcnt);
		req.setAttribute("foodsName", foodsName);
		req.setAttribute("storeFile", storeFile);
		
		ActionTo acto = new ActionTo();
		
		acto.setRedirect(false);
		acto.setPath(req.getContextPath()+"/app/delivery/delfoodthemeview.jsp");
		return acto;
	}
}
