package board.board1.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.board1.model.Board1Bean;
import board.board1.model.Board1Dao;

@Controller
public class Board1DetailController {
	private final String command1="eventdetail.brd";
	private final String command2="noticedetail.brd";
	private String getPage1="board1/eventDetail";
	private String getPage2="board1/noticeDetail";
	
	@Autowired
	Board1Dao bdao;
	
	@RequestMapping(value=command1)
	public String eventdetail(Model model,@RequestParam("nnum") String nnum,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		Board1Bean bb = bdao.getBoard1ByNnum(nnum);
		model.addAttribute("bb",bb);
		model.addAttribute("pageNumber",pageNumber);
		return getPage1;
	}
	
	@RequestMapping(value=command2)
	public String noticedetail(Model model,@RequestParam("nnum") String nnum,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		Board1Bean bb = bdao.getBoard1ByNnum(nnum);
		model.addAttribute("bb",bb);
		model.addAttribute("pageNumber",pageNumber);
		return getPage2;
	}
}
