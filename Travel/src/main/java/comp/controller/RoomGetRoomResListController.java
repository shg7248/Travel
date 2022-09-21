package comp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import comp.model.CompDao;
import shop.model.OrdersBean;

@Controller
public class RoomGetRoomResListController {
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private CompDao compDao;
	
	private final String command = "/getRoomResList.comp";
	
	@ResponseBody
	@RequestMapping(value = command, method = RequestMethod.POST)
	public List<OrdersBean> doGetAction(Model model, HttpSession session, @RequestBody Map<String, Object> param) {
		
		String rnum = String.valueOf(param.get("rnum"));
		System.out.println("rnum : " + rnum);
		
		List<OrdersBean> lists = compDao.getOrderListByRnum(rnum);
		
		return lists;
	}
}
