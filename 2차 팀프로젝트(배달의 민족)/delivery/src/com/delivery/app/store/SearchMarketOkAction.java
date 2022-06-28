package com.delivery.app.store;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.FileDAO;
import com.delivery.app.store.dao.FoodDAO;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;
import com.delivery.app.store.dao.StoreFileDTO;

public class SearchMarketOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        
        String keyword = req.getParameter("search");
        
        StoreDAO sdao = new StoreDAO();
        FileDAO fidao = new FileDAO();
        ReviewDAO rdao = new ReviewDAO();
        FoodDAO fdao = new FoodDAO();
        
        List<StoreDTO> stores = sdao.searchMarket(keyword);
		List<StoreFileDTO> storeFile = new ArrayList<StoreFileDTO>();
		int[] reviewcnt = new int[stores.size()];

		List<List<String>> foodsName = new ArrayList<List<String>>();
		
		for(int i = 0; i < stores.size(); i++) {
			reviewcnt[i] = rdao.storeReviewCnt(stores.get(i).getStorenum());
			foodsName.add(fdao.storeFoodName(stores.get(i).getStorenum()));
			storeFile.add(fidao.storeFile(stores.get(i).getStorenum()));
		}
		
		req.setAttribute("stores", stores);
		req.setAttribute("reviewCnt", reviewcnt);
		req.setAttribute("foodsName", foodsName);
		req.setAttribute("storeFile", storeFile);
		
		ActionTo acto = new ActionTo();
		
		acto.setRedirect(false);
		acto.setPath(req.getContextPath()+"/app/delivery/delfoodsearchview.jsp");
		return acto;
	}
}
