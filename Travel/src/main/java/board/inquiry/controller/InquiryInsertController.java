package board.inquiry.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.inquiry.model.InquiryBean;
import board.inquiry.model.InquiryDao;

@Controller
public class InquiryInsertController {
	private final String command="inqinsert.brd";
	private String getPage="inquiry/inquiryInsertForm";
	
	@Autowired
	InquiryDao idao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String inquiryinsert() {
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String inquiryinsert(@ModelAttribute("inquiry") @Valid InquiryBean ib,BindingResult result,HttpSession session) {
		if(result.hasErrors()) {
			return getPage;
		}
		int mnum = Integer.parseInt(String.valueOf(session.getAttribute("mnum")));
		ib.setMnum(mnum);
		idao.insertInquiry(ib);
		
		return "redirect:/inqlist.brd";
		
	}
}
