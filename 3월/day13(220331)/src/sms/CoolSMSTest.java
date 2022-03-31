package sms;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class CoolSMSTest {
	public static void main(String[] args) {
		String api_key = "api 키";
	    String api_secret = "api secret 키";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", "받는 사람 번호");
	    params.put("from", "보내는 사람 번호");
	    params.put("type", "SMS");
	    params.put("text", "메시지 내용");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	    	// 메시지 전송
	    	JSONObject obj = (JSONObject) coolsms.send(params);
	    	// 보내진 이후에 해야할 행위
	    	System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	    	System.out.println(e.getMessage());
	    	System.out.println(e.getCode());
	    }
	}
}