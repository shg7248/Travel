package login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TravelLogoutController {
	private final String command = "logout.log";
	private String getPage = "redirect:/";
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String logout(HttpSession session,HttpServletResponse response) throws IOException {
		
		
		
		session.invalidate();
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script type='text/javascript'>");
		writer.println("alert('로그아웃이 완료되었습니다.'); ");
		writer.println("</script>");
		writer.flush();
		
		return "redirect:/";
	}
}
