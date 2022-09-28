package travel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdBean;
import admin.model.AdDao;
import board.board1.model.Board1Bean;
import board.board1.model.Board1Dao;
import util.Paging;

@Controller
public class StartController {

	private final String command="/";
	private String getPage="main";
	
	@Autowired
	private Board1Dao bdao;
	
	@Autowired
	private AdDao adao;
	
	@RequestMapping(value=command)
	public String caraousel(Model model,HttpServletRequest request,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		String url = request.getContextPath() + "/"+ command;
		
		//광고
		int totalCountAdvertisement = adao.getTotalAdvertisementCount();
		
		Paging pageInfoAdvertisement = new Paging(pageNumber, "5", totalCountAdvertisement, url, null, null, null);
		List<AdBean> alists = adao.getAdvertisementList(pageInfoAdvertisement);
		AdBean ab = adao.getAdvertisementFirst();
		model.addAttribute("alists",alists);
		model.addAttribute("ab",ab);
		
		//이벤트
		int totalCountEvent = bdao.getTotalEventCount();
		
		Paging pageInfoEvent = new Paging(pageNumber, "5", totalCountEvent, url, null, null, null);
		List<Board1Bean> elists = bdao.getBoard1EventList(pageInfoEvent);
		Board1Bean bb = bdao.getBoard1FirstEvent();
		model.addAttribute("elists",elists);
		model.addAttribute("bb",bb);
		
		//공지사항
		int totalCountNotice = bdao.getTotalNoticeCount();
		
		Paging pageInfoNotice = new Paging(pageNumber, "5", totalCountNotice, url, null, null, null);
		List<Board1Bean> nlists = bdao.getBoard1NoticeList(pageInfoNotice);
		model.addAttribute("nlists",nlists);
		return getPage;
	}
}