package comp.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import comp.model.AccomBean;
import comp.model.CategoryBean;
import comp.model.CompDao;
import comp.model.FacBean;
import comp.model.ResionBean;

@Controller
public class AccomInsertController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/comp/accom/insert.comp";
	private String getPage = "accomInsertForm";
	private String gotoPage = "redirect:detail.comp";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doGetAction(Model model) {
		
		// 지역
		List<ResionBean> rLists = compDao.getResionList();
		model.addAttribute("rLists", rLists);
		
		// 카테고리 (숙박지 종류)
		List<CategoryBean> caLists = compDao.getCategoryList();
		model.addAttribute("caLists", caLists);
		
		// 숙박지 주변 편의시설, 객실 편의시설
		List<FacBean> fLists = compDao.getFacList();
		model.addAttribute("fLists", fLists);
		
		return getPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doPostAction(@ModelAttribute("accomBean") AccomBean accomBean) throws IllegalStateException, IOException {
		
		MultipartFile mf = accomBean.getUpload();
		accomBean.setImage(mf.getOriginalFilename());
		
		compDao.insertAccom(accomBean);
		
		String realPath = servletContext.getRealPath("/resources/images/accom");
		
		System.out.println("realPath : " + realPath);
		
		System.out.println("실제 파일 경로 : " + realPath);
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdir();
		}
		
		File file2 = new File(realPath, mf.getOriginalFilename());
		mf.transferTo(file2);
		
		return gotoPage;
	}
}
