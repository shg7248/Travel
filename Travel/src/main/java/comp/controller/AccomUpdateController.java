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
		
		String realPath = servletContext.getRealPath("/resources/images/accom");
		System.out.println("realPath :" + realPath);
		
		File file = new File(realPath);
		
		System.out.println("111111111");
		
		if(!file.exists()) file.mkdir();
		
		System.out.println("222222222");
		
		if(!accomBean.getUpload().isEmpty()) {
			
			System.out.println("333333333");
			MultipartFile mf = accomBean.getUpload();
			System.out.println("4444444444");
			File uploadFile = new File(realPath, mf.getOriginalFilename());
			System.out.println("555555555");
			accomBean.setImage(mf.getOriginalFilename());
			System.out.println("66666666666");
			mf.transferTo(uploadFile);
			System.out.println("7777777777777");
		}
		System.out.println("88888888888888");
		
		compDao.updateAccomByCnum(accomBean);
		return gotoPage;
	}
}
