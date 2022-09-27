package admin.controller.Advertisement;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdBean;
import admin.model.AdDao;

@Controller
public class AdvertisementDeleteController {
	private final String command="deleteadvertisement.admin";
	private String gotoPage="redirect:/advertisementlist.admin";
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	AdDao adao;
	
	@RequestMapping(value=command)
	public String deleteadvertisement(@RequestParam("adnum") String adnum) {
		AdBean ab = adao.getAdvertisementByAdnum(adnum);
		
		String deletePath = servletContext.getRealPath("/resources/images/advertisement");
		File delFile = new File(deletePath+"/"+ab.getAdimage());
		delFile.delete();
		
		adao.deleteAdvertisementByNnum(adnum);
		return gotoPage;
	}
	
}
