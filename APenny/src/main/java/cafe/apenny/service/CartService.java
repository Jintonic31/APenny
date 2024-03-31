package cafe.apenny.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cafe.apenny.dao.ICartDao;

@Service
public class CartService {
	
	@Autowired
	ICartDao icdao;

	public void insertCart(HashMap<String, Object> paramMap) {
		icdao.insertCart(paramMap);		
	}

	public void getCartList(HashMap<String, Object> paramMap) {
		icdao.getCartList(paramMap);
		
		// 총액, 총 수량 구하는 코드
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)paramMap.get("rfcursor");
		
		int totalPrice = 0;
		int totalQty = 0;
		for(HashMap<String, Object>cart : list) {
		// HashMap형 변수 cart에 list에 있는 cartlist를 하나씩 꺼내 저장하는 것을 반복
			totalPrice += Integer.parseInt( cart.get("QTY").toString() ) * Integer.parseInt( cart.get("PRICE2").toString() );
			totalQty += Integer.parseInt(cart.get("QTY").toString());
		}
		
		paramMap.put("totalPrice", totalPrice);
		paramMap.put("totalQty", totalQty);
	}
	
	

}
