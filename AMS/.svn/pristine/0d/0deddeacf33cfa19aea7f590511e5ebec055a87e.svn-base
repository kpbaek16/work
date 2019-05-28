package GEIT.AMS.Service.common;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.common.CmKjpDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class CmKjpSvc {

	@Autowired
	private CmKjpDao cmKjpDao;

	public List<Map<String, Object>> selectUserKjpList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_id, param.get(SessionParam.ss_id));
		return cmKjpDao.selectUserKjpList(map);
	}
	
	public List<Map<String, Object>> selectUserRcvTypeList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("muk_rcvtype", param.get("muk_rcvtype"));
		map.put("muk_userid", param.get("muk_userid"));
		return cmKjpDao.selectUserRcvTypeList(param);
	}
	
	public int deleteUserRcvType(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("muk_userid", param.get("muk_userid"));
		map.put("muk_kjid", param.get("muk_kjid"));
		return cmKjpDao.deleteUserRcvType(param);
	}
}
