package login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TravelLogoutController {
	private final String command = "logout.log";
	private String getPage = "logout";

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String logout(HttpSession session) {
		
		//모든세션제거
		session.invalidate(); 
		 
		return getPage;
	}
}
