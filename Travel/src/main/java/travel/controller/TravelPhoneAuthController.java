package travel.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.nurigo.java_sdk.api.Message;

@Controller
public class TravelPhoneAuthController {

	private final String command = "/phoneAuth.tra";
	private String getPage = "login/phoneAuthForm";
	
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String doGetAction() {
		
		return getPage;
	}
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String doPostAction(@RequestParam String phone) throws Exception {
		
		String api_key = "NCSWLQNCGD42Q5DB";
		String api_secret = "KYXPY42RJNJQXYPBUC6ELRIX8YXHAK3F";
		
		// 랜덤번호 생성 (6자리)
		int rannum = (int)(Math.random() * 900000) + 100000;
		String rannum2 = String.valueOf(rannum);
		
		
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> set = new HashMap<String, String>();
	    set.put("to", "01077437248"); // 수신번호

	    set.put("from", phone); // 발신번호
	    set.put("text", "인증번호는 " + rannum2 + "입니다."); // 문자내용
	    set.put("type", "sms"); // 문자 타입
	    
	    coolsms.send(set); // 보내기&전송결과받기
		
		return null;
	}
}
