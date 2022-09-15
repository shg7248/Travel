package board.board1.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.board1.model.Board1Bean;
import board.board1.model.Board1Dao;

@Controller
public class Board1UpdateController {
	private final String command1="updatenotice.brd";
	private final String command2="updateevent.brd";
	
	private String getPage1="board1/updateNoticeForm";
	private String getPage2="board1/updateEventForm";
	
	private String gotoPage1="redirect:/noticelist.brd";
	private String gotoPage2="redirect:/eventlist.brd";
	
	@Autowired
	Board1Dao bdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command1,method = RequestMethod.GET)
	public String noticeupdate(Model model,@RequestParam("nnum") String nnum) {
		Board1Bean board1 = bdao.getBoard1ByNnum(nnum);
		model.addAttribute("board1",board1);
		return getPage1;
	}
	
	@RequestMapping(value=command1,method = RequestMethod.POST)
	public String noticeupdate(Model model,@RequestParam("nnum") String nnum,@ModelAttribute("board1") @Valid Board1Bean bb,BindingResult result) {
		if(result.hasErrors()) {
			return getPage1;
		}
		bdao.updateBoard1ByNnum(bb);
		return gotoPage1;
	}
	
	@RequestMapping(value=command2,method = RequestMethod.GET)
	public String eventupdate(Model model,@RequestParam("nnum") String nnum) {
		Board1Bean board1 = bdao.getBoard1ByNnum(nnum);
		model.addAttribute("board1",board1);
		return getPage2;
	}
	
	@RequestMapping(value=command2,method = RequestMethod.POST)
	public String eventupdate(Model model,@RequestParam("nnum") String nnum,
			@RequestParam("originalContent") String originalContent,
			@ModelAttribute("board1") @Valid Board1Bean bb,BindingResult result) {
		if(result.hasErrors()) {
			return getPage2;
		}
		
		//기존 이미지 삭제
		String originalPath = servletContext.getRealPath("/resources/board1")+"/"+originalContent;
		File file1 = new File(originalPath);
		file1.delete();
		
		//새로운 이미지 등록
		MultipartFile multi = bb.getUpload();
		String newPath = servletContext.getRealPath("/resources/board1")+"/"+bb.getContent(); //업로드 위치 설정
		File file2 = new File(newPath);
		
		try {
			multi.transferTo(file2);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		bdao.updateBoard1ByNnum(bb);
		return gotoPage2;
	}
	
}
