package cafe.apenny.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAdminDao {

	void getBanner(HashMap<String, Object> paramMap);

	
}
