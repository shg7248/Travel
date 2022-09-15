package board.inquiry.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.inquiry.model.InquiryBean;
import board.inquiry.model.InquiryDao;

@Controller
public class InquiryListController {
	private final String command="inqlist.brd";
	private String getPage="inquiry/inquiryList";
	
	@Autowired
	InquiryDao idao;
	
	@RequestMapping(value=command)
	public String noticelist(Model model,HttpSession session) {
		String email =String.valueOf(session.getAttribute("email"));
		if(email.equals("admin")) {
			List<InquiryBean> lists = idao.getAllInquiryList();
			model.addAttribute("lists",lists);
		}else {
			List<InquiryBean> lists = idao.getAllInquiryListByEmail(email);	
			model.addAttribute("lists",lists);
		}
		return getPage;
	}
}