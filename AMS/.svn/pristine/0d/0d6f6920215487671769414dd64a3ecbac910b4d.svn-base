package GEIT.AMS.Dao.common;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CmDocDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public Map<String, Object> getSyDocInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getSyDocInfo", map);
	}
	
	public List<Map<String, Object>> selectAniCount(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmDocMapper.selectAniCount", map);
	}
	
	public Map<String, Object> getSDJ01Cmnt(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getSDJ01Cmnt", map);
	}
	
	public Map<String, Object> getSDJ05Msg(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getSDJ05Msg", map);
	}
	
	public List<Map<String, Object>> getSyLoanInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmDocMapper.getSyLoanInfo", map);
	}

	public Map<String, Object> getBkDocInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getBkDocInfo", map);
	}
	
	public Map<String, Object> getBKJinCnt(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getBKJinCnt", map);
	}
	
	// 보건일지 임상병리검사
	public Map<String, Object> getImsangTest(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getImsangTest", map);
	}
	
	// 동물정보[임시]
	public Map<String, Object> getAnimalInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getAnimalInfo", map);
	}
	
	// 동물정보[기본정보]
	public Map<String, Object> getBasicInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getBasicInfo", map);
	}
	
	// 동물정보[그룹정보]
	public Map<String, Object> getClsInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getClsInfo", map);
	}
	
	public List<Map<String, Object>> selectBVvrm(Map<String, Object> map) {
	return sqlSessionTemplate.selectList("Base0107.selectBVvrm", map);
	}
	
	// 동물정보(출생정보)
	public Map<String, Object> getAniBorn(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getAniBorn", map);
	}
	
	// 동물정보(폐사정보)
	public Map<String, Object> getAniPyesa(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getAniPyesa", map);
	}
	
	public List<Map<String, Object>> getAniBanip(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmDocMapper.getAniBanip", map);
	}
	
	public List<Map<String, Object>> getImsin(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmDocMapper.getImsin", map);
	}
	
	// 폐사보고서 복사
	public Map<String, Object> getDethInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getDethInfo", map);
	}
	
	// 번식보고서 복사
	public Map<String, Object> getBurnInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getBurnInfo", map);
	}
	
	// 진료일지 상세
	public Map<String, Object> getJinryoInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getJinryoInfo", map);
	}
	
	public List<Map<String, Object>> getJinryoList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmDocMapper.getJinryoList", map);
	}
	
	public List<Map<String, Object>> getSyVvrmList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmDocMapper.getSyVvrmList", map);
	}
	
	// 진료요청 상세 
	public Map<String, Object> getReqInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getReqInfo", map);
	}
	
	// 진료내역 상세
	public Map<String, Object> getJlistInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getJlistInfo", map);
	}
	
	// 부검결과서 문서정보
	public Map<String, Object> getBukumDoc(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getBukumDoc", map);
	}
	
	// 부검결과서 기본정보
	public Map<String, Object> getBukumBasic(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getBukumBasic", map);
	}
	
	//부검결과서 부검결과
	public Map<String, Object> getBukumRpt(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getBukumRpt", map);
	}
	
	// 검사관리 혈액검사
	public Map<String, Object> getInspctMgr(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getInspctMgr", map);
	}
	
	public List<Map<String, Object>> getBloodTest(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmDocMapper.getBloodTest", map);
	}
	
	public Map<String, Object> getAnimalInfo2(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getAnimalInfo2", map);
	}
	
	public List<Map<String, Object>> showAnimal(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmDocMapper.showAnimal", map);
	}
	
	public Map<String, Object> getCheckAnimal(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("CmDocMapper.getCheckAnimal", map);
	}
	
	/*사육일지 레이어 동물검색*/
	public List<Map<String, Object>> selectLayersch(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmDocMapper.selectLayersch", map);
	}
}
