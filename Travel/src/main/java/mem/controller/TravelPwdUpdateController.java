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
	private String gotoPage = "";
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
			HttpSession session,
			HttpServletResponse response
			) throws IOException {
		TravelUserBean tubean = (TravelUserBean) session.getAttribute("loginInfo");
		System.out.println("tmbean"+ tubean);
		System.out.println("pwd"+ pwd);
		System.out.println("pwd_update"+ pwd_update);
		
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		if(tubean == null) {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('회원정보가 없습니다.'); ");
			writer.println("</script>");
			writer.flush();
			return getPage;
		}
		
		//입력한pwd와 내pwd비교
		if(!pwd.equals(tubean.getPwd())) {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('비밀번호가 일치하지 않습니다.'); ");
			writer.println("</script>");
			writer.flush();
			
			return getPage;
		}
		TravelMemberBean tmbean = new TravelMemberBean();
		tmbean.setEmail(tubean.getEmail());
		tmbean.setPwd(pwd_update);
		//비밀번호 변경
		tmdao.updateMemPwd(tmbean);
		
		//로그아웃
		return getPage;
	}
}
