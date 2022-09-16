package admin.controller.Company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CateDao;
import admin.model.CompanyDao;

@Controller
public class HdeleController {
	
	
	private final String command="hdele.admin";
	private String gotoPage="redirect:/Hlist.admin";
	
	@Autowired
	private CompanyDao companyDao;
	
	@RequestMapping(command)
	public String hdele(@RequestParam("cnum") String cnum,
				 		 @RequestParam(value="pageNumber", required=false) String pageNumber,
				 		 Model model) {
		
		int result=companyDao.deleteHost(cnum);
		System.out.println(result);
		return gotoPage+"?pageNumber="+pageNumber;
		
	}
}
