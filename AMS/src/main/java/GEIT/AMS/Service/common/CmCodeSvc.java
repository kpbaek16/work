package GEIT.AMS.Service.common;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.common.CmCodeDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class CmCodeSvc {

	@Autowired
	private CmCodeDao cmCodeDao;

	public List<Map<String, Object>> selectAniCls1List(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("clsType", "1");
		map.put("schKeyword", param.get("schKeyword"));
		return cmCodeDao.selectAniClsList(map);
	}
	
	public List<Map<String, Object>> selectAniRankList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mcc_l_code", "200");
		map.put("mcc_m_code", "205");
		return cmCodeDao.selectSCodeList(map);
	}
	
	public List<Map<String, Object>> selectAniCitesList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mcc_l_code", "200");
		map.put("mcc_m_code", "206");
		return cmCodeDao.selectSCodeList(map);
	}
	
	public List<Map<String, Object>> selectAuthGrpList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		return cmCodeDao.selectAuthGrpList(map);
	}
	
	public List<Map<String, Object>> selectTeamAuthGrpList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mti_teamno", param.get("mti_teamno"));
		return cmCodeDao.selectTeamAuthGrpList(map);
	}
	
	public List<Map<String, Object>> selectVvrmList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		return cmCodeDao.selectVvrmList(map);
	}
	
	public List<Map<String, Object>> selectDptList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		return cmCodeDao.selectDptList(map);
	}
	
	public List<Map<String, Object>> selectDptTeamList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mti_dptno", param.get("mti_dptno"));
		return cmCodeDao.selectDptTeamList(map);
	}

	public List<Map<String, Object>> selectJccodeList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mcc_l_code", "100");
		map.put("mcc_m_code", "100");
		return cmCodeDao.selectSCodeList(map);
	}
	
	public List<Map<String, Object>> selectSyPtnList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mcc_l_code", "100");
		map.put("mcc_m_code", "110");
		return cmCodeDao.selectSCodeList(map);
	}
}
