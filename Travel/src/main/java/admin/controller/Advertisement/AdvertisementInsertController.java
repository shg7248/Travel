package admin.controller.Advertisement;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import admin.model.AdBean;
import admin.model.AdDao;

@Controller
public class AdvertisementInsertController {
	private final String command = "insertadvertisement.admin";
	private String getPage = "AdInsertForm";
	private String gotoPage = "redirect:/advertisementlist.admin";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	AdDao adao;
	
	@RequestMapping(value = command,method = RequestMethod.GET)
	public String insertadvertisement() {
		return getPage;
	}
	
	@RequestMapping(value = command,method = RequestMethod.POST)
	public String insertadvertisement(@ModelAttribute("advertisement") AdBean ab) {
		
		//이미지file처리
		MultipartFile multi = ab.getUpload();
		adao.insertAdvertisement(ab);
		
		String uploadPath = servletContext.getRealPath("/resources/images/advertisement");
		
		File file = new File(uploadPath+"/"+multi.getOriginalFilename());
		try {
			multi.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return gotoPage;
	}
	
}
