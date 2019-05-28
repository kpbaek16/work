package GEIT.AMS.Service.base;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0103SDao;

@Service
public class Base0103SSvc {

	@Autowired
	private Base0103SDao base0103sDao;

	public List<Map<String, Object>> selectDeptList(Map<String, Object> param) {
		return base0103sDao.selectDeptList(param);
	}

	public List<Map<String, Object>> selectTeamList(Map<String, Object> param) {
		return base0103sDao.selectTeamList(param);
	}
	
	public Map<String, Object> selectMaxNum(Map<String, Object> map) {
		return base0103sDao.selectMaxNum(map);
	}
	
	// 부서 상세정보 불러오기
	public Map<String, Object> selectDeptInfo(String MDI_LINKNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MDI_LINKNO", MDI_LINKNO);

		Map<String, Object> deptInfo = base0103sDao.selectDeptInfo(map);
		return deptInfo;
		}
	
	// 팀 상세정보 불러오기
	public Map<String, Object> selectTeamInfo(String teamno) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("teamno", teamno);

		Map<String, Object> teamInfo = base0103sDao.selectTeamInfo(map);
		return teamInfo;
	}
	
	public int updateDptInfo(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("MDI_DPTNAME", param.get("MDI_DPTNAME"));
		map.put("MDI_LINKNO", param.get("MDI_LINKNO"));
		
		int ret = base0103sDao.updateDptInfo(map);
		System.out.println("updateDptInfo ret===>" + ret);
		return ret;
	}
}
