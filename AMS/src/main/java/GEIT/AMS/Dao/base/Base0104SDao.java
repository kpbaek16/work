package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0104SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> selectDeptList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0104.selectDeptList", map);
	}

	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0104.selectTeamList", map);
	}
	
	public List<Map<String, Object>> selectUserList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0104.selectUserList", map);
	}
	
    public Map<String, Object> selectUserInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0104.selectUserInfo", map);
    }
    
	public List<Map<String, Object>> selectUserKjpList(Map<String, Object> map) {
    	return sqlSessionTemplate.selectList("Base0104.selectUserKjpList", map);
    }
	
	public List<Map<String, Object>> selectUserRcvTypeList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0104.selectUserRcvTypeList", map);
	}
	
	public int deleteUserRcvType(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0104.deleteUserRcvType", map);
	}
	
	public int createAuthGrpInfo(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0104.createAuthGrpInfo", map);
	}
	
	public int updateUserInfo(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0104.updateUserInfo", map);
	}
	
	public int deleteUserPms(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0104.deleteUserPms", map);
	}
	
	public int deleteAuthGrpInfo(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0104.deleteAuthGrpInfo", map);
	}
	
	public int insertUserPms(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0104.insertUserPms", map);
	}
	
}
