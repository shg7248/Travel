package login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
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
	
	//userLoginForm.log > userLoginForm.jsp
	@RequestMapping(method = RequestMethod.GET,value = command)
	public String userLogin(HttpSession session,HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		if(session.getAttribute("userInfo") != null) {
			System.out.println("로그인 중인 사용자");

			writer.println("<script type='text/javascript'>");
			writer.println("alert('이미 로그인 하였습니다.'); ");
			writer.println("window.history.back()");
			writer.println("</script>");
			writer.flush();
		}
		
		//이전페이지 uri
		String history = request.getHeader("Referer");
		System.out.println("history: "+history);
		
		if(history != null && !history.contains(getPage) && !history.contains("Register")) {
			request.getSession().setAttribute("history", history);
			System.out.println("전페이지 저장됨");
		}
		
		return getPage;
	}
	
	//userRegisterEnd.jsp > main.jsp
	@RequestMapping(method = RequestMethod.POST,value = command)
	public String userLogin2(TravelUserBean tubean,
			HttpServletResponse response,
			HttpSession session,
			HttpServletRequest request
			) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		//입력한 이메일과 비밀번호
		System.out.println("email:" + tubean.getEmail());
		System.out.println("password:" + tubean.getPwd());

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
			
			//비밀번호가 flatform이면 다른플랫폼 계정
			if(login.getPwd().equals("flatform")) {
				writer.println("<script type='text/javascript'>");
				writer.println("alert('"+login.getFlatform()+"계정으로 로그인해주세요.'); ");
				writer.println("</script>");
				writer.flush();
				
			}else if(tubean.getPwd().equals(login.getPwd())) {
				System.out.println("가입한 회원");
				session.setAttribute("userInfo", login);
				session.setAttribute("mnum", login.getMnum());
				session.setAttribute("email", login.getEmail());
			
				//받아온 전페이지 url
				String history = (String)request.getSession().getAttribute("history");
				System.out.println("history2: "+history);
				
				if(history != null) {
					//주소값얻기 http://loca ~ /travel
					System.out.println("sub"+history.substring(28)); 
					
					//세션 제거
					request.getSession().removeAttribute("history");
					System.out.println("history3: "+history);
					
					return "redirect:/"+history.substring(28);
				}
				
				//로그인성공시 이동할 위치
			return "redirect:/";
				
			}else { // 비번이 일치하지 않을 때
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
		public String ownerLogin(HttpSession session,HttpServletResponse response) throws IOException {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			
			if(session.getAttribute("loginInfo") != null) {
				System.out.println("로그인 중인 사업자");

				writer.println("<script type='text/javascript'>");
				writer.println("alert('이미 로그인 하였습니다.'); ");
				writer.println("window.history.back()");
				writer.println("</script>");
				writer.flush();
			}
			
			return getPage2;
		}
		
		//ownerRegisterEnd.jsp > main.jsp
		@RequestMapping(method = RequestMethod.POST,value = command2)
		public String ownerLogin(TravelCompanyBean tcbean,
				HttpServletResponse response,
				HttpSession session) throws IOException {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = response.getWriter();
			
			//입력한 이메일과 비밀번호
			System.out.println("email:" + tcbean.getEmail());
			System.out.println("password:" + tcbean.getPwd());

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
					System.out.println("tcbean.getApproyn() : " + tcbean.getApproyn());
					if(login.getApproyn()==0) {
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
					return "redirect:comp/accom/detail.comp";
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
