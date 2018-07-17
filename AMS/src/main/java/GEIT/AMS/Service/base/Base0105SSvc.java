package GEIT.AMS.Service.base;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0105SDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class Base0105SSvc {

	@Autowired
	private Base0105SDao base0105sDao;

	public List<Map<String, Object>> selectDeptList(Map<String, Object> param) {
		return base0105sDao.selectDeptList(param);
	}

	public List<Map<String, Object>> selectTeamList(Map<String, Object> param) {
		return base0105sDao.selectTeamList(param);
	}

	public List<Map<String, Object>> selectVvrmList(Map<String, Object> param) {
		return base0105sDao.selectVvrmList(param);
	}
	
	public Map<String, Object> getMaxNum(Map<String, Object> map) {
		return base0105sDao.getMaxNum(map);
	}
	
	public List<Map<String, Object>> showDptTeam(Map<String, Object> map) {
		return base0105sDao.showDptTeam(map);
	}
	
	public List<Map<String, Object>> selectSypattnList(Map<String, Object> param) {
		return base0105sDao.selectSypattnList(param);
	}
	
	public Map<String, Object> selectVvrmInfo(String mvi_vvrmno) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mvi_vvrmno", mvi_vvrmno);

		Map<String, Object> userInfo = base0105sDao.selectVvrmInfo(map);
		return userInfo;
	}
	
	public List<Map<String, Object>> selectManagerList(Map<String, Object> param) {
		return base0105sDao.selectManagerList(param);
	}
	
	public int createVmlList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		map.put("vvrmno", param.get("vvrmno"));
		map.put("list_Y", param.get("list_Y"));
		map.put("list_N", param.get("list_N"));
		map.put("schKeyword", param.get("schKeyword"));
		
		int ret = base0105sDao.deleteVmlList(map);
		if (map.get("list_Y")!=null) {
			ret += base0105sDao.createVmlList(map);
		}
		System.out.println("createVmlList ret===>" + ret);
		return ret;
	}
}
