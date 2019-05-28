package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Base0108SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> selectAniClsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0108.selectAniClsList", map);
	}

	public Map<String, Object> selectAniClsInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0108.selectAniClsInfo", map);
    }
    
	public List<Map<String, Object>> selectBdInspList(Map<String, Object> map) {
    	return sqlSessionTemplate.selectList("Base0108.selectBdInspList", map);
    }
	
	public List<Map<String, Object>> selectBdItemList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0108.selectBdItemList", map);
	}
	
    public int createBdInspList(Map<String, Object> map) {
    	return sqlSessionTemplate.update("Base0108.createBdInspList", map);
    }
    
    public int deleteBdInspList(Map<String, Object> map) {
    	return sqlSessionTemplate.update("Base0108.deleteBdInspList", map);
    }
    
	public List<Map<String, Object>> selectCommBdItemList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0108.selectCommBdItemList", map);
	}
	
	public Map<String, Object> selectBdItemInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0108.selectBdItemInfo", map);
    }
	
	public int insertBdItem(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0108.insertBdItem", map);
	}
	
	public int updateBdItem(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0108.updateBdItem", map);
	}
	
	public int deleteBdItem(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0108.deleteBdItem", map);
	}
    
	public int updateBdInsp(Map<String, Object> map) {
		return sqlSessionTemplate.update("Base0108.updateBdInsp", map);
	}
	
}
