package admin.controller.Category;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.CateBean;
import admin.model.CateDao;

@Controller
public class CateUpdateController {
	
	private final String command="/Cateupdate.admin";
	private String getPage = "/CateUpdateForm";
	private String gotoPage = "redirect:/Catelist.admin";
	
	
	@Autowired
	private CateDao cateDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String Cateupdate(@RequestParam("canum") String canum,
			@RequestParam("pageNumber") String pageNumber,
			Model model) {
		
		System.out.println("Cateupdate canum:" + canum);
		
		CateBean cate= cateDao.selectcateByNum(canum);
		model.addAttribute("cate", cate);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
	}
	
	// 수정form에서 submit update.ab post요청
		
	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView updateProc(
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			@ModelAttribute("cate") @Valid CateBean cb,
							BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("result.hasErrors():"+result.hasErrors());
		
		if(result.hasErrors()) {			
			mav.addObject("pageNumber", pageNumber);
			mav.setViewName(getPage);
			return mav;
		}
		
		int cnt = cateDao.updateCate(cb);
		
		mav.setViewName(gotoPage+"?pageNumber="+pageNumber);
		
		return mav;
		
	}
	
}
