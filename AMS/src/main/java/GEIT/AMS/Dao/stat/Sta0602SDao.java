package GEIT.AMS.Dao.stat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sta0602SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniVvrmList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0602.selectAniVvrmList", map);
	}

	public List<Map<String, Object>> selectAniVvrmTotList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0602.selectAniVvrmTotList", map);
	}
	
}
