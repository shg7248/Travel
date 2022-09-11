package shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	private final String command = "/search.shop";
	private String getPage = "search";
	
	@RequestMapping(value = command)
	public String doGetAction(Model model, SearchBean searchBean) {
		
		List<FacBean> facLists = compDao.getFacList();
		model.addAttribute("facLists", facLists);
		
		List<ResionBean> rLists = compDao.getResionList();
		model.addAttribute("rLists", rLists);
		
		List<SearchBean> sLists = shopDao.search(searchBean);
		model.addAttribute("sLists", sLists);
		
		System.out.println(sLists.size());
		
		return getPage;
	}
}
