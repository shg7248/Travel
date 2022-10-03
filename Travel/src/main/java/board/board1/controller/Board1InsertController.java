package board.board1.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import board.board1.model.Board1Bean;
import board.board1.model.Board1Dao;

@Controller
public class Board1InsertController {
	private final String command1="insertnotice.brd";
	private final String command2="insertevent.brd";
	private String getPage1="board1/noticeInsertForm";
	private String getPage2="board1/eventInsertForm";
	private String gotoPage1="redirect:/noticelist.brd";
	private String gotoPage2="redirect:/eventlist.brd";
	
	
	@Autowired
	Board1Dao bdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command1,method = RequestMethod.GET)
	public String insertnotice() {
		return getPage1;
	}
	
	@RequestMapping(value=command2,method = RequestMethod.GET)
	public String insertevent() {
		return getPage2;
	}
	
	@RequestMapping(value=command1,method = RequestMethod.POST)
	public String insertnotice(@ModelAttribute("board1") Board1Bean bb) {
		bdao.insertNotice(bb);
		return gotoPage1;
	}
	
	@RequestMapping(value=command2,method = RequestMethod.POST)
	public String insertevent(@ModelAttribute("board1") Board1Bean bb) {
		
		//이미지file처리
		MultipartFile multi = bb.getUpload();
		MultipartFile multi1 = bb.getUploadthumbnail();
		bdao.insert(bb);
		
		String uploadPath = servletContext.getRealPath("/resources/images/event");
		System.out.println("uploadPath: "+uploadPath);
		
		File file = new File(uploadPath+"/"+multi.getOriginalFilename());
		File file1 = new File(uploadPath+"/"+multi1.getOriginalFilename());
		try {
			multi.transferTo(file);
			multi1.transferTo(file1);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return gotoPage2;
	}
}
