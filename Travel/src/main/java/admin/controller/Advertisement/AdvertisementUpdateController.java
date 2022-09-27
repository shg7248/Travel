package admin.controller.Advertisement;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import admin.model.AdBean;
import admin.model.AdDao;

@Controller
public class AdvertisementUpdateController {
	private final String command="updateadvertisement.admin";
	private String getPage="AdUpdateForm";
	private String gotoPage="redirect:/advertisementlist.admin";
	
	@Autowired
	AdDao adao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value=command,method = RequestMethod.GET)
	public String updateadvertisement(Model model,@RequestParam("adnum") String adnum,
			@RequestParam(value="pageNumber",required = false) String pageNumber) {
		AdBean ab = adao.getAdvertisementByAdnum(adnum);
		model.addAttribute("ab",ab);
		model.addAttribute("pageNumber",pageNumber);
		return getPage;
	}
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public String updateadvertisement(Model model,@RequestParam("adnum") String adnum,
			@RequestParam("originalContent") String originalContent,
			@ModelAttribute("advertisement") AdBean ab,@RequestParam(value="pageNumber",required = false) String pageNumber) {
		
		//기존 이미지 삭제
		String originalPath = servletContext.getRealPath("/resources/images/advertisement/")+originalContent;
		File file = new File(originalPath);
		file.delete();
		
		//새로운 이미지 등록
		MultipartFile multi = ab.getUpload();
		String newPath = servletContext.getRealPath("/resources/images/advertisement/")+ab.getAdimage(); //업로드 위치 설정
		File file2 = new File(newPath);
		
		try {
			multi.transferTo(file2);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		adao.updateAdvertisementByNnum(ab);
		model.addAttribute("pageNumber",pageNumber);
		return gotoPage;
	}
	
}
