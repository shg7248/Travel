package shop.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import reply.model.ReplyDao;

@Controller
public class ReplyDeleteController {

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private ReplyDao replyDao;
	
	private final String command = "/deleteReply.shop";
	
	@ResponseBody
	@RequestMapping(value = command, method = RequestMethod.POST)
	public void doPostAction(@RequestBody Map<String, Object> param, HttpSession session) throws IllegalStateException, IOException {
				
		String rvnum = String.valueOf(param.get("rvnum"));
		replyDao.deleteReplyByRvnum(rvnum);
	}
}
