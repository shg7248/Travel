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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import login.model.TravelUserBean;
import login.model.TravelUserDao;
@Controller
public class TravelKakaoController {
	private final String command = "kakaoLogin.log";
	private String getPage = "userLoginForm";
	@Autowired
	TravelUserDao tudao;

	@RequestMapping(value = command,method = RequestMethod.GET)
	public ModelAndView kakaoLogin(@RequestParam String email,HttpSession session,
			HttpServletResponse response,HttpServletRequest request) throws IOException {
		//location.href='kakaoRegister.log?email='+response.kakao_account.email;
		ModelAndView mav = new ModelAndView();
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		//이메일과 플렛폼 체크
		int cnt = tudao.emailCheck(email);
		System.out.println("kakao email: " + email);
		
		//이메일이 있으면
		if (cnt == 1) {
			//플렛폼체크
			TravelUserBean login = tudao.getMember(email);
			System.out.println("login정보: " + login);
			if (login.getFlatform().equalsIgnoreCase("kakao")) {
				//카카오로 로그인
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
				}

				//로그인성공시 이동할 위치
				mav.setViewName("redirect:/"+history.substring(28));
				return mav;
			}else {
				//다른 플렛폼으로 로그인 하세요.
				System.out.println("가입한 회원 다른플렛폼");
				writer.println("<script type='text/javascript'>");
				writer.println("alert('"+login.getFlatform()+"에 가입된 계정입니다.'); ");
				writer.println("</script>");
				writer.flush();
			}

		}else {//이메일이 없으면
			//카카오로 회원가입
			
			mav.addObject("email", email);
			mav.setViewName("redirect:/phoneAuthForm.log?email="+email+"&flatform=kakao");
			return mav;
		}
		
		mav.setViewName(getPage);
		
		return mav;
	}
}
