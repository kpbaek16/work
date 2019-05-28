package GEIT.AMS.Dao.stat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sta0610SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniJnlIList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0610.selectAniJnlIList", map);
	}

	public List<Map<String, Object>> selectAniJnlOList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0610.selectAniJnlOList", map);
	}
	
	public List<Map<String, Object>> selectAniDayTotList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0610.selectAniDayTotList", map);
	}
	
	public Map<String, Object> selectTotAniJnlInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Sta0610.selectTotAniJnlInfo", map);
	}
	
	public Map<String, Object> selectAniClsKnjpInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Sta0610.selectAniClsKnjpInfo", map);
	}
}
