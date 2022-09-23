package board.inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

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
	private String gotoPageInquiryList="redirect:/inqlist.brd";
	
	@Autowired
	InquiryDao idao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String inquiryanswer(Model model,@RequestParam("inum") String inum,
			@RequestParam(value="pageNumber",required = false) String pageNumber,HttpServletResponse response) throws IOException{
		InquiryBean ib = idao.getInquiryByInum(inum);
		model.addAttribute("ib",ib);
		model.addAttribute("pageNumber",pageNumber);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		//답변완료인지 확인하고
		InquiryBean ibCheck = idao.getInquiryByInum(inum);
		String progress = ibCheck.getProgress();
		if(progress.equals("답변완료")) {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('이미 답변 완료한 문의입니다.'); ");
			writer.println("location.href='inqlist.brd?pageNumber="+pageNumber+"'");
			writer.println("</script>");
			writer.flush();
			
			return gotoPageInquiryList;
		}
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String inquiryanswer(Model model,InquiryBean ib,@RequestParam("inum") String inum,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		//답변완료가 아니면 답변을 달고
		idao.answer(ib);
		//inum을 메일발송페이지로 넘긴다
		return gotoPage+"?inum="+ib.getInum()+"&pageNumber="+pageNumber;
	}
}
