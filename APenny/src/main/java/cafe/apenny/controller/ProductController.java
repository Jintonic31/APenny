package cafe.apenny.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import cafe.apenny.service.CartService;
import cafe.apenny.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {

	@Autowired
	ProductService ps;
	
	@Autowired
	CartService cs;
	
	
	
	@GetMapping("/productList")
	public ModelAndView productList(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rfcursor", null);
		paramMap.put("rfcursor2", null);
		paramMap.put("rfcursor3", null);
		
		ps.getProduct(paramMap);
		ps.getPcategory(paramMap);
		
		mav.addObject("productList", paramMap.get("rfcursor"));
		mav.addObject("pcategoryList", paramMap.get("rfcursor2"));
		
		cs.getCartList(paramMap);
		
		mav.addObject("cartList", paramMap.get("rfcursor3"));
		int totalPrice = (Integer) paramMap.get("totalPrice");
	    int totalQty = (Integer) paramMap.get("totalQty");
		
	    mav.addObject("totalPrice", totalPrice);
	    mav.addObject("totalQty", totalQty);
	    mav.addObject("cartList", paramMap.get("rfcursor3"));
		
	    HttpSession session = request.getSession();
	    session.setAttribute("totalPrice", totalPrice);
	    // System.out.println("세션값 : " + session.getAttribute("totalPrice"));
	    
		// System.out.println("REFCUROSR : " + paramMap.get("rfcursor"));
		// System.out.println("REFCUROSR2 : " + paramMap.get("rfcursor2"));
	    // System.out.println("getCartList의 값 : " + paramMap.get("rfcursor3"));
	    
		mav.setViewName("product/productListFrm");
				
		return mav;
		
	}
	
	
	@GetMapping("/productDetail")
	public ModelAndView productDetail(@RequestParam("pseq") int pseq) {
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		// "pseq"라는 이름으로 param으로 받은 pseq를 DB로 전달
		paramMap.put("pseq", pseq);
		// 전달한 pseq를 가지고 해당 pseq의 정보를 가지고 온다
		paramMap.put("rfcursor", null);
		
		ps.getProductOne(paramMap);
		
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)paramMap.get("rfcursor");
		HashMap<String, Object> resultMap = list.get(0);
		
		mav.addObject("productVO", resultMap);
		mav.setViewName("product/productDetail");
		
		// System.out.println(resultMap);
		
		return mav;
	}
	
	
	
	
	
	
}
