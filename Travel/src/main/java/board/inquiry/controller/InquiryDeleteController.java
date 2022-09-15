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
	private String getPage="inquiry/inquiryList";
	
	@Autowired
	InquiryDao idao;
	
	@RequestMapping(value=command)
	public String noticelist(Model model,HttpSession session,@RequestParam("inum") String inum) {
		String email =String.valueOf(session.getAttribute("email"));
		
		InquiryBean ib = idao.selectMemberEmailByInum(inum);
		String email1 = ib.getEmail();
		
		if(email.equals("admin") || email.equals(email1)) {
			//idao.deleteInquiryByInum(inum);
		}
		return getPage;
	}
}