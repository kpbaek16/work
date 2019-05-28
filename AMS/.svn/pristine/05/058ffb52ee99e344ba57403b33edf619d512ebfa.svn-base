package GEIT.AMS.Dao.jour;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Jour0301EDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectUserKjpList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selectUserKjpList", map);
	}
	
	public List<Map<String, Object>> selectUserRcvTypeList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selectUserRcvTypeList", map);
	}
	
	public int deleteUserRcvType(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.deleteUserRcvType", map);
	}
	
	/*동물현황*/
	public int updateSDJ_Dicmnt(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJ_Dicmnt", map);
	}
	
	public int updateSDJ05_Msg(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJ05_Msg", map);
	}
	
	public List<Map<String, Object>> selectJNL03_SJ(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selectJNL03_SJ", map);
	}

	/*동물및 시설점검*/
	/*동물사 온도*/
	public Map<String, Object> getSVG_TEMP(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Jour0301.getSVG_TEMP", map);
    }
	/*동물사 온도 수정*/
	public int updateSVG_Temp(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSVG_Temp", map);
	}
	/*내외 순찰실적, 시설점검 특이사항, 개선사항*/
	public Map<String, Object> getSDJ_SJ(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Jour0301.getSDJ_SJ", map);
    }
	
	/*내외 순찰실적 수정*/
	public int updateSDJ_Sj(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJ_Sj", map);
	}
	/*시설점검 특이사항 수정*/
	public int updateSDJS_Ss_Cmnt(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJS_Ss_Cmnt", map);
	}
	/*시설점검 개선사항 수정*/
	public int updateSDJS_Sc_Cmnt(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJS_Sc_Cmnt", map);
	}
	
	public List<Map<String, Object>> selectJnl02_SP(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selectJnl02_SP", map);
	}
	public List<Map<String, Object>> selctSDJ02_AE(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selctSDJ02_AE", map);
	}
	public List<Map<String, Object>> selctJNL01_CH(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selctJNL01_CH", map);
	}
	
	/*문서정보*/
	public int updateSDJ_DocInfo(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJ_DocInfo", map);
	}
	
	/*동물현황*/
	/*tab01 동물현황 특이사항*/
	public int updateSDJ01_Cmnt(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJ01_Cmnt", map);
	}
	
	/*--사육관리--*/
	/*사료관리(종별)*/
	public List<Map<String, Object>> selectSDJ03_Species(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selectSDJ03_Species", map);
	}
	/*사료관리(개별)*/
	public List<Map<String, Object>> selectSDJ03_aniList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selectSDJ03_aniList", map);
	}
	/*Select 동물사육관리 , 위생 및 방역관리 */
	public Map<String, Object> getSDJ02_AniPrv(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Jour0301.getSDJ02_AniPrv", map);
    }
	/*동물사육관리 수정*/
	public int updateSDJ02_AniCmnt(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJ02_AniCmnt", map);
	}
	/*위생 및 방역관리 수정*/
	public int updateSDJ02_PrvCmnt(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJ02_PrvCmnt", map);
	}
	/*Select 안전교육 등 관리 , 기타 */
	public Map<String, Object> getSDJ_SafeEtc_CMNT(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("Jour0301.getSDJ_SafeEtc_CMNT", map);
    }
	/*안전교육 등 관리 수정*/
	public int updateSDJ_SafeEdu(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJ_SafeEdu", map);
	}
	/*기타 수정*/
	public int updateSDJ_Etc(Map<String, Object> map) {
		return sqlSessionTemplate.update("Jour0301.updateSDJ_Etc", map);
	}
	/*--사육관리--*/
	
	
	
	
	/*이환동물 팝업*/
	public List<Map<String, Object>> selectAE_popup(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Jour0301.selectAE_popup", map);
	}
}
