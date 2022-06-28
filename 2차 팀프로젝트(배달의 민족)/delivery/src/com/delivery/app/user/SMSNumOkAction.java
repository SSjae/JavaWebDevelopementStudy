package com.delivery.app.user;

import com.delivery.action.Action;
import com.delivery.action.ActionTo;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.json.simple.JSONObject;

public class SMSNumOkAction implements Action {
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userphone = req.getParameter("userphone");
		String authnum = "";
		
		Random rand = new Random();
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			authnum = String.valueOf(authnum) + ran;
		} 
		PrintWriter out = resp.getWriter();
		
		//sms(userphone, authnum);
		
		out.write(authnum);
		return null;
	}
  
	public void sms(String userphone, String authnum) {
		String api_key = "NCSLQPDZNIYPWWQN";
		String api_secret = "YAPQ3ZMVCOJI6O6EIKQYFMY0VLVUDOO0";
		Message coolsms = new Message(api_key, api_secret);
		HashMap<String, String> params = new HashMap<>();
		
		params.put("to", userphone);
		params.put("from", "01040540947");
		params.put("type", "SMS");
		params.put("text", "[이번엔 진짜 일조] 배달의 민족 인증 번호는 " + authnum + " 입니다.");
		params.put("app_version", "test app 1.2");
		try {
			JSONObject obj = coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		} 
	}	
}