package admin.controller.Category;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.model.CateBean;
import admin.model.CateDao;

@Controller
public class CateInsertController {
	
	private final String command = "/Cateinsert.admin";
	private final String getPage = "/CateInsertForm";
	private final String gotoPage = "redirect:/Catelist.admin";
	
	@Autowired
	private CateDao cateDao;

	@RequestMapping(value= command,method=RequestMethod.GET)
	public String insert() {
		
		return getPage;
	}

	@RequestMapping(value= command,method=RequestMethod.POST)
	public ModelAndView Cateinsert(@ModelAttribute("cate") @Valid CateBean bean, 	
							BindingResult result) {
		
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		
		int cnt = cateDao.insertCate(bean);
		System.out.print("cnt:"+cnt);
		mav.setViewName(gotoPage);
		return mav;

	}
	
}
