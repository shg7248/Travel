package board.faq.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.faq.model.FaqBean;
import board.faq.model.FaqDao;

@Controller
public class FaqUpdateController {
	private final String command="faqupdate.brd";
	private String getPage="faq/faqUpdateForm";
	private String gotoPage="redirect:/faqlist.brd";

	@Autowired
	FaqDao fdao;

	@RequestMapping(value=command,method = RequestMethod.GET)
	public String faqupdate(Model model,@RequestParam("fnum") String fnum) {
		FaqBean fb = fdao.getFaqByFnum(fnum);
		model.addAttribute("faq",fb);
		return getPage;
	}

	@RequestMapping(value=command,method = RequestMethod.POST)
	public String faqupdate(Model model, @RequestParam("fnum") String fnum,
			@ModelAttribute("faq") @Valid FaqBean fb,BindingResult result) {
		if(result.hasErrors()) {
			return getPage;
		}
		fdao.updateFaqByFnum(fb);
		return gotoPage;
	}
}
