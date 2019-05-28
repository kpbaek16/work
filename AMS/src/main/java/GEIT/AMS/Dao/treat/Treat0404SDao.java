package GEIT.AMS.Dao.treat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Treat0404SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectPreslist(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0404.selectPreslist", map);
	}
	
	public List<Map<String, Object>> selectDrugList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0404.selectDrugList", map);
	}
	
	public List<Map<String, Object>> selectTmpList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0404.selectTmpList", map);
	}
	
	public int getMaxK3Info(Map<String, Object> map) {
		Object MaxK3 = sqlSessionTemplate.selectOne("Treat0404.getMaxK3Info", map);
		return MaxK3 == null ? 1 : Integer.parseInt(MaxK3.toString());
	}
	
	public List<Map<String, Object>> selectCBDataList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0404.selectCBDataList", map);
	}
	
	public Map<String, Object> getDrugInfo(String CODE) {
		return sqlSessionTemplate.selectOne("Treat0404.getDrugInfo", CODE);
	}
	
	public int insertTmpInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0404.insertTmpInfo", map);
	}
	
	public int insertCBInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0404.insertCBInfo", map);
	}
	
	public int deleteTmpInfo(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0404.deleteTmpInfo",map);
	}
	
	public int deleteCBInfo(String CBDOCNO){
		return sqlSessionTemplate.delete("Treat0404.deleteCBInfo",CBDOCNO);
	}
}
