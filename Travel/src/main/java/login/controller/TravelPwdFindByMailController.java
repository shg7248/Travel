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
import login.model.TravelUserBean;
import login.model.TravelUserDao;

@Controller
public class TravelPwdFindByMailController {
	private final String command1="userFindPwd.log";
	private final String command2="ownerFindPwd.log";
	private String getPage1="/userFindPwdForm";
	private String getPage2="/ownerFindPwdForm";
	private String gotoPage="redirect:/checkVcode.log";
	
	@Autowired
	TravelCompanyDao tcdao;
	
	@Autowired
	TravelUserDao tudao;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//userPwdForm.jsp > codeCheck.jsp
	@RequestMapping(value = command1)
	public String sendUserVcode(@RequestParam("userEmail1") String userEmail1,
								HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		String userEmail = userEmail1;
		System.out.println(userEmail);

		TravelUserBean tub = tudao.getMember(userEmail);
		
		if(tub != null) {
			if(userEmail.equals(tub.getEmail())) {
				//0~9까지 랜덤숫자 6개 생성 verification_code = Vcode
				String vcode ="";
				for(int i =0;i<6;i++) {
					vcode += (int)(Math.random()*10);
				}
				try {
					
					MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					
					messageHelper.setFrom("admin","admin");
					messageHelper.setTo(tub.getEmail());
					messageHelper.setSubject("본인 확인을 위한 인증번호 입니다." );
					messageHelper.setText(
							"text/html",
							"	<div style=\"display: block;\r\n"
							+ "	background-color: rgb(233, 233, 233);\r\n"
							+ "	border-radius: 5px;\r\n"
							+ "	padding: 20px;\r\n"
							+ "	font-size: 16px;\">\r\n"
							+ "인증번호입니다.<br>"
							+"["+vcode+"]"
							+ "	</div>\r\n"
							+ "</div>");
					//메일보내기
					mailSender.send(mimeMessage);
					writer.println("<script type='text/javascript'>");
					writer.println("alert('인증번호를 발송하였습니다.'); ");
					writer.println("location.href='checkVcode.log'");
					writer.println("</script>");
					writer.flush();
				} catch (MessagingException e) {
					System.out.println("메일 발송 실패");
				}
				
				session.setAttribute("vcode", vcode);
				session.setAttribute("userEmail",userEmail);
				session.setAttribute("findPwdtype","user");
				return gotoPage;
			}
		}
		writer.println("<script type='text/javascript'>");
		writer.println("alert('해당하는 이메일의 회원이 없습니다.'); ");
		writer.println("</script>");
		writer.flush();
		return getPage1;
	}
	
	//ownerPwdForm.jsp > codeCheck.jsp
	@RequestMapping(value = command2)
	public String sendOwnerVcode(@RequestParam("ownerEmail1") String ownerEmail1,
			@RequestParam("ownerEmail2") String ownerEmail2,
			HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		String ownerEmail = ownerEmail1+ownerEmail2;
		System.out.println(ownerEmail);
		
		TravelCompanyBean tcb = tcdao.getMember(ownerEmail);
		
		if(tcb != null) {
			if(ownerEmail.equals(tcb.getEmail())) {
				//0~9까지 랜덤숫자 6개 생성 verification_code = Vcode
				String vcode ="";
				for(int i =0;i<6;i++) {
					vcode += (int)(Math.random()*10);
				}
				try {
					
					MimeMessage mimeMessage = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					
					messageHelper.setFrom("admin");
					messageHelper.setTo(tcb.getEmail());
					messageHelper.setSubject("비밀번호 찾기를 위한 인증번호를 발송했습니다." );
					messageHelper.setText(
							"text/html","비밀번호 찾기에 관한 인증 번호는 다음과 같습니다.<br><hr>"
									+ "<br>"+vcode+"<br><hr><br>");
					//메일보내기
					mailSender.send(mimeMessage);
					writer.println("<script type='text/javascript'>");
					writer.println("alert('인증번호를 발송하였습니다.'); ");
					writer.println("location.href='checkVcode.log'");
					writer.println("</script>");
					writer.flush();
				} catch (MessagingException e) {
					System.out.println("메일 발송 실패");
				}
				
				session.setAttribute("vcode", vcode);
				session.setAttribute("ownerEmail",ownerEmail);
				session.setAttribute("findPwdtype","owner");
				return gotoPage;
			}
		}
		writer.println("<script type='text/javascript'>");
		writer.println("alert('해당하는 이메일의 회원이 없습니다.'); ");
		writer.println("</script>");
		writer.flush();
		return getPage2;
	}
}
