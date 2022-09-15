package board.inquiry.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

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
//	----------------------------메일발송 JSP 로 이동------------------------
//	@RequestMapping(value = "/mailSend", method = RequestMethod.GET)
//	public String getMailSend() {
//		return "/mail/mailSend";
//	}
//	
	//--------------------------------메일발송-----------------------------
	//mailSend 코드
	@RequestMapping(value = command)
	public String mailSend(HttpServletRequest request,@RequestParam("inum") String inum) {
		
		//inquiry테이블과 member테이블의 mnum칼럼을 가지고 member테이블의 email가져온다
		InquiryBean ib = idao.selectMemberEmailByInum(inum);
		
		System.out.println(ib.getAnswer());
		System.out.println(ib.getEmail());
		System.out.println(ib.getSubject());
		System.out.println(ib.getQuestion());
		try {
			
			MimeMessage mimeMessage = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
 
		    //test용 메일 내용
		    messageHelper.setFrom("admin"); // 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨
		    messageHelper.setTo(ib.getEmail()); // 받는사람 이메일
		    messageHelper.setSubject("문의하신 "+ib.getSubject()+"에 관한 답변입니다." ); // 메일제목
		    
		    messageHelper.setText("text/html","문의 하신 내용인<br><hr><br><pre>"+ib.getQuestion()+"</pre><br><hr><br>에 대한 답변은 다음과 같습니다.<br><hr><br><pre>"+ib.getAnswer()
		    						+"</pre><br><hr><br> <a href=http://localhost:8080/travel/boardstart.jsp>홈페이지로 접속하여 답변 보기</a><br><br>"); // 메일 내용
//		    messageHelper.setText("예약하신 회원님은"+ request.getParameter(name) + request.getParameter(last_name) + "입니다."+" 입력한 Email은 " + request.getParameter(email) + "입니다."); // 메일 내용
//		    messageHelper.setText("text/html","<div style='border: 3px solid blue'><a href='https://www.naver.com/'>message</a></div>\n");
//		    messageHelper.setText("text/html","우측의 링크를 누르면 테스트홈으로<a href=http://localhost:8080/ex/>홈버튼</a>");
		    
		    //로그인 폼 테스트HTML ->
		    //messageHelper.setText("text/html","<html> <head> <meta name=\"viewport\" content=\"width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0\"> </head> <body> <header> <h2>Login</h2> </header> <form action=\"\" method=\"POST\"> <div class=\"input-box\"> <input id=\"username\" type=\"text\" name=\"username\" placeholder=\"아이디\"> <label for=\"username\">아이디</label> </div> <div class=\"input-box\"> <input id=\"password\" type=\"password\" name=\"password\" placeholder=\"비밀번호\"> <label for=\"password\">비밀번호</label> </div> <div id=\"forgot\">비밀번호 찾기</div> <input type=\"submit\" value=\"로그인\"> </form> </body> </html>");
		    
		    mailSender.send(mimeMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("답변 메일 발송 성공");
		return gotoPage;
	}
	
}