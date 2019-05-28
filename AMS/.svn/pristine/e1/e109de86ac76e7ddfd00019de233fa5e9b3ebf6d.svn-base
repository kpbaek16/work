package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0103SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> selectDeptList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0103.selectDeptList", map);
	}

	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0103.selectTeamList", map);
	}
	
	// 부서 상세정보 불러오기 
	public Map<String, Object> selectDeptInfo(Map<String, Object> map) {
	    return sqlSessionTemplate.selectOne("Base0103.selectDeptInfo", map);
	    }

	// 팀 상세정보 불러오기
	public Map<String, Object> selectTeamInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0103.selectTeamInfo", map);
    }
	
	public Map<String, Object> selectMaxNum(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0103.selectMaxNum", map);
    }
	
	public int updateDptInfo(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0103.updateDptInfo", map);
	}
}
