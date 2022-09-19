package login.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

//@Controller
public class LoginKaKaoCertificationContoller {

	@Autowired
	private ServletContext servletContext;
	
	private final String command = "/kakaoLogin.log";
	
	@ResponseBody
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(String code) {
		
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		
		String pwd = (String) servletContext.getInitParameter("pwd");
		System.out.println(pwd);
		
		return "코드값 : " + code;
	}
}
