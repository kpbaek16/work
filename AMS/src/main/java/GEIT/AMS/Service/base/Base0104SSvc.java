package GEIT.AMS.Service.base;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0104SDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class Base0104SSvc {

	@Autowired
	private Base0104SDao base0104sDao;

	public List<Map<String, Object>> selectDeptList(Map<String, Object> param) {
		return base0104sDao.selectDeptList(param);
	}

	public List<Map<String, Object>> selectTeamList(Map<String, Object> param) {
		return base0104sDao.selectTeamList(param);
	}

	public List<Map<String, Object>> selectUserList(Map<String, Object> param) {
		return base0104sDao.selectUserList(param);
	}
	
	public Map<String, Object> selectUserInfo(String mui_id) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mui_id", mui_id);

		Map<String, Object> userInfo = base0104sDao.selectUserInfo(map);
		return userInfo;
	}
	
	public List<Map<String, Object>> selectUserKjpList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_dptno", param.get("sch_dptno").toString());
		map.put("sch_teamno", param.get("sch_teamno").toString());
		map.put("sch_mui_id", param.get("sch_mui_id"));
		return base0104sDao.selectUserKjpList(map);
	}
	
	public List<Map<String, Object>> selectUserRcvTypeList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("muk_rcvtype", param.get("muk_rcvtype"));
		map.put("muk_userid", param.get("muk_userid"));
		return base0104sDao.selectUserRcvTypeList(map);
	}
	
	public int deleteUserRcvType(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("muk_userid", param.get("muk_userid"));
		map.put("muk_kjid", param.get("muk_kjid"));
		return base0104sDao.deleteUserRcvType(map);
	}
	
	public int createAuthGrpInfo(Map<String, Object> param) {
		int ret = 0;
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mag_id", param.get("mag_id"));
		map.put("mag_grpcode", param.get("mag_grpcode"));
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		
		base0104sDao.deleteUserPms(map);
		if(map.get("mag_grpcode").toString().compareTo("")==0) {
			ret = base0104sDao.deleteAuthGrpInfo(map);
		}else {
			base0104sDao.createAuthGrpInfo(map);
			ret = base0104sDao.insertUserPms(map);
		}
		return ret;
	}
	
	public int updateUserInfo(Map<String, Object> param) {
		int ret = 0;
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mui_teamno", param.get("mui_teamno"));
		map.put("mui_jccode", param.get("mui_jccode"));
		map.put("mui_hptelno", param.get("mui_hptelno"));
		map.put("mui_lincno", param.get("mui_lincno"));
		map.put("mui_mainbiz", param.get("mui_mainbiz"));
		map.put("mui_id", param.get("mui_id"));
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		
		ret = base0104sDao.updateUserInfo(map);
		return ret;
	}
	
}
