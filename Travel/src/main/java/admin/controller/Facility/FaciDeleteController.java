package admin.controller.Facility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.CateDao;
import admin.model.FaciDao;

@Controller
public class FaciDeleteController {
	
	private final String command="Facidele.admin";
	private String gotoPage="redirect:/Facilist.admin";
	
	@Autowired
	private FaciDao faciDao;
	
	@RequestMapping(command)
	public String catedele(@RequestParam("fnum") String fnum,
				 		 @RequestParam(value="pageNumber", required=false) String pageNumber,
				 		 Model model) {
		
		int result=faciDao.deleteFaci(fnum);
		System.out.println(result);
		return gotoPage+"?pageNumber="+pageNumber;
	
}
}