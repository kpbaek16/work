package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0106SDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> selectAniClsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0106.selectAniClsList", map);
	}
	
	public Map<String, Object> selectAniClsInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0106.selectAniClsInfo", map);
    }

}
