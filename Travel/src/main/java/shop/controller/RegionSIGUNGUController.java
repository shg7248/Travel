package shop.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import comp.model.CompDao;
import comp.model.ResionBean;

@Controller
public class RegionSIGUNGUController {

	@Autowired
	private CompDao compDao;
	
	private final String command = "/getSIGUNGU.shop";
	
	@ResponseBody
	@RequestMapping(value = command, method = RequestMethod.POST)
	public List<ResionBean> doGetAction(@RequestBody Map<String, Object> param) {
		
		String rcode = String.valueOf(param.get("rcode"));
		System.out.println(rcode);
		List<ResionBean> roomBean = compDao.GetResionSIGUNGUList(rcode);
		
		return roomBean;
	}
}
