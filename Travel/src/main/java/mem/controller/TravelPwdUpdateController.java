package mem.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import login.model.TravelUserBean;
import mem.model.TravelMemberBean;
import mem.model.TravelMemberDao;

@Controller
public class TravelPwdUpdateController {
	private final String command = "pwdUpdate.mem"; 
	private String getPage = "memberPwdUpdate";
	private String gotoPage = "redirect:/logout.log";
	@Autowired
	TravelMemberDao tmdao;
	
	//pwd_update.mem >> memberPwdUpdate.jsp
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String pwdUpdate() {
		
		return getPage;
	}
	
	//memberPwdUpdate.jsp >> logout.jsp
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String pwdUpdate(@RequestParam String pwd,
			@RequestParam String pwd_update,
			HttpSession session
			) throws IOException {
		TravelUserBean tubean = (TravelUserBean) session.getAttribute("userInfo");
		System.out.println("tmbean"+ tubean);
		System.out.println("pwd"+ pwd);
		System.out.println("pwd_update"+ pwd_update);
		
		//비밀번호 변경
		tubean.setPwd(pwd_update);
		tmdao.updateMemPwd(tubean);
		
		//로그아웃
		return gotoPage;
	}
}
