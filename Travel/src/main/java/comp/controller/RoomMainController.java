package comp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Util.Paging;
import comp.model.CompDao;
import comp.model.RoomBean;
import login.model.TravelCompanyBean;

@Controller
public class RoomMainController {

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/2/roomMain.comp";
	private String getPage = "roomMain";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(Model model, HttpSession session, @ModelAttribute("whatColumn") String whatColumn, @ModelAttribute("keyword") String keyword) {
		
		TravelCompanyBean tcb = (TravelCompanyBean) session.getAttribute("loginInfo");
		String cnum = tcb.getCnum();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%" + keyword + "%");
		map.put("cnum", cnum);
		
		int totalCount = compDao.getRoomTotalCountByCnum(map);
		
		Paging pageInfo = new Paging("1", "200", totalCount, null, whatColumn, keyword, null);
		
		List<RoomBean> lists = compDao.getRoomListByCnum(pageInfo, map);
		
		model.addAttribute("lists", lists);
		model.addAttribute("pageInfo", pageInfo);
		
		return getPage;
	}
}
