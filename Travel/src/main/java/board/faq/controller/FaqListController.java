package board.faq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import board.faq.model.FaqBean;
import board.faq.model.FaqDao;

@Controller
public class FaqListController {
	private final String command="faqlist.brd";
	private String getPage="faq/faqList";

	@Autowired
	FaqDao fdao;

	@RequestMapping(value=command)
	public String faqlist(Model model,
			@RequestParam(value="whatColumn",required = false) String whatColumn,
			@RequestParam(value="keyword",required = false) String keyword) {
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		List<FaqBean> lists = fdao.getAllFaqList(map);
		model.addAttribute("lists",lists);
		model.addAttribute("keyword",keyword);
		model.addAttribute("whatColumn",whatColumn);
		
		return getPage;
	}
}