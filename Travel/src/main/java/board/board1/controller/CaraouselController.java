package board.board1.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import Util.Paging;
import board.board1.model.Board1Bean;
import board.board1.model.Board1Dao;

@Controller
public class CaraouselController {
	private final String command="caraousel.brd";
	private String getPage="board1/caraousel";
	
	@Autowired
	Board1Dao bdao;
	
	@RequestMapping(value=command)
	public String caraousel(Model model) {
		Paging pageInfo = null;
		List<Board1Bean> lists = bdao.getBoard1EventList(pageInfo);
		model.addAttribute("lists",lists);
		System.out.println(lists.size());
		return getPage;
	}
}
