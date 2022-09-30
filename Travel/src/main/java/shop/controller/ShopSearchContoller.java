package shop.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CateBean;
import admin.model.CateDao;
import comp.model.CompDao;
import comp.model.FacBean;
import comp.model.ResionBean;
import shop.model.SearchBean;
import shop.model.ShopDao;

@Controller
public class ShopSearchContoller {

	@Autowired
	private CompDao compDao;
	
	@Autowired
	private ShopDao shopDao;
	
	@Autowired
	private CateDao cateDao;
	
	private String getPage = "search";
	private String getPage2 = "around";
	
	private final String command = "/shop/search/{canum}.shop";
	@RequestMapping(value = command)
	public String doGetAction(Model model, 
								@ModelAttribute("searchBean") SearchBean searchBean,
								@PathVariable(value = "canum") String canum,
								String rcode) {
		
		// 카테고리번호 넣어줌
		searchBean.setCanum(canum);
		
		// 지역번호가 null이 아닌 경우 넣어줌 (null인 경우는 카테고리를 클릭하거나 전지역을 검색하거나)
		if(rcode != null) {
			searchBean.setRcode(rcode);
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
	
	
	private final String command2 = "/shop/search/{canum}/{rcode}.shop";
	@RequestMapping(value = command2)
	public String doPostAction(Model model, 
			@ModelAttribute("searchBean") SearchBean searchBean, 
			@RequestParam(required = false) String start, 
			@RequestParam(required = false) String end,
			@PathVariable(value = "canum") String canum,
			@PathVariable(value = "rcode") String rcode) {
		
			doGetAction(model, searchBean, canum, rcode);
			return getPage;
	}
	
	// 주변검색
	private final String command3 = "/shop/around/{canum}.shop";
	@RequestMapping(value = command3)
	public String doGetAction2(	Model model, 
								HttpServletRequest request, 
								@ModelAttribute("searchBean") SearchBean searchBean,
								@PathVariable(value = "canum") String canum) {
		
		
		String start = searchBean.getStart();
		String end = searchBean.getEnd();
		
		LocalDate date = LocalDate.now();
		model.addAttribute("start", start = start == null? formatDate(date) : start);
		LocalDate date2 = date.plusDays(1);
		model.addAttribute("end", end = end == null? formatDate(date2) : end);
		
		Cookie[] cookies = request.getCookies();
		
		for(Cookie c : cookies) {
			String name = c.getName();
			String value = c.getValue();

			if(name.equals("lat") || name.equals("lng")) {
				model.addAttribute(name, value);
				
				if(name.equals("lat")) {
					searchBean.setLat(value);
				}
				if(name.equals("lng")) {
					searchBean.setLng(value);
				}
			}
		}
		
		List<FacBean> facLists = compDao.getFacList();
		model.addAttribute("facLists", facLists);
		
		List<ResionBean> rLists = compDao.getResionList();
		model.addAttribute("rLists", rLists);
		
		searchBean.setStart(start);
		searchBean.setEnd(end);
		
		List<SearchBean> sLists = shopDao.search(searchBean);
		model.addAttribute("sLists", sLists);
		
		List<CateBean> cLists = cateDao.getAroundCateList();
		model.addAttribute("cLists", cLists);
		
		return getPage2;
	}	
	
	public String formatDate(LocalDate date) {
		int year = date.getYear();
		String month = String.format("%02d", date.getMonthValue());
		String day = String.format("%02d", date.getDayOfMonth());
		return year + month + day;
	}
	
}
