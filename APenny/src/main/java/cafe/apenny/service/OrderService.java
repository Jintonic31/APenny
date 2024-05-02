package cafe.apenny.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cafe.apenny.dao.IOrderDao;

@Service
public class OrderService {
	
	@Autowired
	IOrderDao odao;

	public void getPayOption(HashMap<String, Object> paramMap) {
		odao.getPayOption(paramMap);
	}

}
