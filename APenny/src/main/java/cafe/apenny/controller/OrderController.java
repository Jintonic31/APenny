package cafe.apenny.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import cafe.apenny.service.CartService;
import cafe.apenny.service.OrderService;

@Controller
public class OrderController {
	
	@Autowired
	OrderService os;
	
	@Autowired
	CartService cs;
	
	
	@GetMapping("/orderCheck")
	public ModelAndView orderCheck() {
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rfcursor", null);
		paramMap.put("rfcursor3", null);
		os.getPayOption(paramMap);
		cs.getCartList(paramMap);
		
		int totalPrice = (Integer) paramMap.get("totalPrice");
		int totalQty = (Integer) paramMap.get("totalQty");
		
		mav.addObject("payOption", paramMap.get("rfcursor"));
		mav.addObject("cartList", paramMap.get("rfcursor3"));
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("totalQty", totalQty);
		
		mav.setViewName("order/orderCheck");
		
		return mav;
	}
	
	

}
