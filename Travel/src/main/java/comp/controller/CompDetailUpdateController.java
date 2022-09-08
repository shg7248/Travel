package comp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CompDetailUpdateController {
	
	private final String command = "/compDetailUpdate.comp";
	private String getPage = "compDetailUpdate";
	private String gotoPage = "redirect:compDetail.comp";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction() {
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doPostAction() {
		
		return gotoPage;
	}
}
