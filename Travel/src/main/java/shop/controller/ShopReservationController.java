package shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import shop.model.OrdersBean;
import shop.model.ReserveBean;
import shop.model.ShopDao;
import shop.model.ShopOrderDao;

@Controller
public class ShopReservationController {

	@Autowired
	private ShopOrderDao shopOrderDao;
	
	@Autowired
	private ShopDao shopDao;
	
	private final String command = "/reserve.shop";
	private String getPage = "reservationForm";
	private String gotoPage = "";
	
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String doGetAction(@ModelAttribute("rnum") String rnum, @ModelAttribute("startDate") String startDate, @ModelAttribute("endDate") String endDate, Model model) {
		
		ReserveBean reserveBean = new ReserveBean();
		reserveBean.setRnum(rnum);
		reserveBean.setStartDate(startDate);
		reserveBean.setEndDate(endDate);
		
		ReserveBean rb = shopDao.getReserveInfoByRnum(reserveBean);
		model.addAttribute("rb", rb);
		
		// 없어도 될듯
		String hashKey = shopOrderDao.setOrder(reserveBean);
		model.addAttribute("hashKey", hashKey);
		
		return getPage;
	}
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String doPostAction(OrdersBean ordersBean) {
		
		int cnt = shopDao.insertOrders(ordersBean);
		
		return gotoPage;
	}
}
