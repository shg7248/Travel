package login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.model.TravelUserBean;

@Controller
public class TravelLogoutController {
	private final String command = "logout.log";
	private String getPage = "logout";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String logout(HttpSession session) {
		TravelUserBean user = (TravelUserBean)session.getAttribute("userInfo");
		
		//유저정보가 있으면
		if(user != null) {
			//소셜로그인이면
			if(user.getFlatform() != "home") {
				
			}
		}
		
		//모든세션제거
		session.invalidate(); 
		 
		return getPage;
	}
}
