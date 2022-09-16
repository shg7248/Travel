package shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.model.TravelUserBean;
import shop.model.DetailBean;
import shop.model.OrdersBean;
import shop.model.ShopDao;
import shop.model.ShopOrderDao;

@Controller
public class ShopOrderController {

	@Autowired
	private ShopOrderDao shopOrderDao;
	
	@Autowired
	private ShopDao shopDao;
	
	private final String command = "/shop/order.shop";
	private String getPage = "orderForm";
	private String gotoPage = "completeOrder";
	
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String doGetAction(@ModelAttribute("rnum") String rnum, @ModelAttribute("startDate") String startDate, @ModelAttribute("endDate") String endDate, Model model) {
		
		
		DetailBean orderBean = new DetailBean();
		orderBean.setRnum(rnum);
		orderBean.setStartDate(startDate);
		orderBean.setEndDate(endDate);
		
		DetailBean rb = shopDao.getOrderInfoByRnum(orderBean);
		model.addAttribute("rb", rb);
		
		return getPage;
	}
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String doPostAction(HttpSession session, OrdersBean ordersBean) {
		
		TravelUserBean tub = (TravelUserBean) session.getAttribute("userInfo");
		int mnum = tub.getMnum();
		
		ordersBean.setMnum(mnum);
		
		int cnt = shopDao.insertOrders(ordersBean);
		
		return gotoPage;
	}
}
