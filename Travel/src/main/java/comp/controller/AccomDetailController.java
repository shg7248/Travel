package comp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import comp.model.AccomBean;
import comp.model.CompDao;

@Controller
public class AccomDetailController {
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/1/accomDetail.comp";
	private String getPage = "accomDetail";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(HttpServletRequest request, Model model) {
		
		int cnum = 1234567890;
		
		AccomBean accom = compDao.getAccomByCnum(cnum);
		model.addAttribute("accom", accom);
		
		return getPage;
	}
}
