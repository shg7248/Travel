package board.board1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Util.Paging;
import board.board1.model.Board1Bean;
import board.board1.model.Board1Dao;

@Controller
public class Board1ListController {
	private final String command1="noticelist.brd";
	private final String command2="eventlist.brd";
	private String getPage1="board1/noticeList";
	private String getPage2="board1/eventList";
	
	@Autowired
	Board1Dao bdao;
	
	@RequestMapping(value=command1)
	public String noticelist(Model model,HttpServletRequest request,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		String url = request.getContextPath() + "/"+command1;
		int totalCount = bdao.getTotalNoticeCount();
		
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, null, null, null);
		List<Board1Bean> list = bdao.getBoard1NoticeList(pageInfo);
		model.addAttribute("list",list);
		model.addAttribute("pageInfo",pageInfo);
		return getPage1;
	}
	
	@RequestMapping(value=command2)
	public String eventlist(Model model,HttpServletRequest request,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		String url = request.getContextPath() + "/"+command2;
		int totalCount = bdao.getTotalEventCount();
		
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, null, null, null);
		List<Board1Bean> list = bdao.getBoard1EventList(pageInfo);
		model.addAttribute("list",list);
		model.addAttribute("pageInfo",pageInfo);
		return getPage2;
	}
}
