package GEIT.AMS.Dao.stat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sta0607SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniBurnList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0607.selectAniBurnList", map);
	}

	public List<Map<String, Object>> selectAniBurnTotList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0607.selectAniBurnTotList", map);
	}
}
