package travel.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;

@Controller
public class TravelPhoneAuthController {
	
	@Autowired
	private RedisAuth redisAuth;
	
	private final String command = "/phoneAuth.tra";

	@ResponseBody
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String doPostAction(@RequestParam String phone) throws Exception {
		
		String api_key = "NCSWLQNCGD42Q5DB";
		String api_secret = "KYXPY42RJNJQXYPBUC6ELRIX8YXHAK3F";
		
		// 랜덤번호 생성 (6자리)
		int rannum = (int)(Math.random() * 900000) + 100000;
		String rannum2 = String.valueOf(rannum);
		
		System.out.println("key : " + rannum2);
		
		redisAuth.setKeyValue(phone, rannum2, 300);
		
//		Message coolsms = new Message(api_key, api_secret);
//		
//		HashMap<String, String> set = new HashMap<String, String>();
//	    set.put("to", "01077437248"); // 수신번호
//
//	    set.put("from", phone); // 발신번호
//	    set.put("text", "인증번호는 " + rannum2 + "입니다."); // 문자내용
//	    set.put("type", "sms"); // 문자 타입
//	    
//	    coolsms.send(set); // 보내기&전송결과받기
		
		return "success";
	}
	
	private final String command2 = "/phoneAuthConfirm.tra";
	
	@ResponseBody
	@RequestMapping(value = command2, method=RequestMethod.POST)
	public String doPostAction2(@RequestParam String phoneCheck, @RequestParam String phone) throws Exception {
		
		if(redisAuth.hasKey(phone) && redisAuth.getValue(phone).equals(phoneCheck)) {
			System.out.println("인증에 성공했습니다.");
			return "true";
		}
		return "false";
	}
}
