package comp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CompDetailController {
	
	private final String command = "/1/compDetail.comp";
	private String getPage = "compDetail";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(HttpServletRequest request) {
		
		return getPage;
	}
}
