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
	private final String command="insert.brd";
	private String getPage="board1/insertForm";
	
	@Autowired
	Board1Dao bdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String insert() {
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String insert(@ModelAttribute("board1") @Valid Board1Bean bb,BindingResult result) {
		System.out.println(bb.getContent());
		System.out.println(bb.getSubject());
		System.out.println(bb.getType());
		
		//유효성검사이후 통과시 file처리,db입력등 진행
		if(result.hasErrors()) {
			return getPage;
		}
		
		//이미지file처리
		MultipartFile multi = bb.getUpload();
		bdao.insert(bb);
		
		String uploadPath = servletContext.getRealPath("/resources/board1");
		System.out.println("uploadPath: "+uploadPath);
		
		File file = new File(uploadPath+"/"+multi.getOriginalFilename());
		try {
			multi.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return getPage;
	}
}
