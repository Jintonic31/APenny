package cafe.apenny.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IOrderDao {

	void getPayOption(HashMap<String, Object> paramMap);

}
