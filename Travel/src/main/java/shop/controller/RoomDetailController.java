package shop.controller;

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
	private CompDao compDao;
	
	private final String command = "/2/roomDetail.comp";
	private String getPage = "roomDetail";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(Model model, @RequestParam String rnum) {
		
		RoomBean roomBean = compDao.getRoomByRnum(rnum);
		model.addAttribute("roomBean", roomBean);
		
		return getPage;
	}
}
