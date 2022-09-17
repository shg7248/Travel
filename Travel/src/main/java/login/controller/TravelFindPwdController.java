package login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TravelFindPwdController {
	private final String command1 = "userFindPwdForm.log";
	private final String command2 = "ownerFindPwdForm.log";
	private String getPage1 = "/userFindPwdForm";
	private String getPage2 = "/ownerFindPwdForm";
	private String gotoPage1 = "redirect:/";
	private String gotoPage2 = "redirect:/";

	//userLoginForm.jsp > userPwdForm.jsp
	@RequestMapping(value = command1,method = RequestMethod.GET)
	public String userpwdfind() {

		return getPage1;
	}
	//userLoginForm.jsp > ownerPwdForm.jsp
	@RequestMapping(value = command2,method = RequestMethod.GET)
	public String ownerpwdfind() {
		
		return getPage2;
	}
	
	@RequestMapping(value = command1,method = RequestMethod.POST)
	public void userpwdfindmail() {
		
	}
	
	@RequestMapping(value = command2,method = RequestMethod.POST)
	public void ownerpwdfindmail() {
		
	}
}
