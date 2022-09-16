package login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import login.model.TravelUserDao;
import login.model.TravelCompanyBean;
import login.model.TravelCompanyDao;
import login.model.TravelUserBean;

@Controller
public class TravelLoginController {
	private final String command = "userLoginForm.log";
	private String getPage = "userLoginForm";
	
	private final String command2 = "ownerLoginForm.log";
	private String getPage2 = "ownerLoginForm";
	
	@Autowired
	TravelUserDao tudao;
	@Autowired
	TravelCompanyDao tcdao;
	
	//selectLogin.log > selectLogin.jsp
	@RequestMapping(method = RequestMethod.GET,value = "selectLogin.log")
	public String selectLogin() {
		
		return "selectLogin";
	}
	//userLoginForm.log > userLoginForm.jsp
	@RequestMapping(method = RequestMethod.GET,value = command)
	public String userLogin() {
		
		return getPage;
	}
	
	//userRegisterEnd.jsp > main.jsp
	@RequestMapping(method = RequestMethod.POST,value = command)
	public String userLogin2(TravelUserBean tubean,
			HttpServletResponse response,
			HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		//입력한 이메일과 비밀번호
		System.out.println("email:" + tubean.getEmail());
		System.out.println("password:" + tubean.getPwd());
		PrintWriter writer = response.getWriter();

		//한계정 로그인 정보
		TravelUserBean login = tudao.getMember(tubean.getEmail());
		
		if(login == null) {
			System.out.println("가입하지 않은 회원");

				writer.println("<script type='text/javascript'>");
				writer.println("alert('가입하지 않은 회원입니다'); ");
				writer.println("</script>");
				writer.flush();
		}
		else {// 일치하는 아이디 존재
			System.out.println("login.getPwd(): " + login.getPwd());
			if(tubean.getPwd().equals(login.getPwd())) {
				System.out.println("가입한 회원");
				session.setAttribute("userInfo", login);
				session.setAttribute("mnum", login.getMnum());
				session.setAttribute("email", login.getEmail());
			
				//로그인성공시 이동할 위치
			return "redirect:/";
				
			}
			else { // 비번이 일치하지 않을 때
				writer.println("<script type='text/javascript'>");
				writer.println("alert('비번이 일치하지 않습니다.'); ");
				writer.println("</script>");
				writer.flush();
				return getPage;
			}
		}
		return getPage;
		
	}
	
	//ownerLoginForm.log > ownerLoginForm.jsp
		@RequestMapping(method = RequestMethod.GET,value = command2)
		public String ownerLogin() {
			
			return getPage2;
		}
		
		//ownerRegisterEnd.jsp > main.jsp
		@RequestMapping(method = RequestMethod.POST,value = command2)
		public String ownerLogin(TravelCompanyBean tcbean,
				HttpServletResponse response,
				HttpSession session) throws IOException {
			response.setContentType("text/html; charset=UTF-8");
			//입력한 이메일과 비밀번호
			System.out.println("email:" + tcbean.getEmail());
			System.out.println("password:" + tcbean.getPwd());
			PrintWriter writer = response.getWriter();

			//한계정 로그인 정보
			TravelCompanyBean login = tcdao.getMember(tcbean.getEmail());
			
			if(login == null) {
				System.out.println("가입하지 않은 회원");

					writer.println("<script type='text/javascript'>");
					writer.println("alert('가입하지 않은 회원입니다'); ");
					writer.println("</script>");
					writer.flush();
			}
			else {// 일치하는 아이디 존재
				System.out.println("login.getPwd(): " + login.getPwd());
				if(tcbean.getPwd().equals(login.getPwd())) {
					//가입승인이 안낫을때.
					
					if(tcbean.getApproyn()==10) {
						System.out.println("가입승인이 안난 회원");

						writer.println("<script type='text/javascript'>");
						writer.println("alert('가입승인이 나지않았습니다.'); ");
						writer.println("</script>");
						writer.flush();
					}else {
						System.out.println("가입한 회원");
						System.out.println("cnum : " + login.getCnum());
						session.setAttribute("loginInfo", login);
						session.setAttribute("cnum", login.getCnum());
						session.setAttribute("email", login.getEmail());
						
						//로그인성공시 이동할 위치
					return "redirect:/compMain.comp";
					}
					
				}
				else { // 비번이 일치하지 않을 때
					writer.println("<script type='text/javascript'>");
					writer.println("alert('비번이 일치하지 않습니다.'); ");
					writer.println("</script>");
					writer.flush();
					return getPage2;
				}
			}
			return getPage2;
		}
}
