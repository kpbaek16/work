package GEIT.AMS.Dao.jour;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Jour0304SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectDethReptList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0304.selectDethReptList", map);
	}
	
	public List<Map<String, Object>> search_pop_code(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0304.search_pop_code", map);
	}
	
	public Map<String, Object> getAnimalInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Jour0304.getAnimalInfo", map);
	}
	
	public int insPsWrite(Map<String, Object> param){
		return sqlSessionTemplate.insert("Jour0304.insPsWrite", param);
	}
	
	public int insBDCWrite(Map<String, Object> param){
		return sqlSessionTemplate.insert("Jour0304.insBDCWrite", param);
	}
	
}
