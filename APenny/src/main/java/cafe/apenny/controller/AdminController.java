package cafe.apenny.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import cafe.apenny.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;
	
	
	
	@GetMapping("/")
	public String showBanner(Model model) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rfcursor", null);
		
		as.getBanner(paramMap);
		model.addAttribute("bannerList", paramMap.get("rfcursor"));
		
		// Object imgName = paramMap.get("rfcursor");
		// System.out.println(imgName);
		
		return "index";
	}
	
	

}
