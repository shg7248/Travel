package board.inquiry.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.inquiry.model.InquiryBean;
import board.inquiry.model.InquiryDao;


@Controller
public class InquiryMailController {
	private final String command="inqmail.brd";
	private String gotoPage="redirect:/inqlist.brd";
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	InquiryDao idao;

	@RequestMapping(value = command)
	public String mailSend(HttpServletRequest request,@RequestParam("inum") String inum,HttpServletResponse response,
			@RequestParam(value="pageNumber",required = false) String pageNumber) throws IOException {
		
		//inquiry테이블과 member테이블의 mnum칼럼을 가지고 member테이블의 email가져온다
		InquiryBean ib = idao.selectMemberEmailByInum(inum);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		try {

			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");

			messageHelper.setFrom("admin","admin");
			messageHelper.setTo(ib.getEmail());
			messageHelper.setSubject("문의하신 \""+ib.getSubject()+"\" 에 관한 답변입니다." );

			messageHelper.setText(
					"text/html",
					"<div style=\"width: 940px;\">\r\n"
					+ "	<div style=\"display: inline-block;\r\n"
					+ "	width: 940px;\r\n"
					+ "	background-color: #656D78;\r\n"
					+ "	color: white;\r\n"
					+ "	border-radius: 5px 5px 0px 0px;\r\n"
					+ "	padding: 20px;\r\n"
					+ "	font-size: 16px;\">\r\n"
					+ "		<pre style=\"word-wrap: break-word;\r\n"
					+ "	white-space: pre-wrap;\">[질문]<br>"
					+ib.getQuestion()+"</pre>\r\n"
					+ "	</div>\r\n"
					+ "	<div style=\"display: inline-block;\r\n"
					+ "	width: 940px;\r\n"
					+ "	background-color: rgb(233, 233, 233);\r\n"
					+ "	border-radius: 5px;\r\n"
					+ "	padding: 20px;\r\n"
					+ "	font-size: 16px;\">\r\n"
					+ "	<pre style=\"word-wrap: break-word;\r\n"
					+ "	white-space: pre-wrap;\">[답변]<br>"
					+ib.getAnswer()+"</pre>\r\n"
					+ "	</div>\r\n"
					+ "</div>");

			//메일보내기
			mailSender.send(mimeMessage);
			writer.println("<script type='text/javascript'>");
			writer.println("alert('메일을 발송하였습니다.'); ");
			writer.println("location.href='inqlist.brd?pageNumber="+pageNumber+"'");
			writer.println("</script>");
			writer.flush();
		} catch (Exception e) {
			System.out.println("메일 발송 실패");
		}
		System.out.println("답변 메일 발송 성공");
		return gotoPage;
	}
	
}