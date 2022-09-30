package board.board1.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.board1.model.Board1Bean;
import board.board1.model.Board1Dao;

@Controller
public class Board1DeleteController {
	private final String command1="noticedelete.brd";
	private final String command2="eventdelete.brd";
	private String gotoPage1="redirect:/noticelist.brd";
	private String gotoPage2="redirect:/eventlist.brd";
	
	@Autowired
	Board1Dao bdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command1)
	public String noticedelete(@RequestParam("nnum") String nnum) {
		bdao.deleteBoard1ByNnum(nnum);
		return gotoPage1;
	}
	@RequestMapping(value=command2)
	public String eventdelete(@RequestParam("nnum") String nnum) {
		Board1Bean bb = bdao.getBoard1ByNnum(nnum);
		String deletePath = servletContext.getRealPath("/resources/images/event");
		System.out.println(deletePath);
		File delFile = new File(deletePath+"/"+bb.getContent());
		File delFile1 = new File(deletePath+"/"+bb.getThumbnail());
		delFile.delete();
		delFile1.delete();
		
		bdao.deleteBoard1ByNnum(nnum);
		return gotoPage2;
	}
}
