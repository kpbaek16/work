package GEIT.AMS.Service.jour;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.jour.Jour0301EDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class Jour0301ESvc {

	@Autowired
	private Jour0301EDao jour0301eDao;

	public List<Map<String, Object>> selectUserKjpList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_id, param.get(SessionParam.ss_id));
		return jour0301eDao.selectUserKjpList(map);
	}
	
	public List<Map<String, Object>> selectUserRcvTypeList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("muk_rcvtype", param.get("muk_rcvtype"));
		map.put("muk_userid", param.get("muk_userid"));
		return jour0301eDao.selectUserRcvTypeList(param);
	}
	
	public int deleteUserRcvType(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("muk_userid", param.get("muk_userid"));
		map.put("muk_kjid", param.get("muk_kjid"));
		return jour0301eDao.deleteUserRcvType(param);
	}
	
	/*문서정보*/
	 public int updateSDJ_DocInfo(String sdj_docno, String SDJ_USERINFO, String SDJ_WTHENO, String USERID, String mai_vvrmno, String sdj_jnldate) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
		 	map.put("sdj_docno", sdj_docno);
			map.put("SDJ_USERINFO", SDJ_USERINFO);
			map.put("SDJ_WTHENO", SDJ_WTHENO);
			map.put("USERID", USERID);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJ_DocInfo(map);
		    }
	
	
	 public int updateSDJ_Dicmnt(String mai_vvrmno, String DAIO_CMNT, String sdj_jnldate, String USERID, String sdj_docno) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("DAIO_Cmnt", DAIO_CMNT);
			map.put("sdj_jnldate", sdj_jnldate);
			map.put("USERID", USERID);
			map.put("sdj_docno", sdj_docno);
			
			return jour0301eDao.updateSDJ_Dicmnt(map);
		    }
	
	
	 public int updateSDJ05_Msg(String sdj_docno, String SDJ05_CMNTETC, String SDJ05_RSLTETC, String SDJ05_ETCETC, 
			 String USERID, String mai_vvrmno, String sdj_jnldate) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("SDJ05_CMNTETC", SDJ05_CMNTETC);
			map.put("SDJ05_RSLTETC", SDJ05_RSLTETC);
			map.put("SDJ05_ETCETC", SDJ05_ETCETC);
			map.put("sdj_docno", sdj_docno);
			map.put("USERID", USERID);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJ05_Msg(map);
		    }
	 
	 public List<Map<String, Object>> selectJNL03_SJ(String sdj_docno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("sdj_docno", sdj_docno);
			
			List<Map<String, Object>> JNL03_SJ = jour0301eDao.selectJNL03_SJ(map);
			return JNL03_SJ;
		}
	 
	/* 동물 및 시설점검 */
	 /*동물사 온도*/
	 public Map<String, Object> getSVG_TEMP(String sdj_docno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("sdj_docno", sdj_docno);
			return jour0301eDao.getSVG_TEMP(map);
		}
	 
	 /*동물사 온도 수정*/
	 public int updateSVG_Temp(String sdj_docno, String SVG_IN_HTMPT, String SVG_IN_LTMPT, String SVG_OUT_HTMPT, String SVG_OUT_LTMPT, 
			 String mai_vvrmno, String sdj_jnldate, String USERID ) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 
			map.put("sdj_docno", sdj_docno);
			map.put("SVG_IN_HTMPT", SVG_IN_HTMPT);
			map.put("SVG_IN_LTMPT", SVG_IN_LTMPT);
			map.put("SVG_OUT_HTMPT", SVG_OUT_HTMPT);
			map.put("SVG_OUT_LTMPT", SVG_OUT_LTMPT);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			map.put("USERID", USERID);
			
			return jour0301eDao.updateSVG_Temp(map);
	}
	 
	 /*내외 순찰실적, 시설점검 특이사항, 개선사항*/
	 public Map<String, Object> getSDJ_SJ(String sdj_docno) {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("sdj_docno", sdj_docno);
			
			Map<String, Object> getSDJ_SJ = jour0301eDao.getSDJ_SJ(map);
			return getSDJ_SJ;
		}
	 
	 /*내외 순찰실적 수정*/
	 public int updateSDJ_Sj(String sdj_docno, String SDJS_IN_TM, String SDJS_IN_S, String SDJS_IN_WL_YN, String SDJS_IN_CMNT, 
			 String SDJS_OUT_TM, String SDJS_OUT_S, String SDJS_OUT_WL_YN, String SDJS_OUT_CMNT, 
			 String USERID, String mai_vvrmno, String sdj_jnldate ) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("sdj_docno", sdj_docno);
			map.put("SDJS_IN_TM", SDJS_IN_TM);
			map.put("SDJS_IN_S", SDJS_IN_S);
			map.put("SDJS_IN_WL_YN", SDJS_IN_WL_YN);
			map.put("SDJS_IN_CMNT", SDJS_IN_CMNT);
			
			map.put("SDJS_OUT_TM", SDJS_OUT_TM);
			map.put("SDJS_OUT_S", SDJS_OUT_S);
			map.put("SDJS_OUT_WL_YN", SDJS_OUT_WL_YN);
			map.put("SDJS_OUT_CMNT", SDJS_OUT_CMNT);
			
			map.put("USERID", USERID);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJ_Sj(map);
	}
	 
	 /*시설점검 특이사항 수정*/
	 public int updateSDJS_Ss_Cmnt(String sdj_docno, String USERID, String SDJS_SS_CMNT, String mai_vvrmno, String sdj_jnldate ) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("sdj_docno", sdj_docno);
			map.put("USERID", USERID);
			map.put("SDJS_SS_CMNT", SDJS_SS_CMNT);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJS_Ss_Cmnt(map);
	}
	 /*시설점검 개선사항 수정*/
	 public int updateSDJS_Sc_Cmnt(String sdj_docno, String USERID, String SDJS_SC_CMNT, String mai_vvrmno, String sdj_jnldate ) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("sdj_docno", sdj_docno);
			map.put("USERID", USERID);
			map.put("SDJS_SC_CMNT", SDJS_SC_CMNT);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJS_Sc_Cmnt(map);
	}
	 /*--*/
	 
	 public List<Map<String, Object>> selectJnl02_SP(String sdj_docno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("sdj_docno", sdj_docno);
			
			List<Map<String, Object>> JNL03_SJ = jour0301eDao.selectJnl02_SP(map);
			return JNL03_SJ;
		}
	 public List<Map<String, Object>> selctSDJ02_AE(String sdj_docno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("sdj_docno", sdj_docno);
			
			List<Map<String, Object>> JNL03_SJ = jour0301eDao.selctSDJ02_AE(map);
			return JNL03_SJ;
		}
	 public List<Map<String, Object>> selctJNL01_CH(String sdj_docno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("sdj_docno", sdj_docno);
			
			List<Map<String, Object>> JNL03_SJ = jour0301eDao.selctJNL01_CH(map);
			return JNL03_SJ;
		}
	 
	 public int updateSDJ01_Cmnt(String sdj_docno, String SDJ01_CMNT, String USERID, String mai_vvrmno, String sdj_jnldate ) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("sdj_docno", sdj_docno);
			map.put("SDJ01_CMNT", SDJ01_CMNT);
			map.put("USERID", USERID);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJ01_Cmnt(map);
		    }
	 
	 /*사육관리*/
	 /*사료관리(종별)*/
	 public List<Map<String, Object>> selectSDJ03_Species(String mai_vvrmno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("mai_vvrmno", mai_vvrmno);
			List<Map<String, Object>> JNL03_SJ = jour0301eDao.selectSDJ03_Species(map);
			return JNL03_SJ;
		}
	 /*사료관리(개별)*/
	 public List<Map<String, Object>> selectSDJ03_aniList(String mai_vvrmno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("mai_vvrmno", mai_vvrmno);
			List<Map<String, Object>> JNL03_SJ = jour0301eDao.selectSDJ03_aniList(map);
			return JNL03_SJ;
		}
	 
	/* Select 안전교육 등 관리 , 기타 */
	 public Map<String, Object> getSDJ_SafeEtc_CMNT(String sdj_docno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("sdj_docno", sdj_docno);
			return jour0301eDao.getSDJ_SafeEtc_CMNT(map);
		}
	 
	 /*Select 동물사육관리 , 위생 및 방역관리 */
	 public Map<String, Object> getSDJ02_AniPrv(String sdj_docno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("sdj_docno", sdj_docno);
			return jour0301eDao.getSDJ02_AniPrv(map);
		}
	 
	 /*동물사육관리 수정*/
	 public int updateSDJ02_AniCmnt(String sdj_docno, String SDJ02_ANICMNT, String USERID, String mai_vvrmno, String sdj_jnldate) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("sdj_docno", sdj_docno);
			map.put("SDJ02_ANICMNT", SDJ02_ANICMNT);
			map.put("USERID", USERID);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJ02_AniCmnt(map);
		    }
	 
	 /* 안전교육 등 관리 수정*/
	 public int updateSDJ_SafeEdu(String sdj_docno, String SDJ_SAFE_EDU, String USERID, String mai_vvrmno, String sdj_jnldate) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("sdj_docno", sdj_docno);
			map.put("SDJ_SAFE_EDU", SDJ_SAFE_EDU);
			map.put("USERID", USERID);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJ_SafeEdu(map);
		    }
	 /*기타*/
	 public int updateSDJ_Etc(String sdj_docno, String SDJ_SAFE_ETC, String USERID, String mai_vvrmno, String sdj_jnldate) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("sdj_docno", sdj_docno);
			map.put("SDJ_SAFE_ETC", SDJ_SAFE_ETC);
			map.put("USERID", USERID);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJ_Etc(map);
		    }
	 /*위생 및 방역관리 수정*/
	 public int updateSDJ02_PrvCmnt(String sdj_docno, String SDJ02_PRVCMNT, String USERID, String mai_vvrmno, String sdj_jnldate) throws IOException {
		 	Map<String, Object> map = new LinkedHashMap<String, Object>();
		 	
			map.put("sdj_docno", sdj_docno);
			map.put("SDJ02_PRVCMNT", SDJ02_PRVCMNT);
			map.put("USERID", USERID);
			map.put("mai_vvrmno", mai_vvrmno);
			map.put("sdj_jnldate", sdj_jnldate);
			
			return jour0301eDao.updateSDJ02_PrvCmnt(map);
		    }
	 
	 
	
	 
	/*이환동물 팝업*/
	 public List<Map<String, Object>> selectAE_popup(String mai_vvrmno) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("mai_vvrmno", mai_vvrmno);
			
			/*System.out.printf("dddddddd2 : " + mai_vvrmno);*/
			
			List<Map<String, Object>> JNL03_SJ = jour0301eDao.selectAE_popup(map);
			/*System.out.printf("dddddddd : " + JNL03_SJ);*/
			return JNL03_SJ;
		}
}
