package GEIT.AMS.Dao.jour;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Jour0303SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectBurnReptList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0303.selectBurnReptList", map);
	}
	
}
