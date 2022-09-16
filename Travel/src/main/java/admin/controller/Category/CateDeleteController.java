package admin.controller.Category;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.CateBean;
import admin.model.CateDao;

@Controller
public class CateDeleteController {
	private final String command="catedele.admin";
	private String gotoPage="redirect:/Catelist.admin";
	
	@Autowired
	private CateDao cateDao;
	
	@RequestMapping(command)
	public String catedele(@RequestParam("canum") String canum,
				 		 @RequestParam(value="pageNumber", required=false) String pageNumber,
				 		 Model model) {
		
		int result=cateDao.deleteCate(canum);
		System.out.println(result);
		return gotoPage+"?pageNumber="+pageNumber;
		
	}
	
}
