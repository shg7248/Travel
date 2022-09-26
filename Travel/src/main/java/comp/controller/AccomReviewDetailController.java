package comp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import reply.model.ReplyBean;
import reply.model.ReplyDao;

@Controller
public class AccomReviewDetailController {

	@Autowired
	private ReplyDao replyDao;
	
	private final String command = "/comp/review/detail.comp";
	private String getPage = "accomReviewDetail";
	private String gotoPage = "redirect:detail.comp";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(Model model, @RequestParam String rvnum, @ModelAttribute(value = "pageNumber") String pageNumber) {
		
		ReplyBean replyBean = replyDao.getReplyByRvnum(rvnum);
		model.addAttribute("replyBean", replyBean);
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doPostction(Model model, ReplyBean replyBean, @ModelAttribute(value = "pageNumber") String pageNumber) {
		
		int result = replyDao.updateReplyByRvnum(replyBean);
		
		return gotoPage + "?rvnum=" + replyBean.getRvnum();
	}
}
