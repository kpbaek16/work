package GEIT.AMS.Dao.stat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sta0611SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniClsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0611.selectAniClsList", map);
	}

	public List<Map<String, Object>> selectAniClsTotList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0611.selectAniClsTotList", map);
	}
}
