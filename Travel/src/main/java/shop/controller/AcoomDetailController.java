package shop.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import reply.model.ReplyDao;
import shop.model.ShopDao;
import shop.model.ShopOrderDao;

@Controller
public class AcoomDetailController {
	
	@Autowired
	private ShopOrderDao shopOrderDao;
	
	@Autowired
	private ShopDao shopDao;
	
	@Autowired
	private CompDao compDao;
	
	@Autowired
	private ReplyDao replyDao;
	
	private final String command = "/shop/detail.shop";
	private String getPage = "accomDetail";
	
	@SuppressWarnings("null")
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(	@RequestParam(required = false) String anum, 
								@RequestParam(required = false) String onum, // 리뷰
								Model model, 
								@ModelAttribute("start") String start, 
								@ModelAttribute("end") String end) {
			
		// start와 end가 공백문자면 (ModelAttribute는 아무것도 넘어오는게 없으면 공백문자인가 봄) 기본값을 넣어준다. 
		if(start.equals("") && end.equals("")) {
			LocalDate now = LocalDate.now();
			start = now.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
			end = now.plusDays(1).format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("anum", anum);
		map.put("start", start);
		map.put("end", end);
		
		AccomBean accom = compDao.getAccomByAnum(anum);
		model.addAttribute("accom", accom);
		
		List<RoomBean> lists = shopDao.getRoomListByAnum(map);
		model.addAttribute("lists", lists);
		
		
		
		model.addAttribute("onum", onum);
		
		
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doPostAction(	@RequestParam(required = false) String anum, 
			@RequestParam(required = false) String onum, Model model) {
		
		System.out.println("anum : " + anum);
		System.out.println("onum : " + onum);
		
		doGetAction(anum, onum, model, "", "");	
		
		return getPage;
	}
}
