package GEIT.AMS.Service.stat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0601SDao;

@Service
public class Sta0601SSvc {

	@Autowired
	private Sta0601SDao sta0601sDao;

	public List<Map<String, Object>> selectAniClsList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		return sta0601sDao.selectAniClsList(map);
	}

	public List<Map<String, Object>> selectAniClsTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		return sta0601sDao.selectAniClsTotList(map);
	}
	
	public List<Map<String, Object>> selectTotAniClsList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		return sta0601sDao.selectTotAniClsList(map);
	}
	
	public List<Map<String, Object>> selectTotClsList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		return sta0601sDao.selectTotClsList(map);
	}
	
	public List<Map<String, Object>> selectClsList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		return sta0601sDao.selectClsList(map);
	}
}
