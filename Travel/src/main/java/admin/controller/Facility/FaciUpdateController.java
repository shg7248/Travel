package admin.controller.Facility;

import java.util.List;

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
import admin.model.FaciBean;
import admin.model.FaciDao;

@Controller
public class FaciUpdateController {

	private final String command="/Faciupdate.admin";
	private String getPage = "/FaciUpdateForm";
	private String gotoPage = "redirect:/Facilist.admin";
	
	
	@Autowired
	private FaciDao faciDao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String Faciupdate(@RequestParam("fno") String fno,
			@RequestParam("pageNumber") String pageNumber,
			Model model) {
		
		System.out.println("Faciupdate fno:" + fno);
		
		FaciBean faci= faciDao.selectFaciByNo(fno);
		model.addAttribute("faci", faci);
		model.addAttribute("pageNumber", pageNumber);
		
		return getPage;
		
	}
	
	
	// 수정form에서 submit update.ab post요청
		
	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView updateProc2(
			@RequestParam(value="pageNumber",required = false) String pageNumber,
			@ModelAttribute("faci") @Valid FaciBean fb,
							BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("result.hasErrors():"+result.hasErrors());
		
		if(result.hasErrors()) {			
			mav.addObject("pageNumber", pageNumber);
			mav.setViewName(getPage);
			return mav;
		}
		
		int cnt = faciDao.updateFaci(fb);
		System.out.print("cnt:"+cnt);
		mav.setViewName(gotoPage+"?pageNumber="+pageNumber);
		return mav;
		
	}
}





