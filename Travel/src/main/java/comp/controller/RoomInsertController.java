package comp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import comp.model.CompDao;
import comp.model.RoomBean;
import login.model.TravelCompanyBean;

@Controller
public class RoomInsertController {

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/comp/room/insert.comp";
	private String getPage = "roomInsertForm";
	private String gotoPage = "redirect:main.comp";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction() {
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doPostAction(HttpSession session, RoomBean roomBean) throws IllegalStateException, IOException {
		
		String realPath = servletContext.getRealPath("/resources/images/room");
		
		TravelCompanyBean tcb = (TravelCompanyBean) session.getAttribute("loginInfo");
		String cnum = tcb.getCnum();
		roomBean.setCnum(cnum);
		
		MultipartFile mf = roomBean.getUpload();
		roomBean.setImage(mf.getOriginalFilename());
		
		int cnt = compDao.insertRoom(roomBean);
		
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdir();
		}
		
		File updateImage = new File(realPath, mf.getOriginalFilename());
		mf.transferTo(updateImage);
		
		
		return gotoPage;
	}
}
