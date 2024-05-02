package cafe.apenny.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ICartDao {

	void insertCart(HashMap<String, Object> paramMap);

	void getCartList(HashMap<String, Object> paramMap);

	void deleteAllCart();

	void cartSubQty(HashMap<String, Object> paramMap);

	void deleteOneCart(HashMap<String, Object> paramMap);

	void cartAddQty(HashMap<String, Object> paramMap);

}
