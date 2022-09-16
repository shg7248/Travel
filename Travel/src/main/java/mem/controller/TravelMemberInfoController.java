package mem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.model.TravelUserBean;

@Controller
public class TravelMemberInfoController {
	private final String command = "memberInfo.mem";
	private String getPage = "memberInfo";
	private String gotoPage = "redirect:/userLoginForm.log";
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String memberInfo(HttpSession session) {
		
		//사용자 정보
		TravelUserBean userInfo = (TravelUserBean) session.getAttribute("userInfo");
		
		//memberInfo.mem >> userLoginForm.jsp
		if(userInfo == null) {
			return gotoPage;
		}
		
		return getPage;
	}
}
