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

	//get : ��ǰ�߰��ϱ�=>ProductInsertController
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String login() {
		return getPage;
	}

	//post : memberLoginForm.jsp �α���
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
			System.out.println("�������� ���� ȸ��");

			writer.println("<script type='text/javascript'>");
			writer.println("alert('�������� ���� ȸ���Դϴ�'); ");
			writer.println("</script>");
			writer.flush();
			
			return getPage;
		}
		
		else { // ��ġ�ϴ� ���̵� ����
			if(member.getPassword().equals(login.getPassword())) {
				System.out.println("������ ȸ��");
				session.setAttribute("loginInfo", login);
				
				String destination = (String)session.getAttribute("destination");
				// "redirect:/insert.prd"
				// "redirect:/detail.prd?num="+product.getNum()+"&pageNumber="+pageNumber
				return destination; // return "redirect:/insert.prd"
			}
			else { // ����� ��ġ���� ���� ��
				writer.println("<script type='text/javascript'>");
				writer.println("alert('����� ��ġ���� �ʽ��ϴ�.'); ");
				writer.println("</script>");
				writer.flush();
				return getPage;
			}
		}
		
	}
}
