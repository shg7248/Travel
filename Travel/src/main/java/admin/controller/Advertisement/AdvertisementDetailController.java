package admin.controller.Advertisement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdBean;
import admin.model.AdDao;

@Controller
public class AdvertisementDetailController {
	private final String command="advertisementdetail.admin";
	private String getPage="AdDetail";
	
	@Autowired
	AdDao adao;
	
	@RequestMapping(value=command)
	public String eventdetail(Model model,@RequestParam("adnum") String adnum,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		AdBean ab = adao.getAdvertisementByAdnum(adnum);
		model.addAttribute("ab",ab);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}
}
