package shop.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import shop.model.ReserveBean;
import shop.model.ShopDao;

@Controller
public class ShopReservationController {

	@Autowired
	private ShopDao shopDao;
	
	private final String command = "/reserve.shop";
	private String getPage = "reservationForm";
	private String gotoPage = "";
	
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String doGetAction(@ModelAttribute("rnum") String rnum, @ModelAttribute("start") String start, @ModelAttribute("end") String end, Model model) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("rnum", rnum);
		map.put("start", start);
		map.put("end", end);
		
		ReserveBean rb = shopDao.getReserveInfoByRnum(map);
		model.addAttribute("rb", rb);
		
		return getPage;
	}
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String doPostAction() {
		
		
		return gotoPage;
	}
}
