package mem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.model.TravelUserBean;
import login.model.TravelUserDao;

@Controller
public class TravelMemberInfoController {
	private final String command = "memberInfo.mem";
	private String getPage = "memberInfo";
	private String gotoPage = "redirect:/userLoginForm.log";
	
	@Autowired
	TravelUserDao tudao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String memberInfo(HttpSession session) {
		
		//사용자 정보
		TravelUserBean userInfo = (TravelUserBean) session.getAttribute("userInfo");
		
		//memberInfo.mem >> userLoginForm.jsp
		if(userInfo == null) {
			return gotoPage;
		}
		
		//갱신
		userInfo = tudao.getMember(userInfo.getEmail());
		
		session.setAttribute("userInfo", userInfo);
		
		
		return getPage;
	}
}
