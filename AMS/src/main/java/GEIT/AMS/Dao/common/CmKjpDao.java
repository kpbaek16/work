package GEIT.AMS.Dao.common;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CmKjpDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectUserKjpList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmKjp.selectUserKjpList", map);
	}
	
	public List<Map<String, Object>> selectUserRcvTypeList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmKjp.selectUserRcvTypeList", map);
	}
	
	public int deleteUserRcvType(Map<String, Object> map) {
		return sqlSessionTemplate.update("CmKjp.deleteUserRcvType", map);
	}
}
