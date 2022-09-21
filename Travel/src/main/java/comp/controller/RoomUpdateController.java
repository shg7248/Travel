package comp.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import comp.model.CompDao;
import comp.model.RoomBean;

@Controller
public class RoomUpdateController {

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/comp/room/update.comp";
	private String getPage = "roomUpdateForm";
	private String gotoPage = "redirect:detail.comp";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(Model model, @RequestParam String rnum) {
		
		RoomBean rb = compDao.getRoomByRnum(rnum);
		model.addAttribute("rb", rb);
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doPostAction(Model model, RoomBean roomBean) throws IllegalStateException, IOException {
		
		String realPath = servletContext.getRealPath("/images");
		MultipartFile mf = roomBean.getUpload();
		
		if(!mf.isEmpty()) {
			roomBean.setImage(mf.getOriginalFilename());
			File file = new File(realPath, mf.getOriginalFilename());
			mf.transferTo(file);
		}
		
		compDao.updateRoom(roomBean);
		
		return gotoPage + "?rnum=" + roomBean.getRnum();
	}
}
