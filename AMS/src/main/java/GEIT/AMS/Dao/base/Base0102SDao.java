package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0102SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> getCommonCategory(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0102.getCommonCategory", map);
	}
	
	public List<Map<String, Object>> getCommonDivision(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0102.getCommonDivision", map);
	}
	
	public List<Map<String, Object>> getCommonSection(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0102.getCommonSection", map);
	}
	
	public Map<String, Object> getCategoryInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Base0102.getCategoryInfo", map);
	}
	
	public Map<String, Object> getDivisionInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Base0102.getDivisionInfo", map);
	}
	
	public Map<String, Object> getSectionInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Base0102.getSectionInfo", map);
	}
}
