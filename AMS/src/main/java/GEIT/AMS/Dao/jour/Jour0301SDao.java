package GEIT.AMS.Dao.jour;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Jour0301SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectDayJnlList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selectDayJnlList", map);
	}
	
	public Map<String, Object> selectSydailyCh(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Jour0301.selectSydailyCh", map);
	}
	
}
