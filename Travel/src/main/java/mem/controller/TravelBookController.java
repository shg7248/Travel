package mem.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mem.model.TravelMemberDao;

@Controller
public class TravelBookController {
	private final String command = "/bookingList.mem"; 
	private String getPage = "bookingList";
	private String gotoPage = "리뷰쓰기버튼";
	
	@Autowired
	TravelMemberDao tmdao;
	
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String book(HttpSession session) {
		int mnum = (Integer) session.getAttribute("mnum");
		
		
		return getPage;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String book2() {
		
		return gotoPage;
	}
}
