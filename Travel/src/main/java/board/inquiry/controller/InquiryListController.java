package board.inquiry.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Util.Paging;
import board.inquiry.model.InquiryBean;
import board.inquiry.model.InquiryDao;

@Controller
public class InquiryListController {
	private final String command="inqlist.brd";
	private String getPage="inquiry/inquiryList";
	
	@Autowired
	InquiryDao idao;
	
	@RequestMapping(value=command)
	public String inquirylist(Model model,HttpSession session,HttpServletRequest request,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		String email =String.valueOf(session.getAttribute("email"));
		String url = request.getContextPath() + "/"+command;
		
		if(email.equals("admin")) {
			int totalCount = idao.getTotalCount();
			Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, null, null, null);
			List<InquiryBean> lists = idao.getAllInquiryList(pageInfo);
			model.addAttribute("lists",lists);
			model.addAttribute("pageInfo",pageInfo);
		}else {
				int totalCount = idao.getTotalInquiryListByMemberEmailCount(email);
				Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, null, null, null);
				List<InquiryBean> lists = idao.getAllInquiryListByMemberEmail(email,pageInfo);	
				model.addAttribute("lists",lists);
				model.addAttribute("pageInfo",pageInfo);
		}
		return getPage;
	}
}