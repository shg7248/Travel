package mem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TravelMemberInfoController {
	private final String command = "memberInfo.mem";
	private String getPage = "memberInfo";
	private String gotoPage = "";
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String memberInfo() {
		 
		return getPage;
	}
}
