package cafe.apenny.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cafe.apenny.dao.IAdminDao;

@Service
public class AdminService {

	@Autowired
	IAdminDao adao;

	public void getBanner(HashMap<String, Object> paramMap) {
		adao.getBanner(paramMap);
		
	}


}
