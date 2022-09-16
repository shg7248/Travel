package shop.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import comp.model.CompDao;
import comp.model.FacBean;
import comp.model.ResionBean;
import shop.model.SearchBean;
import shop.model.SearchSort;
import shop.model.ShopDao;

@Controller
public class ShopSearchContoller {

	@Autowired
	private CompDao compDao;
	
	@Autowired
	private ShopDao shopDao;
	
	private final String command = "/shop/search/{canum}.shop";
	private final String command2 = "/shop/search/{canum}/{region}.shop";
	private String getPage = "search";
	
	@RequestMapping(value = command)
	public String doGetAction(Model model, 
								@ModelAttribute("searchBean") SearchBean searchBean,
								@PathVariable(value = "canum") String canum,
								@RequestParam(required = false) @PathVariable(value = "rcode") String rcode) {
		
		searchBean.setCanum(canum);
		if(rcode != null) {
			searchBean.setRegion(rcode);
		}
		
		String start = searchBean.getStart();
		String end = searchBean.getEnd();
		
		LocalDate date = LocalDate.now();
		model.addAttribute("start", start = start == null? formatDate(date) : start);
		LocalDate date2 = date.plusDays(1);
		model.addAttribute("end", end = end == null? formatDate(date2) : end);
		
		List<FacBean> facLists = compDao.getFacList();
		model.addAttribute("facLists", facLists);
		
		List<ResionBean> rLists = compDao.getResionList();
		model.addAttribute("rLists", rLists);
		
		searchBean.setStart(start);
		searchBean.setEnd(end);
		List<SearchBean> sLists = shopDao.search(searchBean);
		model.addAttribute("sLists", sLists);
		
		
		return getPage;
	}
	
	@RequestMapping(value = command2)
	public String doGetAction2(Model model, 
			@ModelAttribute("searchBean") SearchBean searchBean, 
			@RequestParam(required = false) String start, 
			@RequestParam(required = false) String end,
			@PathVariable(value = "canum") String canum,
			@PathVariable(value = "region") String region) {
		
			doGetAction(model, searchBean, canum, region);
			return getPage;
	}
	
	public String formatDate(LocalDate date) {
		int year = date.getYear();
		String month = String.format("%02d", date.getMonthValue());
		String day = String.format("%02d", date.getDayOfMonth());
		return year + month + day;
	}
}
