package cafe.apenny.controller;

import java.util.ArrayList;
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
import jakarta.servlet.http.HttpSession;

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
	public ModelAndView findMember(
			@RequestParam("tel2Value") String tel2Value,
			HttpServletRequest request) {
				
		// System.out.println("tel2Value : " + tel2Value);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/findMembership");
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("tel2", tel2Value);
		paramMap.put("rfcursor", null);
		
		os.getMember(paramMap);
		// System.out.println("rfcursor : " + paramMap.get("rfcursor"));
		
		mav.addObject("membership", paramMap.get("rfcursor"));
		mav.addObject("message", "회원 정보가 없습니다.");
		
		// 세션에 닉네임 저장을 위한 코드
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("rfcursor");
		HttpSession session = request.getSession();
		
		// 멤버십 X (rfcursor의 값이 없을 때)
		if(list == null || list.size() == 0 ) {
			session.setAttribute("nickname", "noNickname");
			System.out.println("노닉네임일 때 : " + session.getAttribute("nickname"));
		}else {
			// 멤버십 O (rfcursor의 값이 있을 때)
			HashMap<String, Object> memberMap = list.get(0);
			System.out.println("멤버맵 : " + memberMap);
			System.out.println("멤버맵의 닉네임 : " + memberMap.get("NICK"));
			session.setAttribute("nickname", memberMap.get("NICK"));
		}		
		
		return mav;
		
	}
	
	
	@GetMapping("/insertCreditcard")
	public String insertCreditcard(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String nickname = (String) session.getAttribute("nickname");
		System.out.println("인서트 크레딧카드의 세션값 : " + nickname);
		
		if(nickname == null) {
			session.setAttribute("nickname", "noNickname");
			System.out.println("인서트 크레딧카드의 재정의 세션값 : " + session.getAttribute("nickname"));
		}
		return "order/insertCreditcard";
	}
	
	@GetMapping("/completePay")
	public String completePay() {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rfcursor3", null);
		
		cs.getCartList(paramMap);
		System.out.println("카트리스트 : " + paramMap.get("rfcursor3"));
		
		ArrayList<HashMap<String, Object>> clist =  (ArrayList<HashMap<String, Object>>) paramMap.get("rfcursor3");
		for(HashMap<String, Object> i : clist) {
			int pseq = (int) i.get("PSEQ");
			// 멤버의 tel2(얘는 테이블 + 뷰), nick(얘는 뷰에 넣어야겠다)과 clist의 qty를 orders 테이블에 추가해야함
		}
		
		
		return "order/completePay";
	}
	
	@GetMapping("/showOrderNum")
	public String showOrderNum(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String nickname = (String) session.getAttribute("nickname");
		System.out.println("최종 세션 닉네임 : " + nickname);
		
		model.addAttribute("nickname", nickname);
		
		return "order/showOrderNum";
	}
	
	
	

}
