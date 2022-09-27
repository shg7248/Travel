package login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TravelPhoneController {
	//user
	private final String command = "phoneAuthForm.log";
	private String getPage = "/phoneAuthForm";
	private String gotoPage = "redirect:/userRegisterForm.log";

	//company
	private final String command2 = "phoneAuthForm2.log";
	private String getPage2 = "/phoneAuthForm2";
	private String gotoPage2 = "redirect:/ownerRegisterForm.log";


	//userLoginForm.jsp >> phoneAuthForm.jsp
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String phoneUser() {
		

		return getPage;
	}

	//phoneAuthForm.jsp >> userRegisterForm.jsp
	@RequestMapping(value = command,method = RequestMethod.POST)
	public ModelAndView phoneUser2(@RequestParam(value = "phone") String phone,
			@RequestParam(required = false) String email,
			@RequestParam(required = false) String flatform) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(gotoPage);
		mav.addObject("phone", phone);
		mav.addObject("email", email);
		mav.addObject("flatform", flatform);
		
		System.out.println("phone"+ phone);
		System.out.println("email"+ email);
		System.out.println("flatform"+ flatform);

		return mav;
		
	}

	//companyLoginForm.jsp >> phoneAuthForm2.jsp
	@RequestMapping(value = command2,method = RequestMethod.GET)
	public String phoneCompany() {


		return getPage2;
	}

	//phoneAuthForm2.jsp >> companyRegisterForm.jsp
	@RequestMapping(value = command2,method = RequestMethod.POST)
	public ModelAndView phoneCompany(@RequestParam(value = "phone") String phone) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(gotoPage2);
		mav.addObject("phone", phone);
		System.out.println("phoneCompany: "+ phone);

		return mav;
	}

}
