package comp.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import comp.model.AccomBean;
import comp.model.CompDao;
import login.model.TravelCompanyBean;

@Controller
public class AccomDetailController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/accom/detail.comp";
	private String getPage = "accomDetail";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(HttpServletRequest request, HttpSession session, Model model) {
		
		TravelCompanyBean tcb = (TravelCompanyBean) session.getAttribute("loginInfo");
		String cnum = tcb.getCnum();
		
		AccomBean accom = compDao.getAccomByCnum(cnum);
		model.addAttribute("accom", accom);
		
		return getPage;
	}
}
