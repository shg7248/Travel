package comp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CompInfoController {
	private final String command = "/comp/compInfo.comp";
	private String getPage = "compInfo";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction() {
		
		return getPage;
	}
}
