package comp.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import comp.model.CompDao;
import comp.model.RoomBean;

@Controller
public class RoomDetailController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/comp/room/detail.comp";
	private String getPage = "roomDetail";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(Model model, HttpSession session, @RequestParam String rnum) {
		
		RoomBean rb = compDao.getRoomByRnum(rnum);
		model.addAttribute("rb", rb);
		
		return getPage;
	}
}
