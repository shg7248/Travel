package board.board1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String noticelist(Model model) {
		List<Board1Bean> list = bdao.getBoard1NoticeList();
		model.addAttribute("list",list);
		return getPage1;
	}
	
	@RequestMapping(value=command2)
	public String eventlist(Model model) {
		List<Board1Bean> list = bdao.getBoard1EventList();
		model.addAttribute("list",list);
		return getPage2;
	}
}
