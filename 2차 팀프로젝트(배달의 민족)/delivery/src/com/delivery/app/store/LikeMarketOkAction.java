package com.delivery.app.store;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.FileDAO;
import com.delivery.app.store.dao.FoodDAO;
import com.delivery.app.store.dao.LikeStoreDAO;
import com.delivery.app.store.dao.LikeStoreDTO;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.StoreDAO;
import com.delivery.app.store.dao.StoreDTO;
import com.delivery.app.store.dao.StoreFileDTO;
import com.delivery.app.user.dao.UserDTO;

public class LikeMarketOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDTO loginUser = (UserDTO) req.getSession().getAttribute("loginUser");
		
		LikeStoreDAO ldao = new LikeStoreDAO();
		StoreDAO sdao = new StoreDAO();
		ReviewDAO rdao = new ReviewDAO();
		FoodDAO fdao = new FoodDAO();
		FileDAO fidao = new FileDAO();
		
		List<StoreFileDTO> storeFile = new ArrayList<StoreFileDTO>();
		List<LikeStoreDTO> likeStore = ldao.likeStore(loginUser.getUserid());
		List<StoreDTO> store = new ArrayList<StoreDTO>();
		int[] reviewCnt = new int[likeStore.size()];
		int totalLikeCnt = ldao.likeCnt(loginUser.getUserid());
		List<List<String>> foodsName = new ArrayList<List<String>>();
		
		
		for(int i = 0; i < likeStore.size(); i++) {
			store.add(sdao.getStore(likeStore.get(i).getStorenum()));
			reviewCnt[i] = rdao.storeReviewCnt(likeStore.get(i).getStorenum());
			foodsName.add(fdao.storeFoodName(likeStore.get(i).getStorenum()));
			storeFile.add(fidao.storeFile(likeStore.get(i).getStorenum()));
		}
		
		req.setAttribute("likeStore", likeStore);
		req.setAttribute("store", store);
		req.setAttribute("reviewCnt", reviewCnt);
		req.setAttribute("foodsName", foodsName);
		req.setAttribute("totalLikeCnt", totalLikeCnt);
		req.setAttribute("storeFile", storeFile);
		
		ActionTo acto = new ActionTo();
		
		acto.setRedirect(false);
		acto.setPath(req.getContextPath()+"/app/mypage/likemarketview.jsp");
		return acto;
	}
}
