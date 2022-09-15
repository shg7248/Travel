package mem.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import mem.model.TravelAccountBean;
import mem.model.TravelMemberDao;

@Controller
public class TravelAccountController {
	private final String command = "memberAccount.mem"; 
	private String getPage = "memberAccount";
	
	@Autowired
	TravelMemberDao tmdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView account(HttpSession session) {
		
		int mnum = (Integer) session.getAttribute("mnum");
		
		List<TravelAccountBean> lists = new ArrayList<TravelAccountBean>();
		lists = tmdao.accountList(mnum);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		
		return mav;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String account2(@RequestParam String bank,
			@RequestParam String accnum,
			HttpSession session
			) {
		int mnum = (Integer) session.getAttribute("mnum");
		System.out.println("mnum: " + mnum);
		
		TravelAccountBean tabean = new TravelAccountBean();
		tabean.setBank(bank);
		tabean.setAccnum(Integer.parseInt(accnum));
		tabean.setMnum(mnum);
		
		tmdao.insertAccount(tabean);
		
		return getPage;
	}
}
