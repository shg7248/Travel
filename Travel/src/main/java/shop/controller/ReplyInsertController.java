package shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import login.model.TravelUserBean;
import reply.model.ReplyBean;
import reply.model.ReplyDao;

@Controller
public class ReplyInsertController {

	@Autowired
	private ReplyDao replyDao;
	
	private final String command = "/insertReply.shop";
	
	@ResponseBody
	@RequestMapping(value = command, method = RequestMethod.POST)
	public void doPostAction(ReplyBean replyBean, HttpSession session) {
		
		TravelUserBean tub = (TravelUserBean)session.getAttribute("userInfo");
		replyBean.setMnum(tub.getMnum());
		replyDao.insertReply(replyBean);
		
		replyDao.getReplyListByRnum(command);
	}
}
