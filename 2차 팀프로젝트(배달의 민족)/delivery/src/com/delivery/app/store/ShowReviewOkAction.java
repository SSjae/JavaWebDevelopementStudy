package com.delivery.app.store;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import com.delivery.app.store.dao.ReviewDAO;
import com.delivery.app.store.dao.ReviewDTO;
import com.delivery.app.user.dao.UserDAO;
import com.delivery.app.user.dao.UserDTO;

public class ShowReviewOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");

        PrintWriter out = resp.getWriter();

		
		String pa = req.getParameter("pa");
		int storenum = Integer.parseInt(req.getParameter("sn"));
		
		UserDAO udao = new UserDAO();
		ReviewDAO rdao = new ReviewDAO();

		List<ReviewDTO> storereviewnew = rdao.storeReviewNew(storenum);
		List<ReviewDTO> storereviewhigh = rdao.storeReviewHigh(storenum);
		List<ReviewDTO> storereviewlow = rdao.storeReviewLow(storenum);
		
		if(pa.equals("new")) {
			JSONArray ja = new JSONArray();
			for(int i=0; i<storereviewnew.size(); i++) {
				JSONObject obj = new JSONObject();
				UserDTO user = udao.reviewUser(storereviewnew.get(i).getUserid());
				
				obj.put("reviewnum", storereviewnew.get(i).getReviewnum());
				obj.put("reviewcontents", storereviewnew.get(i).getReviewcontents());
				obj.put("regdate", storereviewnew.get(i).getRegdate());
				obj.put("starcnt", storereviewnew.get(i).getStarcnt());
				obj.put("userid", storereviewnew.get(i).getUserid());
				obj.put("usernickname", user.getUsernickname());
				ja.add(obj);
			}
			out.print(ja.toString());
			
		} else if (pa.equals("high")) {
			JSONArray ja = new JSONArray();
			for(int i=0; i<storereviewhigh.size(); i++) {
				JSONObject obj = new JSONObject();
				UserDTO user = udao.reviewUser(storereviewhigh.get(i).getUserid());
				
				obj.put("reviewnum", storereviewhigh.get(i).getReviewnum());
				obj.put("reviewcontents", storereviewhigh.get(i).getReviewcontents());
				obj.put("regdate", storereviewhigh.get(i).getRegdate());
				obj.put("starcnt", storereviewhigh.get(i).getStarcnt());
				obj.put("userid", storereviewhigh.get(i).getUserid());
				obj.put("usernickname", user.getUsernickname());
				ja.add(obj);
			}
			out.print(ja.toString());
		} else {
			JSONArray ja = new JSONArray();
			for(int i=0; i<storereviewlow.size(); i++) {
				JSONObject obj = new JSONObject();
				UserDTO user = udao.reviewUser(storereviewlow.get(i).getUserid());
				
				obj.put("reviewnum", storereviewlow.get(i).getReviewnum());
				obj.put("reviewcontents", storereviewlow.get(i).getReviewcontents());
				obj.put("regdate", storereviewlow.get(i).getRegdate());
				obj.put("starcnt", storereviewlow.get(i).getStarcnt());
				obj.put("userid", storereviewlow.get(i).getUserid());
				obj.put("usernickname", user.getUsernickname());
				ja.add(obj);
			}
			out.print(ja.toString());
		}
		return null;
	}
}
