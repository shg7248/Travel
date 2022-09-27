package mem.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.model.TravelUserBean;
import mem.model.TravelMemberDao;
import shop.model.PointBean;
import util.Paging;

@Controller
public class TravelMemberPointListController {
	private final String command = "/memberPoint.mem";
	private String getPage = "memberPointList";
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	TravelMemberDao tmdao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String memberInfo(Model model, HttpSession session, @ModelAttribute(value = "pageNumber") String pageNumber) {
		
		//사용자 정보
		TravelUserBean userInfo = (TravelUserBean) session.getAttribute("userInfo");
		int mnum = userInfo.getMnum();
		
		String url = servletContext.getContextPath() + command;
		
		int totalCount = tmdao.getMemberPointTotalCountByMnum(mnum);
		
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, null, null, null);
		
		List<PointBean> pointBean = tmdao.getMemberPointListByMnum(pageInfo, mnum);
		model.addAttribute("pointBean", pointBean);
		model.addAttribute("pageInfo", pageInfo);
		
		return getPage;
	}
}
