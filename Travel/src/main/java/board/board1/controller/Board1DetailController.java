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
	private final String command="eventdetail.brd";
	private String getPage="board1/eventDetail";
	
	@Autowired
	Board1Dao bdao;
	
	@RequestMapping(value=command)
	public String eventdetail(Model model,@RequestParam("nnum") String nnum) {
		Board1Bean bb = bdao.getBoard1ByNnum(nnum);
		model.addAttribute("bb",bb);
		return getPage;
	}
}
