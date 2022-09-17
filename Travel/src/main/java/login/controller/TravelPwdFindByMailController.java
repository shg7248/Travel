package login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import login.model.TravelCompanyBean;
import login.model.TravelCompanyDao;

@Controller
public class TravelPwdFindByMailController {
	private final String command="ownerFindPwd.log";
	private String getPage="/ownerFindPwdForm";
	private String gotoPage="redirect:/checkVcode.log";
	
	@Autowired
	TravelCompanyDao tcdao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//ownerPwdForm.jsp > codeCheck.jsp
	@RequestMapping(value = command)
	public String sendVcode(@RequestParam("ownerEmail1") String ownerEmail1,
								@RequestParam("ownerEmail2") String ownerEmail2,
								HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		System.out.println("mailcontroller를 거쳐갔는가");
		String ownerEmail = ownerEmail1+ownerEmail2;
		System.out.println(ownerEmail);

		TravelCompanyBean tcb = tcdao.getMember(ownerEmail);
		
//		System.out.println("TravelCompanyBean서가져온값: "+tcb.getEmail());
		if(tcb != null) {
			if(ownerEmail.equals(tcb.getEmail())) {
				//0~9까지 랜덤숫자 6개 생성 verification_code = Vcode
				String vcode ="";
				for(int i =0;i<6;i++) {
					vcode += (int)(Math.random()*10);
				}
//				System.out.println("Vcode의 갯수:"+vcode.length());
//				System.out.println("Vcode:"+vcode);
				try {
					
					MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					
					messageHelper.setFrom("admin"); 						// 보내는사람 이메일 여기선 google 메일서버 사용하는 아이디를 작성하면됨
					messageHelper.setTo(tcb.getEmail());					// 받는사람 이메일
					messageHelper.setSubject("비밀번호 찾기를 위한 인증번호를 발송했습니다." );	// 메일제목
					messageHelper.setText(
							"text/html","비밀번호 찾기에 관한 인증 번호는 다음과 같습니다.<br><hr>"
									+ "<br>"+vcode+"<br><hr><br>");
					//메일보내기
					mailSender.send(mimeMessage);
				} catch (MessagingException e) {
					System.out.println("메일 발송 실패");
				}
				
				session.setAttribute("vcode", vcode);
				session.setAttribute("ownerEmail",ownerEmail);
				return gotoPage;
			}
		}
		writer.println("<script type='text/javascript'>");
		writer.println("alert('해당하는 이메일의 회원이 없습니다.'); ");
		writer.println("</script>");
		writer.flush();
		return getPage;
	}
}
