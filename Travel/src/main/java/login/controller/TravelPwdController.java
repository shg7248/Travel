package login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TravelPwdController {
	private final String command = "userPwdForm.log";
	private String getPage = "/userPwdForm";
	private String gotoPage = "../main";

	//userLoginForm.jsp > passwordForm.jsp
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String pwd() {

		return getPage;
	}

	
}
