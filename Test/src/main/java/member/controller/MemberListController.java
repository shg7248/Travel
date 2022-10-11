package member.controller;

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

import member.model.MemberBean;
import member.model.MemberDao;
import utility.Paging;

@Controller
public class MemberListController {
	private final String command = "list.mem";
	private String getPage = "/memberList";

	@Autowired
	MemberDao memberDao;

	@RequestMapping(command)
	public ModelAndView list(
			@RequestParam(value="whatColumn",required=false) String whatColumn,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			HttpServletRequest request 	) {

		ModelAndView mav=new ModelAndView();

		Map<String, String> map = new HashMap<String, String>(); 
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		int totalCount = memberDao.getTotalCount(map);
		String url=request.getContextPath()+"/"+command; 

		Paging pageInfo = new Paging(pageNumber, null, totalCount, url, whatColumn, keyword, null);
		//내가 클릭한 페이지정보

		List<MemberBean> lists = new ArrayList<MemberBean>();
		lists = memberDao.getMemberList(pageInfo,map);

		mav.addObject("lists", lists);
		mav.addObject("pageInfo", pageInfo);

		mav.setViewName(getPage);
		return mav;
	}
}
