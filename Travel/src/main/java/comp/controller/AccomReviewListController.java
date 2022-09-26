package comp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.model.TravelCompanyBean;
import reply.model.ReplyBean;
import reply.model.ReplyDao;
import util.Paging;

@Controller
public class AccomReviewListController {

	@Autowired
	private ReplyDao replyDao;
	
	private final String command = "/comp/review/list.comp";
	private String getPage = "accomReviewList";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(HttpSession session, HttpServletRequest request, Model model, @ModelAttribute(value = "whatColumn") String whatColumn, @ModelAttribute(value = "keyword") String keyword, @ModelAttribute(value = "pageNumber") String pageNumber) {
		
		TravelCompanyBean tcb = (TravelCompanyBean) session.getAttribute("loginInfo");
		String cnum = tcb.getCnum();
		
		String url = request.getContextPath() + command;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("cnum", cnum);
		map.put("whatColumn", whatColumn);
		map.put("keyword", keyword);
		
		
		int totalCount = replyDao.getReplyTotalCountByCnum(map);
		
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword, null);
		
		List<ReplyBean> lists = replyDao.getReplyListByCnum(map, pageInfo);
		model.addAttribute("lists", lists);
		model.addAttribute("pageInfo", pageInfo);
		
		return getPage;
	}
}
