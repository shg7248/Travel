package admin.controller.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.FaciDao;
import admin.model.MemberDao;

@Controller
public class UDeleteController {

	private final String command="Udele.admin";
	private String gotoPage="redirect:/Ulist.admin";
	
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(command)
	public String udele(@RequestParam("mnum") String mnum,
				 		 @RequestParam(value="pageNumber", required=false) String pageNumber,
				 		 Model model) {
		
		int result=memberDao.deleteMember(mnum);
		System.out.println(result);
		return gotoPage+"?pageNumber="+pageNumber;
	
	}
	
}
