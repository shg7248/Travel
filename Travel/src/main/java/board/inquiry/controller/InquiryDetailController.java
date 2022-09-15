package board.inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.inquiry.model.InquiryBean;
import board.inquiry.model.InquiryDao;

@Controller
public class InquiryDetailController {
	private final String command="inqdetail.brd";
	private String getPage="inquiry/inquiryDetail";
	
	@Autowired
	InquiryDao idao;
	
	@RequestMapping(value=command)
	public String inquirydetail(Model model,@RequestParam("inum") String inum) {
		InquiryBean ib = idao.getInquiryByInum(inum);
		model.addAttribute("ib",ib);
		return getPage;
	}
}
