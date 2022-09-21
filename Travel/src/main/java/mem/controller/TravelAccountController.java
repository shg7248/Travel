package mem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
	private final String command = "/memberAccount.mem"; 
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
			HttpSession session,
			HttpServletResponse response
			) throws IOException {
		//중복계좌확인
		int cnt = tmdao.seachAccount(accnum);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if(cnt>0) {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('사용불가능한 계좌번호입니다.'); ");
			writer.println("</script>");
			writer.flush();
			
			return getPage;
		}
		
		int mnum = (Integer) session.getAttribute("mnum");
		System.out.println("mnum: " + mnum);
		
		TravelAccountBean tabean = new TravelAccountBean();
		tabean.setBank(bank);
		tabean.setAccnum(accnum);
		tabean.setMnum(mnum);
		
		tmdao.insertAccount(tabean);
		
		return "redirect:"+command;
	}
}
