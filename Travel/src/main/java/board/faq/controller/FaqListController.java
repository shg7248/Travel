package board.faq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.faq.model.FaqBean;
import board.faq.model.FaqDao;

@Controller
public class FaqListController {
	private final String command="faqlist.brd";
	private String getPage="faq/faqList";

	@Autowired
	FaqDao fdao;

	@RequestMapping(value=command)
	public String faqlist(Model model) {
		List<FaqBean> lists = fdao.getAllFaqList();
		model.addAttribute("lists",lists);
		
		return getPage;
	}
}