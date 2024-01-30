package cafe.apenny.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import cafe.apenny.service.ProductService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ProductController {

	@Autowired
	ProductService ps;
	
	
	@GetMapping("/")
	public String main() {
		return "index";
	}
	
	
	@GetMapping("/productList")
	public ModelAndView productList(
			HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rfcursor", null);
		paramMap.put("rfcursor2", null);
		
		ps.getProduct(paramMap);
		ps.getPcategory(paramMap);
		
		mav.addObject("productList", paramMap.get("rfcursor"));
		mav.addObject("pcategoryList", paramMap.get("rfcurosr2"));
		
		mav.setViewName("product/productListFrm");
		
		System.out.println("REFCUROSR : " + paramMap.get("rfcursor"));
		System.out.println("REFCUROSR2 : " + paramMap.get("rfcursor2"));
		
		return mav;
		
	}
	
}
