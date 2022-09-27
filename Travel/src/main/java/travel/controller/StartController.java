package travel.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestScope;

import board.board1.model.Board1Bean;
import board.board1.model.Board1Dao;
import util.Paging;

@Controller
public class StartController {

	private final String command="/";
	private String getPage="main";
	
	@Autowired
	private Board1Dao bdao;
	
	@RequestMapping(value=command)
	public String caraousel(Model model,HttpServletRequest request,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		String url = request.getContextPath() + "/"+ command;
		int totalCount = bdao.getTotalEventCount();
		
		//이벤트
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, null, null, null);
		List<Board1Bean> elists = bdao.getBoard1EventList(pageInfo);
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