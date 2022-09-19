package comp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import comp.model.AccomBean;
import comp.model.CategoryBean;
import comp.model.CompDao;
import comp.model.FacBean;
import login.model.TravelCompanyBean;

@Controller
public class AccomUpdateController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/comp/accom/update.comp";
	private String getPage = "accomUpdateForm";
	private String gotoPage = "redirect:detail.comp";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(Model model, @RequestParam String anum) {
		
		// 카테고리 (숙박지 종류)
		List<CategoryBean> caLists = compDao.getCategoryList();
		model.addAttribute("caLists", caLists);
		
		// 숙박지 주변 편의시설, 객실 편의시설
		List<FacBean> fLists = compDao.getFacList();
		model.addAttribute("fLists", fLists);
		
		AccomBean ab = compDao.getAccomByAnumForUpdate(anum);
		model.addAttribute("ab", ab);
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doPostAction(HttpSession session, Model model, AccomBean accomBean) throws IllegalStateException, IOException {
				
		TravelCompanyBean tcb = (TravelCompanyBean) session.getAttribute("loginInfo");
		String cnum = tcb.getCnum();
		accomBean.setCnum(cnum);
		
		String realPath = servletContext.getRealPath("/resources/images");
		System.out.println("realPath :" + realPath);
		
		File file = new File(realPath);
		if(!file.exists())
			file.mkdir();
		
		if(accomBean.getUpload() != null) {
			MultipartFile mf = accomBean.getUpload();
			File uploadFile = new File(realPath, mf.getOriginalFilename());
			accomBean.setImage(mf.getOriginalFilename());
			mf.transferTo(uploadFile);
		}
		
		compDao.updateAccomByCnum(accomBean);
		return gotoPage;
	}
}
