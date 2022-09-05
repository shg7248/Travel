package travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TravelTestController {

	@RequestMapping(value = "*.tra", method = RequestMethod.GET)
	public String testMethod() {
		
		System.out.println("잘 뜬다");
		
		return null;
	}
}
