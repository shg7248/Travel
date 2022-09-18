package shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import comp.model.AccomBean;
import comp.model.CompDao;
import comp.model.RoomBean;
import shop.model.ShopOrderDao;

@Controller
public class AcoomDetailController {
	
	@Autowired
	private ShopOrderDao shopOrderDao;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/shop/detail.shop";
	private String getPage = "accomDetail";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(@RequestParam String anum, Model model, @ModelAttribute("start") String start, @ModelAttribute("end") String end) {
			
		AccomBean accom = compDao.getAccomByAnum(anum);
		model.addAttribute("accom", accom);
		
		// 나중에 예약시간 조건도 넣어줘야 함
		List<RoomBean> lists = compDao.getRoomListByAnum(anum);
		model.addAttribute("lists", lists);
		
		return getPage;
	}
}
