package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0101SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public Map<String, Object> getSystemInfo() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("Base0101.getSystemInfo");
	}

	public boolean updateSystemInfo(Map<String, Object> map) {
		int r = sqlSessionTemplate.update("Base0101.updateSystemInfo", map);
		if (r > 0)
			return true;
		else
			return false;
	}
	public List<Map<String, Object>> selectDptList() {
		return sqlSessionTemplate.selectList("Base0101.selectDptList");
	}
}
