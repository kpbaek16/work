package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0105SDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
	this.sqlSessionTemplate = sqlSessionTemplate;
    }

	public List<Map<String, Object>> selectDeptList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0105.selectDeptList", map);
	}

	public List<Map<String, Object>> selectTeamList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0105.selectTeamList", map);
	}
	
	public List<Map<String, Object>> selectVvrmList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0105.selectVvrmList", map);
	}
	
	public Map<String, Object> getMaxNum(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0105.getMaxNum", map);
    }
	
	public List<Map<String, Object>> selectSypattnList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0105.selectSypattnList", map);
	}
	
    public Map<String, Object> selectVvrmInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0105.selectVvrmInfo", map);
    }
    
	public List<Map<String, Object>> selectManagerList(Map<String, Object> map) {
    	return sqlSessionTemplate.selectList("Base0105.selectManagerList", map);
    }
	
    public int deleteVmlList(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0105.deleteVmlList", map);
	}
    
    public int createVmlList(Map<String, Object> map) {
    	return sqlSessionTemplate.update("Base0105.createVmlList", map);
    }
    
    public List<Map<String, Object>> showDptTeam(Map<String, Object> map) {
    	return sqlSessionTemplate.selectList("Base0105.showDptTeam", map);
    }
 
}
