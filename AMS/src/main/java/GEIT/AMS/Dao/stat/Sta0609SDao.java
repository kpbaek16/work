package GEIT.AMS.Dao.stat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sta0609SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniIoIList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0609.selectAniIoIList", map);
	}

	public List<Map<String, Object>> selectAniIoOList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0609.selectAniIoOList", map);
	}
}
