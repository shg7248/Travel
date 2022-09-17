package login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import login.model.TravelCompanyBean;
import login.model.TravelCompanyDao;
import login.model.TravelUserDao;

@Controller
public class TravelVerificationCodeCheckController {
	private final String command="checkVcode.log";
	private String getPage1="codeCheck";
	private String getPage2="codeShow";
	
	@Autowired
	TravelUserDao tudao;
	@Autowired
	TravelCompanyDao tcdao;
	
	//codeCheck.jsp >
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String checkvcodeowner() {
		return getPage1;
	}
	
	//ownerPwdForm.jsp > CodeCheck.jsp
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String checkvcodeowner(HttpSession session,HttpServletResponse response,Model model,
			@RequestParam("inputvcode") String inputvcode) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		String vcode = (String)session.getAttribute("vcode");
		
		if(inputvcode.equals(vcode)) {
			String ownerEmail = (String)session.getAttribute("ownerEmail");
			TravelCompanyBean tcb = tcdao.getMember(ownerEmail);
			
			String myPwd = tcb.getPwd();
			model.addAttribute("myPwd",myPwd);
			
			writer.println("<script type='text/javascript'>");
			writer.println("alert('인증번호 확인이 완료되었습니다.'); ");
			writer.println("</script>");
			writer.flush();
			return getPage2;
		}
		writer.println("<script type='text/javascript'>");
		writer.println("alert('입력하신 인증번호가 일치하지 않습니다.'); ");
		writer.println("</script>");
		writer.flush();
		return getPage1;
	}
}
