package cafe.apenny.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cafe.apenny.service.CartService;
import cafe.apenny.service.OrderService;
import jakarta.servlet.http.HttpServletRequest;

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
	
	@GetMapping("/findMembership")
	public String findMembership() {
		
		return "order/findMembership";
		
	}
	
	
	@PostMapping("/updateTel2")
	public String updateTel2(
			@RequestParam("tel2Value") String tel2Value,
			Model model) {
		
		// System.out.println("tel2Value : " + tel2Value);
		model.addAttribute("tel2Value", tel2Value);
		
		return "order/findMembership";
	}
	
	
	@PostMapping("/findMember")
	public String findMember(
			@RequestParam("tel2Value") String tel2Value,
			Model model) {
				
		System.out.println("tel2Value : " + tel2Value);
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		if(tel2Value != null) {
			paramMap.put("tel2", tel2Value);
			paramMap.put("rfcursor", null);
			os.getMember(paramMap);
			System.out.println("rfcursor : " + paramMap.get("rfcursor"));
			model.addAttribute("membership", paramMap.get("rfcursor"));
		}else {
			model.addAttribute("message", "회원 정보가 없습니다.");
		}
		
		return "order/findMembership";
		
	}
	
	
	

}
