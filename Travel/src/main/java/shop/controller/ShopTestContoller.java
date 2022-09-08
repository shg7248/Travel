package shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShopTestContoller {

	@RequestMapping(value = "/haha.shop")
	public void doGetAction() {
		
		System.out.println("잘된다");
	}
}
