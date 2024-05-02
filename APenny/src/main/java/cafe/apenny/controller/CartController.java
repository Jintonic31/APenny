package cafe.apenny.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
//	@GetMapping("/getCartList")
//	public String getCartList( Model model ) {
//		
//		HashMap<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("rfcursor3", null);
//		
//		cs.getCartList(paramMap);
//		System.out.println("#1 CLIST 의 값 : " + paramMap.get("rfcursor3"));
//		
//		List<Map<String, Object>> cartList = (List<Map<String, Object>>) paramMap.get("rfcursor3");
//		for(Map<String, Object> oneItem : cartList) {
//			int qty = (Integer)oneItem.get("QTY");
//			int cseq = (Integer)oneItem.get("CSEQ");
//			if(qty <= 0) {
//				cs.deleteOneCart(cseq);
//			}
//		}
//		
//		cs.getCartList(paramMap);
//		System.out.println("#2 CLIST 의 값 : " + paramMap.get("rfcursor3"));
//		
//		int totalPrice = (Integer) paramMap.get("totalPrice");
//	    int totalQty = (Integer) paramMap.get("totalQty");
//		
//		model.addAttribute("totalPrice", totalPrice);
//		model.addAttribute("totalQty", totalQty);
//		model.addAttribute("cartList", paramMap.get("rfcursor3"));
//		
//		return "redirect:/productList";
//	}
	
	
	@GetMapping("/deleteAllCart")
	public String deleteAllCart() {
		
		cs.deleteAllCart();	
		
		return "redirect:/";
	}
	
	
	@PostMapping("/cartSubQty")
	public String cartSubQty(
			@RequestBody Map<String, String> data) {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
//		System.out.println("CSEQ 값 : " + data.get("cseq"));
//		System.out.println("QTY 값 : " + data.get("qty"));
		
		int cseq = Integer.parseInt(data.get("cseq"));
		int qty = Integer.parseInt(data.get("qty"));
		
		paramMap.put("cseq", cseq);
		paramMap.put("qty", qty);
		cs.cartSubQty(paramMap);
		
		return "redirect:/productList";
	}
	
	
	@PostMapping("/cartAddQty")
	public String cartAddQty(
			@RequestBody Map<String, String> data) {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
//		System.out.println("CSEQ 값 : " + data.get("cseq"));
//		System.out.println("QTY 값 : " + data.get("qty"));
		
		int cseq = Integer.parseInt(data.get("cseq"));
		int qty = Integer.parseInt(data.get("qty"));
		
		paramMap.put("cseq", cseq);
		paramMap.put("qty", qty);
		cs.cartAddQty(paramMap);
		
		return "redirect:/productList";
	}

	
	
}
