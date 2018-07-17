package GEIT.AMS.Dao.common;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CmCodeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> selectAniClsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmCode.selectAniClsList", map);
	}

	public List<Map<String, Object>> selectSCodeList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmCode.selectSCodeList", map);
	}
	
	public List<Map<String, Object>> selectVvrmList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmCode.selectVvrmList", map);
	}
	
	public List<Map<String, Object>> selectAuthGrpList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmCode.selectAuthGrpList", map);
	}
	
	public List<Map<String, Object>> selectTeamAuthGrpList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmCode.selectTeamAuthGrpList", map);
	}
	
	public List<Map<String, Object>> selectDptList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmCode.selectDptList", map);
	}
	
	public List<Map<String, Object>> selectDptTeamList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmCode.selectDptTeamList", map);
	}
	
}
