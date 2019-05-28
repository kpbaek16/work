package GEIT.AMS.Dao.treat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Treat0401SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectDayJnlList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0401.selectDayJnlList", map);
	}
	
}
