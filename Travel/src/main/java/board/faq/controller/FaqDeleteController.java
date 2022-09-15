package board.faq.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.faq.model.FaqDao;

@Controller
public class FaqDeleteController {
	private final String command="faqdelete.brd";
	private String gotoPage="redirect:/faqlist.brd";
	
	@Autowired
	FaqDao fdao;
	
	@RequestMapping(value=command)
	public String faqdelete(Model model,@RequestParam("fnum") String fnum) {
		fdao.deleteFaqByInum(fnum);
		return gotoPage;
	}
}