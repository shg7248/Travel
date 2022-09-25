package admin.controller.Facility;

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

import admin.model.CateBean;
import admin.model.CateDao;
import admin.model.FaciBean;
import admin.model.FaciDao;
import util.Paging;

@Controller
public class FaciListController {
	public final String command ="Facilist.admin";
	public String getPage ="/FaciList";
	
	@Autowired
	FaciDao faciDao;
	
	@RequestMapping(command)
	public ModelAndView Facilist(@RequestParam(value="whatColumn",required=false) String whatColumn,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			HttpServletRequest request ) {
		
		ModelAndView mav=new ModelAndView();
		
		Map<String, String> map = new HashMap<String, String>(); 
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		int totalCount = faciDao.getTotalCount(map);
		String url=request.getContextPath()+"/"+command; 
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		
		List<FaciBean> lists = new ArrayList<FaciBean>();
		lists = faciDao.getFaciList(pageInfo,map);

		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);

		mav.setViewName(getPage);
		return mav;
		
	}
}
