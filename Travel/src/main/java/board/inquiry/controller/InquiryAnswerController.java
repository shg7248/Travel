package board.inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.inquiry.model.InquiryBean;
import board.inquiry.model.InquiryDao;

@Controller
public class InquiryAnswerController {
	private final String command="inqanswer.brd";
	private String getPage="inquiry/inquiryAnswerForm";
	private String gotoPage="redirect:/inqmail.brd";
	
	@Autowired
	InquiryDao idao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String inquiryanswer(Model model,@RequestParam("inum") String inum) {
		InquiryBean ib = idao.getInquiryByInum(inum);
		model.addAttribute("ib",ib);
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String inquiryanswer(Model model,InquiryBean ib,@RequestParam("inum") String inum) {
		//답변을 하단서 달고
		idao.answer(ib);
		
		//inum을 메일발송페이지로 넘긴다
		return gotoPage+"?inum="+ib.getInum();
	}
}
