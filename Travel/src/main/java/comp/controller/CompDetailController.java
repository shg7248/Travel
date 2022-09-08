package comp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CompDetailController {
	
	private final String command = "compDetail.comp";
	private String getPage = "compDetail";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction() {
		
		return getPage;
	}
}
