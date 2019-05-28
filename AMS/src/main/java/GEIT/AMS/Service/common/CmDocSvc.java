package GEIT.AMS.Service.common;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.common.CmDocDao;

@Service
public class CmDocSvc {

	@Autowired
	private CmDocDao cmDocDao;

	public Map<String, Object> getSyDocInfo(String sdj_docno) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sdj_docno", sdj_docno);

		Map<String, Object> user = cmDocDao.getSyDocInfo(map);

		return user;
	}
	
	public List<Map<String, Object>> selectAniCount(String mai_vvrmno, String sdj_jnldate) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mai_vvrmno", mai_vvrmno);
		map.put("sdj_jnldate", sdj_jnldate);

		List<Map<String, Object>> user = cmDocDao.selectAniCount(map);
		return user;
	}
	
	public Map<String, Object> getSDJ01Cmnt(String sdj_docno) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sdj_docno", sdj_docno);

		Map<String, Object> user = cmDocDao.getSDJ01Cmnt(map);

		return user;
	}
	
	public Map<String, Object> getSDJ05Msg(String sdj_docno) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sdj_docno", sdj_docno);

		Map<String, Object> user = cmDocDao.getSDJ05Msg(map);

		return user;
	}
	
	
	public List<Map<String, Object>> getSyLoanInfo(String mai_vvrmno, String sdj_jnldate) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mai_vvrmno", mai_vvrmno);
		map.put("sdj_jnldate", sdj_jnldate);

		List<Map<String, Object>> user = cmDocDao.getSyLoanInfo(map);
		return user;
	}
	
	public Map<String, Object> getBkDocInfo(String jbj_docno) {
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("jbj_docno", jbj_docno);
		
		Map<String, Object> user = cmDocDao.getBkDocInfo(map);
		
		return user;
	}
	
	//사육일지 동물사그룹
	public List<Map<String, Object>> getSyVvrmList(String svg_docno) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("svg_docno",svg_docno);
		List<Map<String, Object>> user = cmDocDao.getSyVvrmList(map);
		return user;
	}
	
	// 보건일지 진료정보
		public Map<String, Object> getBKJinCnt(String JBJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JBJ_DOCNO", JBJ_DOCNO);
		Map<String, Object> user = cmDocDao.getBKJinCnt(map);
		return user;
		}
	
	// 보건일지 임상병리검사
		public Map<String, Object> getImsangTest(String JBJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JBJ_DOCNO", JBJ_DOCNO);
		Map<String, Object> user = cmDocDao.getImsangTest(map);
		return user;
		}
		
	// 동물정보[임시]
	public Map<String, Object> getAnimalInfo(String MAI_AniCode) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MAI_AniCode", MAI_AniCode);
		Map<String, Object> user = cmDocDao.getAnimalInfo(map);
		return user;
	}
		
	// 동물정보[기본정보]
	public Map<String, Object> getBasicInfo(String MAI_AniCode) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MAI_AniCode", MAI_AniCode);
		Map<String, Object> user = cmDocDao.getBasicInfo(map);
		return user;
	}
	
	// 동물정보[그룹정보]
		public Map<String, Object> getClsInfo(String MAI_AniCode) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("MAI_AniCode", MAI_AniCode);
			Map<String, Object> user = cmDocDao.getClsInfo(map);
			return user;
		}
	
	// 동물정보(출생정보)
	public Map<String, Object> getAniBorn(String MAI_AniCode) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MAI_AniCode", MAI_AniCode);
		Map<String, Object> user = cmDocDao.getAniBorn(map);
		return user;
	}
	
	public List<Map<String, Object>> selectBVvrm(Map<String, Object> map) {
		return cmDocDao.selectBVvrm(map);
	}
	
	public Map<String, Object> getAniPyesa(String MAI_AniCode) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MAI_AniCode", MAI_AniCode);
		Map<String, Object> user = cmDocDao.getAniPyesa(map);
		return user;
	}
	
	public List<Map<String, Object>> getAniBanip(String MAI_AniCode) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MAI_AniCode", MAI_AniCode);
		List<Map<String, Object>> user = cmDocDao.getAniBanip(map);
		return user;
	}
	public List<Map<String, Object>> getImsin(String MAI_AniCode) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MAI_AniCode", MAI_AniCode);
		List<Map<String, Object>> user = cmDocDao.getImsin(map);
		return user;
	}
	
	// 폐사보고서 상세
	public Map<String, Object> getDethInfo(String PDR_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("PDR_DOCNO", PDR_DOCNO);
		Map<String, Object> user = cmDocDao.getDethInfo(map);
		return user;
	}
	
	// 번식보고서 상세
	public Map<String, Object> getBurnInfo(String BBR_DOCNO) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("BBR_DOCNO", BBR_DOCNO);
			Map<String, Object> user = cmDocDao.getBurnInfo(map);
			return user;
		}
		
	// 진료일지 상세
	public Map<String, Object> getJinryoInfo(String JJJ_DOCNO) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("JJJ_DOCNO", JJJ_DOCNO);
			Map<String, Object> user = cmDocDao.getJinryoInfo(map);
			return user;
		}
	
	public List<Map<String, Object>> getJinryoList(String JJJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO",JJJ_DOCNO);
		List<Map<String, Object>> user = cmDocDao.getJinryoList(map);
		return user;
	}
	
	// 진료요청 상세
	public Map<String, Object> getReqInfo(String JJR_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJR_DOCNO", JJR_DOCNO);
		Map<String, Object> user = cmDocDao.getReqInfo(map);
		return user;
	}
	
	// 진료내역 상세
	public Map<String, Object> getJlistInfo(String JJJ_DOCNO, String JJD_JRDATE) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("JJD_JRDATE", JJD_JRDATE);
		Map<String, Object> user = cmDocDao.getJlistInfo(map);
		return user;
	}
	
	// 부검결과서 문서정보
		public Map<String, Object> getBukumDoc(String PBR_DOCNO) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("PBR_DOCNO", PBR_DOCNO);
			Map<String, Object> user = cmDocDao.getBukumDoc(map);
			return user;
		}
	// 부검결과서 문서정보
		public Map<String, Object> getBukumBasic(String PBR_DOCNO) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("PBR_DOCNO", PBR_DOCNO);
			Map<String, Object> user = cmDocDao.getBukumBasic(map);
			return user;
		}
		
	// 부검결과서 부검결과
		public Map<String, Object> getBukumRpt(String PBR_DOCNO) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("PBR_DOCNO", PBR_DOCNO);
			Map<String, Object> user = cmDocDao.getBukumRpt(map);
			return user;
		}
	
		// 검사관리 혈액검사
		public Map<String, Object> getInspctMgr(String JJJ_DOCNO) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("JJJ_DOCNO", JJJ_DOCNO);
			Map<String, Object> user = cmDocDao.getInspctMgr(map);
			return user;
		}
		
		public List<Map<String, Object>> getBloodTest() {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			List<Map<String, Object>> user = cmDocDao.getBloodTest(map);
			return user;
		}
		
		public Map<String, Object> getAnimalInfo2(String mac_aniclscode) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("mac_aniclscode", mac_aniclscode);
			Map<String, Object> user = cmDocDao.getAnimalInfo2(map);
			return user;
		}
		
		public List<Map<String, Object>> showAnimal(String ss_id) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("ss_id", ss_id);
			List<Map<String, Object>> user = cmDocDao.showAnimal(map);
			return user;
		}
		
		public Map<String, Object> getCheckAnimal(String MAI_ANICODE) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("MAI_ANICODE", MAI_ANICODE);
			
			Map<String, Object> user = cmDocDao.getBasicInfo(map);
			return user;
		}
		
		/*사육일지 레이어 동물검색(동물명)*/
		public List<Map<String, Object>> selectLayersch(Map<String, Object> param) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("ch_schType", "aniName");
			map.put("ch_s_keyword", param.get("ch_s_keyword"));
			return cmDocDao.selectLayersch(map);
		}
		
		/*사육일지 레이어 동물검색(동물번호)*/
		public List<Map<String, Object>> selectLayersch2(Map<String, Object> param) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("ch_schType", "aniNumber");
			map.put("ch_s_keyword", param.get("ch_s_keyword"));
			return cmDocDao.selectLayersch(map);
		}
}
