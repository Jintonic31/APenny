package cafe.apenny.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cafe.apenny.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService cs;
	
	@GetMapping("/cartInsert")
	public String cartInsert(
			@RequestParam("pseq") int pseq,
			@RequestParam("qty") int qty,
			@RequestParam("tseq") int tseq, Model model) {

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("pseq", pseq);
		paramMap.put("qty", qty);
		paramMap.put("tseq", tseq);
		
		cs.insertCart(paramMap);
		
		return "redirect:/productList";
	}
	
	
	@GetMapping("/getCartList")
	public String getCartList( Model model ) {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rfcursor", null);
		
		cs.getCartList(paramMap);
		
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)paramMap.get("rfcursor");
		
		int totalPrice = (Integer) paramMap.get("totalPrice");
	    int totalQty = (Integer) paramMap.get("totalQty");
		
//		mav.addObject("totalPrice", totalPrice);
//		// ㄴ Service에서 값을 구해 Cotroller로 전달됨
//		mav.addObject("totalQty", totalQty);
//		mav.addObject("cartList", list);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalQty", totalQty);
		model.addAttribute("cartList", list);
	    
		System.out.println("getCartList의 list : " + list);
		
//		mav.setViewName("include/footer");
		return "include/footer";
	}

	
	
	
	
}
