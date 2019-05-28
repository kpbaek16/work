package GEIT.AMS.Dao.prevent;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Prevent0502SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> CategoryList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Prevent0502.CategoryList", map);
	}
	
	public List<Map<String, Object>> DivisionList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Prevent0502.DivisionList", map);
	}
	
	public List<Map<String, Object>> SectionList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Prevent0502.SectionList", map);
	}
	
	public Map<String, Object> getDetailInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Prevent0502.getDetailInfo", map);
	}
}
