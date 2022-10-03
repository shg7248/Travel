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
	private final String command1="noticeupdate.brd";
	private final String command2="eventupdate.brd";
	
	private String getPage1="board1/noticeUpdateForm";
	private String getPage2="board1/eventUpdateForm";
	
	private String gotoPage1="redirect:/noticelist.brd";
	private String gotoPage2="redirect:/eventlist.brd";
	
	@Autowired
	Board1Dao bdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command1,method = RequestMethod.GET)
	public String noticeupdate(Model model,@RequestParam("nnum") String nnum,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		Board1Bean board1 = bdao.getBoard1ByNnum(nnum);
		model.addAttribute("board1",board1);
		model.addAttribute("pageNumber",pageNumber);
		return getPage1;
	}
	
	@RequestMapping(value=command1,method = RequestMethod.POST)
	public String noticeupdate(Model model,@RequestParam("nnum") String nnum,@ModelAttribute("board1") Board1Bean bb,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {

		bdao.updateBoard1NoticeByNnum(bb);
		model.addAttribute("pageNumber",pageNumber);
		return gotoPage1;
	}
	
	@RequestMapping(value=command2,method = RequestMethod.GET)
	public String eventupdate(Model model,@RequestParam("nnum") String nnum,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		Board1Bean board1 = bdao.getBoard1ByNnum(nnum);
		model.addAttribute("board1",board1);
		model.addAttribute("pageNumber",pageNumber);
		return getPage2;
	}
	
	@RequestMapping(value=command2,method = RequestMethod.POST)
	public String eventupdate(Model model,@RequestParam("nnum") String nnum,
			@RequestParam("originalContent") String originalContent,
			@RequestParam("originalThumbnail") String originalThumbnail,
			@ModelAttribute("board1") Board1Bean bb,@RequestParam(value="pageNumber",required = false) String pageNumber) {
		
		//기존 이미지 삭제
		String originalPath1 = servletContext.getRealPath("/resources/images/event")+"/"+originalContent;
		String originalPath3 = servletContext.getRealPath("/resources/images/event")+"/"+originalThumbnail;
		File file1 = new File(originalPath1);
		File file3 = new File(originalPath3);
		file1.delete();
		file3.delete();
		
		//새로운 이미지 등록
		MultipartFile multi = bb.getUpload();
		MultipartFile multi4 = bb.getUploadthumbnail();
		String newPath = servletContext.getRealPath("/resources/images/event")+"/"+bb.getContent(); //업로드 위치 설정
		String newPath4 = servletContext.getRealPath("/resources/images/event")+"/"+bb.getThumbnail(); //업로드 위치 설정
		File file2 = new File(newPath);
		File file4 = new File(newPath4);
		
		try {
			multi.transferTo(file2);
			multi4.transferTo(file4);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		bdao.updateBoard1ByNnum(bb);
		model.addAttribute("pageNumber",pageNumber);
		return gotoPage2;
	}
	
}
