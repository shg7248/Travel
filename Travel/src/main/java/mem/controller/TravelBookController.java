package mem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mem.model.TravelMemberDao;
import shop.model.OrdersBean;

@Controller
public class TravelBookController {
	private final String command = "/bookingList.mem"; 
	private String getPage = "bookingList";
	private String gotoPage = "리뷰쓰기버튼";
	
	private final String cancel = "/bookingCancel.mem";
	
	@Autowired
	TravelMemberDao tmdao;
	
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView book(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Integer mnum = (Integer) session.getAttribute("mnum");
		System.out.println("mnum: " + mnum);
		
		if(mnum == null) {
			mav.setViewName("redirect:userLoginForm.log");
			
			return mav;
		}
		List<OrdersBean> lists = tmdao.orderList(mnum);
		
		mav.setViewName(getPage);
		mav.addObject("lists", lists);
		
		return mav;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String book2() {
		
		return gotoPage;
	}
	
	@RequestMapping(value = cancel,method = RequestMethod.GET)
	public String book(@RequestParam String onum) {
		
		tmdao.deleteOrder(onum);
		
		return getPage;
	}
}
