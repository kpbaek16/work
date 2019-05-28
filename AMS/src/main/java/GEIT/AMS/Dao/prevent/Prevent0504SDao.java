package GEIT.AMS.Dao.prevent;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Prevent0504SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public Map<String, Object> selectK01(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("PC.K01", map);
	}
	
	public List<Object> K01_Result(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("PC.K01_Result", map);
	}

	public Map<String, Object> selectK02(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("PC.K02", map);
	}
	
	public Map<String, Object> selectK03(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("PC.K03", map);
	}
	
	public Map<String, Object> selectK04(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("PC.K04", map);
	}
	
}
