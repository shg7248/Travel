package board.faq.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import board.faq.model.FaqBean;
import board.faq.model.FaqDao;

@Controller
public class FaqInsertController {
	private final String command="faqinsert.brd";
	private String getPage="faq/faqInsertForm";
	
	@Autowired
	FaqDao fdao;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String faqinsert() {
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String faqinsert(@ModelAttribute("faq") @Valid FaqBean fb,BindingResult result) {
		System.out.println(result.hasErrors());
		if(result.hasErrors()) {
			return getPage;
		}
		fdao.insertFaq(fb);
		
		return "redirect:/faqlist.brd";
		
	}
}
