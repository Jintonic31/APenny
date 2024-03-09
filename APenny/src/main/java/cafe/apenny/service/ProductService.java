package cafe.apenny.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cafe.apenny.dao.IProductDao;

@Service
public class ProductService {

	@Autowired
	IProductDao pdao;

	public void getProduct(HashMap<String, Object> paramMap) {
		pdao.getProduct(paramMap);		
	}

	public void getPcategory(HashMap<String, Object> paramMap) {
		pdao.getPcategory(paramMap);		
	}

	public void getProductOne(HashMap<String, Object> paramMap) {
		pdao.getProductOne(paramMap);		
	}



	
	
}
