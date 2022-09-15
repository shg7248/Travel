package shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import shop.model.OrdersBean;
import shop.model.DetailBean;
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
	private String gotoPage = "";
	
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
	public String doPostAction(OrdersBean ordersBean) {
		
		int cnt = shopDao.insertOrders(ordersBean);
		
		return gotoPage;
	}
}