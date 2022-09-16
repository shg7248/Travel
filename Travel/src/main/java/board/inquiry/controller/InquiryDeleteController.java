package board.inquiry.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.inquiry.model.InquiryBean;
import board.inquiry.model.InquiryDao;

@Controller
public class InquiryDeleteController {
	private final String command="inqdelete.brd";
	private String gotoPage="redirect:/inqlist.brd";
	
	@Autowired
	InquiryDao idao;
	
	@RequestMapping(value=command)
	public String inquirydelete(Model model,HttpSession session,@RequestParam("inum") String inum) {
		idao.deleteInquiryByInum(inum);
		return gotoPage;
	}
}