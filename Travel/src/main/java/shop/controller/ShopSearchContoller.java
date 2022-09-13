package shop.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	private final String command = "/shop/search.shop";
	private String getPage = "search";
	
	@RequestMapping(value = command)
	public String doGetAction(Model model, @ModelAttribute("searchBean") SearchBean searchBean, @RequestParam(required = false) String start, @RequestParam(required = false) String end) {
	
		
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
		
		System.out.println(searchBean.getSort());
		
		return getPage;
	}
	
	public String formatDate(LocalDate date) {
		int year = date.getYear();
		String month = String.format("%02d", date.getMonthValue());
		String day = String.format("%02d", date.getDayOfMonth());
		return year + month + day;
	}
}
