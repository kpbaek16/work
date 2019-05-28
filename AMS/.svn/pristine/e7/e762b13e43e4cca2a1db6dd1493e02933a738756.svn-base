package GEIT.AMS.Dao.stat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sta0608SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniDeadList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0608.selectAniDeadList", map);
	}

	public List<Map<String, Object>> selectAniDeadTotList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0608.selectAniDeadTotList", map);
	}
}
