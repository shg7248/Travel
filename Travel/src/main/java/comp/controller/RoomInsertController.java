package comp.controller;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import comp.model.CompDao;
import comp.model.RoomBean;

@Controller
public class RoomInsertController {

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/2/roomInsert.comp";
	private String getPage = "roomInsertForm";
	private String gotoPage = "redirect:roomMain.comp";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction() {
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doPostAction(RoomBean roomBean) {
		
		String anum = servletContext.getInitParameter("anum");
		roomBean.setAnum(Integer.parseInt(anum));
		
		MultipartFile mf = roomBean.getUpload();
		roomBean.setImage(mf.getOriginalFilename());
		
		int cnt = compDao.insertRoom(roomBean);
		
		return gotoPage;
	}
}
