package cafe.apenny.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IProductDao {

	void getProduct(HashMap<String, Object> paramMap);

	void getPcategory(HashMap<String, Object> paramMap);

}
