package GEIT.AMS.Dao.treat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Treat0402SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectJnlReq(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0402.selectJnlReq", map);
	}
	
	public List<Map<String, Object>> selectANISEQ(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0402.selectANISEQ", map);
	}
	
	public int selectANISEQ_Count(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0402.selectANISEQ_Count", map);
	}
	
	public String selectMac_Docno(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0402.selectMac_Docno", map);
	}
	
	public Map<String, Object> getRctDetail(String DOCNO) {
		return sqlSessionTemplate.selectOne("Treat0402.getRctDetail", DOCNO);
	}
	
	public Map<String, Object> getAniINFO(String ANIINFO) {
		return sqlSessionTemplate.selectOne("Treat0402.getAniINFO", ANIINFO);
	}
	
	public List<Map<String, Object>> getVVRMdata() {
		return sqlSessionTemplate.selectList("Treat0402.getVVRMdata");
	}
	
	public int insertJinryoInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0402.insertJinryoInfo", map);
	}
	
	public int insertANI_ATCHInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0402.insertANI_ATCHInfo", map);
	}
	
	public int updateRCT_HosptlCnfm(Map<String, Object> map){
		return sqlSessionTemplate.update("Treat0402.updateRCT_HosptlCnfm", map);
	}
	
	public int updateJinryoRCTInfo(Map<String, Object> map){
		return sqlSessionTemplate.update("Treat0402.updateJinryoRCTInfo", map);
	}
	
	public int deleteJinryoRCTInfo(String DOCNO){
		return sqlSessionTemplate.delete("Treat0402.deleteJinryoRCTInfo", DOCNO);
	}
	
	public int deleteANI_ATCHInfo(String DOCNO){
		return sqlSessionTemplate.delete("Treat0402.deleteANI_ATCHInfo", DOCNO);
	}

}
