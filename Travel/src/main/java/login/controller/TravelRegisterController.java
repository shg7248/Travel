package login.controller;

import java.io.File;
import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import login.model.TravelCompanyBean;
import login.model.TravelCompanyDao;
import login.model.TravelUserBean;
import login.model.TravelUserDao;
import shop.model.PointBean;
import shop.model.ShopDao;

@Controller
public class TravelRegisterController {
	//user
	private final String command = "/userRegisterForm.log";
	private String getPage = "/userRegisterForm";
	private String gotoPage = "/userRegisterEnd";
	
	//company
	private final String command2 = "ownerRegisterForm.log";
	private String getPage2 = "/ownerRegisterForm";
	private String gotoPage2 = "/ownerRegisterEnd";
	
	private final String command3 = "/ajax.log";
	private final String command4 = "/ajax2.log";
	@Autowired
	ShopDao shopDao;
	@Autowired
	TravelUserDao tudao;
	@Autowired
	TravelCompanyDao tcdao;
	@Autowired
	ServletContext servletContext;
	
	//phoneAuthForm.jsp > userRegisterForm.jsp
	@RequestMapping(method = RequestMethod.GET,value = command)
	public ModelAndView userRegister(@RequestParam(value = "phone") String phone,
			@RequestParam(required = false) String email,
			@RequestParam(required = false) String flatform) {

		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(getPage);
		
		System.out.println("phone: "+ phone);
		System.out.println("email: "+ email);
		System.out.println("flatform: "+ flatform);
		
		return mav;
	}

	//userRegisterForm.jsp > userRegisterEnd.jsp
	@RequestMapping(method = RequestMethod.POST,value = command)
	public ModelAndView userRegister(TravelUserBean tubean,
			@RequestParam("phone") String phone,
			@RequestParam(required = false) String email
			) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("flatform: "+tubean.getFlatform());
		System.out.println("Pwd: "+tubean.getPwd());
		
		//받아온 phone 넣기
		tubean.setPhone(phone);
		
		//플랫폼 null이면 home값넣기
		if(tubean.getFlatform() == "") {
			tubean.setFlatform("home");
		}
		//pwd null이면 flatform넣기
		if(tubean.getPwd() == null) {
			tubean.setPwd("flatform");
		}
		System.out.println("변경된 비밀번호:"+tubean.getPwd());
		//user회원가입
		tudao.insert(tubean);
		
		System.out.println("mnum : " + tubean.getMnum());
		
		PointBean pointBean = new PointBean();
		pointBean.setMnum(tubean.getMnum());
		pointBean.setChargeType("회원가입");
		pointBean.setPoint(200);
		
		shopDao.insertPoint(pointBean);
		
		mav.setViewName(gotoPage);

//		PointBean pointBean = new PointBean();
//		pointBean.set
//		shopDao.insertPoint(pointBean);
		
		return mav;
	}

	//phoneAuthForm2.jsp > ownerRegisterForm.jsp
	@RequestMapping(method = RequestMethod.GET,value = command2)
	public ModelAndView ownerRegister(@RequestParam(value = "phone") String phone) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage2);
		mav.addObject("phone", phone);
		System.out.println("owner phone"+ phone);
		
		return mav;
	}

	//ownerRegisterForm.jsp > ownerRegisterEnd.jsp
	@RequestMapping(method = RequestMethod.POST,value = command2)
	public ModelAndView ownerRegister(@ModelAttribute("tcbean") @Valid TravelCompanyBean tcbean,BindingResult br) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		
		//파일명과 확장자
		System.out.println("img:" + tcbean.getImage());
		//멀티객체
		System.out.println("upload:" + tcbean.getUpload());
		
		//MultipartRequest multi =new MultipartRequest(request,uploads,5*1024*1024,"UTF-8",new DefaultFileRenamePolicy());
		
		if(br.hasErrors()){
			System.out.println("err");
			mav.setViewName(getPage2);
			return mav;
		}
		
		//파일의 저장경로
		String uploadPath = servletContext.getRealPath("/resources/images/company");
		System.out.println("uploadPath:"+uploadPath);
		
		File existsFile = new File(uploadPath);
		if(!existsFile.exists()) {
			existsFile.mkdir();
		}
		
		//파일객체
		File file = new File(uploadPath+"/"+ tcbean.getImage());
		
		//파일 저장
		tcbean.getUpload().transferTo(file);
		
		//user회원가입
		tcdao.insert(tcbean);
		
		mav.setViewName(gotoPage2);

		return mav;
	}
	
	
	//ajax
	@ResponseBody
	@RequestMapping(value = command3 ,method = RequestMethod.POST)
	public String ajaxUser(String email) {
		System.out.println("email"+email);
		String rex = "^(.+)@(.+)$"; // 이메일 형식인지
		
		if(email == "") {
			return "null";
		}

		if(Pattern.matches(rex, email)) {
			int cnt = tudao.emailCheck(email);
			if(cnt > 0 ) {
				return "fail";
			}else {
				return "ok";
			}
		}else {
			return "no";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = command4 ,method = RequestMethod.POST)
	public String ajaxCompany(String email) {
		System.out.println("email"+email);
		String rex = "^(.+)@(.+)$"; // 이메일 형식인지
		
		if(email == "") {
			return "null";
		}

		if(Pattern.matches(rex, email)) {
			int cnt = tcdao.emailCheck(email);
			if(cnt > 0 ) {
				return "fail";
			}else {
				return "ok";
			}
		}else {
			return "no";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/ajax3.log" ,method = RequestMethod.POST)
	public String ajaxCompanyCnum(String cnum) {
		System.out.println("cnum"+cnum);
		if(cnum.length()>12) {
			return "leng";
		}
		int cnt = tcdao.cnumCheck(cnum);
		if(cnum == "") {
			return "null";
		}else if(cnt > 0 ) {
			return "fail";
		}else {
			return "ok";
		}
	}
	
}
