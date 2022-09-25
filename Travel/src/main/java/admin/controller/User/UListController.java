package admin.controller.User;

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

import admin.model.MemberBean;
import admin.model.MemberDao;
import util.Paging;

@Controller
public class UListController {
	
	
	public final String command ="Ulist.admin";
	public String getPage ="/UserList";
	
	@Autowired
	MemberDao memberDao;
	
	@RequestMapping(command)
	public ModelAndView Ulist(@RequestParam(value="whatColumn",required=false) String whatColumn,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			HttpServletRequest request ) {
		
		ModelAndView  mav=new ModelAndView();

		Map<String, String> map = new HashMap<String, String>(); 
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		int totalCount = memberDao.getTotalCount(map);
		String url=request.getContextPath()+"/"+command; 
		
		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		
		List<MemberBean> lists = new ArrayList<MemberBean>();
		lists = memberDao.getMemberList(pageInfo,map);
		
		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);
		
		mav.setViewName(getPage);
		return mav;
		
	}
	
}




