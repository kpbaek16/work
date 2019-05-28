package GEIT.AMS.Dao.stat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sta0601SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniClsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0601.selectAniClsList", map);
	}

	public List<Map<String, Object>> selectAniClsTotList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0601.selectAniClsTotList", map);
	}

	public List<Map<String, Object>> selectTotAniClsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0601.selectTotAniClsList", map);
	}
	
	public List<Map<String, Object>> selectClsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0601.selectClsList", map);
	}
	
	public List<Map<String, Object>> selectTotClsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0601.selectTotClsList", map);
	}
}
