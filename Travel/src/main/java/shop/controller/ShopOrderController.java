package shop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import login.model.TravelUserBean;
import mem.model.TravelAccountBean;
import mem.model.TravelMemberDao;
import shop.model.DetailBean;
import shop.model.OrdersBean;
import shop.model.PointBean;
import shop.model.ShopDao;
import shop.model.ShopOrderDao;

@Controller
public class ShopOrderController {

	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private ShopOrderDao shopOrderDao;
	
	@Autowired
	private ShopDao shopDao;
	
	@Autowired
	private TravelMemberDao tmdao;
	
	private final String command = "/shop/order.shop";
	private String getPage = "orderForm";
	private String gotoPage = "completeOrder";
	
	@RequestMapping(value = command, method=RequestMethod.GET)
	public String doGetAction(HttpServletResponse response, @ModelAttribute("rnum") String rnum, @ModelAttribute("startDate") String startDate, @ModelAttribute("endDate") String endDate, Model model,
			HttpSession session) throws IOException {
		
		String contextPath = servletContext.getContextPath();
		
		Object obj = session.getAttribute("mnum");
		if(obj == null) {
			response.sendRedirect(contextPath + "/userLoginForm.log");
		}
		
		int mnum = (Integer) obj;
		
		List<TravelAccountBean> lists = new ArrayList<TravelAccountBean>();
		lists = tmdao.accountList(mnum);
		
		DetailBean orderBean = new DetailBean();
		orderBean.setRnum(rnum);
		orderBean.setStartDate(startDate);
		orderBean.setEndDate(endDate);
		
		DetailBean rb = shopDao.getOrderInfoByRnum(orderBean);
		model.addAttribute("rb", rb);
		model.addAttribute("lists", lists);
		
		return getPage;
	}
	
	@RequestMapping(value = command, method=RequestMethod.POST)
	public String doPostAction(HttpSession session, OrdersBean ordersBean) {
		
		TravelUserBean tub = (TravelUserBean) session.getAttribute("userInfo");
		int mnum = tub.getMnum();
		ordersBean.setMnum(mnum);
		int cnt = shopDao.insertOrders(ordersBean);
		
		System.out.println("point : " + ordersBean.getPoint());
		int point = ordersBean.getPoint();
		System.out.println("totalPrice : " + ordersBean.getTotalPrice());
		int totalPrice = ordersBean.getTotalPrice();
		
		PointBean pointBean = new PointBean();
		pointBean.setMnum(mnum);
		
		// 포인트를 1이라도 사용했으면
		if(point > 0) {
			pointBean.setPoint(point * -1);
			pointBean.setChargeType("객실예약 지출");
			shopDao.insertPoint(pointBean);
		}
		
		pointBean.setPoint((int)(totalPrice * 0.01));
		pointBean.setChargeType("객실예약 획득");
		shopDao.insertPoint(pointBean);		
		
		return gotoPage;
	}
}
