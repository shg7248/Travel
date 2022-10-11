package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberLoginController {
	private final String command = "/loginForm.mem";
	private String getPage = "/memberLoginForm";

	@Autowired
	MemberDao memberDao;

	//get : 상품추가하기=>ProductInsertController
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String login() {
		return getPage;
	}

	//post : memberLoginForm.jsp 로그인
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String login(MemberBean member, 
			HttpServletResponse response,
			HttpSession session) throws IOException { //setId, setPassword

		response.setContentType("text/html; charset=UTF-8");

		System.out.println("id:" + member.getId());
		System.out.println("password:" + member.getPassword());
		PrintWriter writer = response.getWriter();

		MemberBean login = memberDao.getMember(member.getId());
		if(login == null) {
			System.out.println("가입하지 않은 회원");

			writer.println("<script type='text/javascript'>");
			writer.println("alert('가입하지 않은 회원입니다'); ");
			writer.println("</script>");
			writer.flush();
			
			return getPage;
		}
		
		else { // 일치하는 아이디 존재
			if(member.getPassword().equals(login.getPassword())) {
				System.out.println("가입한 회원");
				session.setAttribute("loginInfo", login);
				
				String destination = (String)session.getAttribute("destination");
				// "redirect:/insert.prd"
				// "redirect:/detail.prd?num="+product.getNum()+"&pageNumber="+pageNumber
				return destination; // return "redirect:/insert.prd"
			}
			else { // 비번이 일치하지 않을 때
				writer.println("<script type='text/javascript'>");
				writer.println("alert('비번이 일치하지 않습니다.'); ");
				writer.println("</script>");
				writer.flush();
				return getPage;
			}
		}
		
	}
}
