package GEIT.AMS.Dao.base;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import GEIT.AMS.Dao.common.AbstractDao;

@Repository
public class Base0107SDao extends AbstractDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Map<String, Object> selectAniPagingList(Map<String, Object> map) {
		return selectPagingList("Base0107.selectAniPagingList", map);
	}
	
	public List<Map<String, Object>> selectAniList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("Base0107.selectAniList", map);
	}
	
	public List<Map<String, Object>> selectAniClsList2(Map<String, Object> map) {
		return selectList("Base0107.selectAniClsList2", map);
	}
	
	public Map<String, Object> selectAniClsInfo2(Map<String, Object> map) {
    	return (Map<String, Object>) selectOne("Base0107.selectAniClsInfo2", map);
    }
	
	public List<Map<String, Object>> selectSubGruopList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Base0107.selectSubGruopList", map);
	}
	
	public Map<String, Object> getSubDetailInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0107.getSubDetailInfo", map);
    }
	
	public int insertAniInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Base0107.insertAniInfo", map);
	}
	
	public Map<String, Object> selectMaxAnum(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Base0107.selectMaxAnum", map);
    }
}
