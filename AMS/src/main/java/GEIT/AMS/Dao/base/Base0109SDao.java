package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0109SDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> selectVcnList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0109.selectVcnList", map);
	}
	
	/*public List<Map<String, Object>> selectProdList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0109.selectProdList", map);
	}*/
	
	public Map<String, Object> selectVcnInfo(Map<String, Object> map) {
	    return sqlSessionTemplate.selectOne("Base0109.selectVcnInfo", map);
	}
	
	public Map<String, Object> getMaxNumber(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0109.getMaxNumber", map);
    }
}
