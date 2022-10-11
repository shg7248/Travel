package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class MemberRegisterController {
	private final String command = "/registerForm.mem";
	private String getPage ="/memberRegisterForm";
	private String gotoPage = "redirect:/list.mem";

	@Autowired
	private MemberDao memberDao;

	
	//get:memberLoginForm.jsp 회원가입 클릭
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String registerMember() {
		
		return getPage;
	}
	
	// post:memberRegisterForm.jsp 가입하기 클릭
	@RequestMapping(value = command, method=RequestMethod.POST)
	public ModelAndView registermem(
			@ModelAttribute("member") @Valid MemberBean member,
			BindingResult  result) {

		ModelAndView mav = new ModelAndView();

		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;

		}
		
		memberDao.registerMember(member);
		mav.setViewName(gotoPage);
		
		return mav;
	}

	

}
