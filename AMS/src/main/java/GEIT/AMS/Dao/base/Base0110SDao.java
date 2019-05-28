package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0110SDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<Map<String, Object>> selectClsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0110.selectClsList", map);
	}
	
	public List<Map<String, Object>> selectDrugList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0110.selectDrugList", map);
	}
	
	public Map<String, Object> selectClsInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0110.selectClsInfo", map);
    }
	
	public Map<String, Object> selectDrugInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0110.selectDrugInfo", map);
    }
	
	public int updateGroupName(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0110.updateGruopName", map);
	}
	
	public Map<String, Object> getMaxNumber(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0110.getMaxNumber", map);
    }
	
}
