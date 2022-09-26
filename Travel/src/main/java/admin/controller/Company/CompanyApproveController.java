package admin.controller.Company;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import admin.model.CompanyBean;
import admin.model.CompanyDao;
import admin.model.FaciBean;
import admin.model.FaciDao;
import util.Paging;

@Controller
public class CompanyApproveController {

	private final String command = "/Comapprove.admin";
	private final String getPage = "approve";
	private final String gotoPage = "redirect:/Hlist.admin";

	@Autowired
	CompanyDao companyDao;

	@RequestMapping(value= command,method=RequestMethod.GET)
	public String Faciapprove(@RequestParam("cnum") String cnum,Model model ) {

		CompanyBean appr = companyDao.getByNum(cnum);
		model.addAttribute("appr", appr);
		return getPage;
	}

	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView UpdateNum(@ModelAttribute("appr")
	@Valid CompanyBean cb, BindingResult result) {

		ModelAndView mav = new ModelAndView();


		if(result.hasErrors()) {
			mav.setViewName(getPage);
			return mav;
		}
		int cnt = companyDao.updateAppr(cb);
		mav.setViewName(gotoPage);
		return mav;
	}


}



