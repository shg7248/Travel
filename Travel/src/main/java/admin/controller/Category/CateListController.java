package admin.controller.Category;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Util.Paging;
import admin.model.CateBean;
import admin.model.CateDao;

@Controller
public class CateListController {
	
	public final String command ="Catelist.admin";
	public String getPage ="/CateList";
	
	@Autowired
	CateDao cateDao;
	
	@RequestMapping(command)
	public ModelAndView Catelist(@RequestParam(value="whatColumn",required=false) String whatColumn,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			HttpServletRequest request ) {
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> map = new HashMap<String, String>(); 
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		int totalCount = cateDao.getTotalCount(map);
		String url=request.getContextPath()+"/"+command; 
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		
		List<CateBean> lists = new ArrayList<CateBean>();
		lists = cateDao.getCateList(pageInfo,map);

		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);

		mav.setViewName(getPage);
		return mav;
		
	}
	
}
