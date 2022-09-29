package admin.controller.Category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.model.CateBean;
import admin.model.CateDao;

@Controller
public class CateListTotalController {
	
	public final String command ="/CatelistTotal.admin";
	
	@Autowired
	CateDao cateDao;
	
	@ResponseBody
	@RequestMapping(command)
	public List<CateBean> Catelist() {
		
		List<CateBean> lists = cateDao.getCateListTotal();
		return lists;
	}
}
