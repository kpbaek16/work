package GEIT.AMS.Dao.treat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Treat0405SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAnesList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0405.selectAnesList", map);
	}
	
}
