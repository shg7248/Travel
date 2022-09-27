package shop.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import login.model.TravelUserBean;
import reply.model.ReplyBean;
import reply.model.ReplyDao;

@Controller
public class ReplyInsertController {

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private ReplyDao replyDao;
	
	private final String command = "/insertReply.shop";
	
	@ResponseBody
	@RequestMapping(value = command, method = RequestMethod.POST)
	public void doPostAction(ReplyBean replyBean, HttpSession session) throws IllegalStateException, IOException {
				
		String realPath = servletContext.getRealPath("/resources/images/reply");
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) {
			realPathFile.mkdir();
		}
		
		MultipartFile mf = replyBean.getUpload();
		String originalFilename = mf.getOriginalFilename();
		File uploadFile = new File(realPath, originalFilename);
		mf.transferTo(uploadFile);
		
		replyBean.setImage(originalFilename);
		System.out.println(realPath);
		
		TravelUserBean tub = (TravelUserBean)session.getAttribute("userInfo");
		replyBean.setMnum(tub.getMnum());
		replyDao.insertReply(replyBean);
	}
}
