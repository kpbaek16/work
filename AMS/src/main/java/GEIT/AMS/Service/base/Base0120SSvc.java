package GEIT.AMS.Service.base;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0120SDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class Base0120SSvc {

	@Autowired
	private Base0120SDao base0120sDao;

	public List<Map<String, Object>> selectAuthGrpList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_grpcode", param.get("sch_grpcode").toString());
		return base0120sDao.selectAuthGrpList(param);
	}
	
	public List<Map<String, Object>> selectAuthMenuList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mup_userid", param.get("mup_userid").toString());
		return base0120sDao.selectAuthMenuList(param);
	}
	
	public int saveAuthGrpList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		map.put("mag_id", param.get("mag_id"));
		map.put("mag_grpcode", param.get("mag_grpcode"));
		map.put("mag_st_day", param.get("mag_st_day"));
		map.put("mag_ed_day", param.get("mag_ed_day"));
		
		int ret = base0120sDao.saveAuthGrpList(map);
		
		System.out.println("saveAuthGrpList ret===>" + ret);
		return ret;
	}
	
	public int saveUserPmsList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		map.put("mup_userid", param.get("mup_userid"));
		map.put("mup_progid", param.get("mup_progid"));
		map.put("mup_srchlvl", param.get("mup_srchlvl"));
		map.put("mup_updlvl", param.get("mup_updlvl"));
		
		int ret = base0120sDao.saveUserPmsList(map);
		
		System.out.println("saveUserPmsList ret===>" + ret);
		return ret;
	}
	
}
