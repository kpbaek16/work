package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0120SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> selectAuthGrpList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0120.selectAuthGrpList", map);
	}
	
	public List<Map<String, Object>> selectAuthMenuList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0120.selectAuthMenuList", map);
	}
	
    public int saveAuthGrpList(Map<String, Object> map) {
    	return sqlSessionTemplate.update("Base0120.saveAuthGrpList", map);
    }
    
    public int saveUserPmsList(Map<String, Object> map) {
    	return sqlSessionTemplate.update("Base0120.saveUserPmsList", map);
    }
}
