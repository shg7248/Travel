package admin.controller.Advertisement;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdBean;
import admin.model.AdDao;
import util.Paging;

@Controller
public class AdvertisementListController {
	private final String command="advertisementlist.admin";
	private String getPage="AdList";
	
	@Autowired
	AdDao adao;
	
	@RequestMapping(value=command)
	public String advertisementlist(Model model,HttpServletRequest request,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		String url = request.getContextPath() + "/"+command;
		int totalCount = adao.getTotalAdvertisementCount();
		
		Paging pageInfo = new Paging(pageNumber, "5", totalCount, url, null, null, null);
		List<AdBean> lists = adao.getAdvertisementList(pageInfo);
		model.addAttribute("lists",lists);
		model.addAttribute("pageInfo",pageInfo);
		return getPage;
	}
	
}
