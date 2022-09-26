package mem.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import login.model.TravelUserBean;
import mem.model.TravelMemberDao;

@Controller
public class TravelConfirmController {
	private final String command = "confirm.mem";
	private String getPage = "memberConfirmPwd";
	private String gotoPage = "../main";
	
	@Autowired
	TravelMemberDao tmdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String confirm() {
		
		return getPage;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String confirm(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws IOException {
		
		TravelUserBean userInfo = (TravelUserBean) session.getAttribute("userInfo");
		
		//해당맴버삭제
		tmdao.deleteMember(userInfo.getMnum());
		
		//세션없애기
		session.invalidate();
		
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.println("<script type='text/javascript'>");
		writer.println("alert('회원탈퇴가 완료되었습니다.'); ");
		writer.println("location.href='"+request.getContextPath()+"'");
		writer.println("</script>");
		writer.flush();
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajax.mem" ,method = RequestMethod.POST)
	public String ajaxConfirm(String pwd, HttpSession session) {
		
		System.out.println("pwd"+pwd);
		
		TravelUserBean userInfo = (TravelUserBean) session.getAttribute("userInfo");
		String checkPwd = userInfo.getPwd();
		
		//입력한 pwd공백
		if(pwd == "") {
			return "null";
		}else {
			//입력한pwd와 내pwd확인
			if(checkPwd.equals(pwd)) {
				return "ok";
			}else {
				return "fail";
			}
		}
	}
}
