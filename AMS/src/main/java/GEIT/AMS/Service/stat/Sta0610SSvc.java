package GEIT.AMS.Service.stat;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0610SDao;

@Service
public class Sta0610SSvc {

	@Autowired
	private Sta0610SDao sta0604sDao;

	public List<Map<String, Object>> selectAniJnlIList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_type", param.get("sch_type"));
		map.put("cal_1", param.get("cal_1"));
		return sta0604sDao.selectAniJnlIList(map);
	}

	public List<Map<String, Object>> selectAniJnlOList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_type", param.get("sch_type"));
		map.put("cal_1", param.get("cal_1"));
		return sta0604sDao.selectAniJnlOList(map);
	}
	
	public List<Map<String, Object>> selectAniDayTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_type", param.get("sch_type"));
		map.put("cal_1", param.get("cal_1"));
		return sta0604sDao.selectAniDayTotList(map);
	}
	
	public List<Map<String, Object>> selectAniJnlOTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_type", param.get("sch_type"));
		map.put("cal_1", param.get("cal_1"));
		return sta0604sDao.selectAniDayTotList(map);
	}
	
	public List<Map<String, Object>> selectTotAniJnlList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		map.put("cal_1", param.get("cal_1"));
		
		// PREV_DAY total
		map.put("sch_type", param.get("sch_type"));
		ret.add(sta0604sDao.selectTotAniJnlInfo(map));
		
		// BASE_DAY total
		map.put("sch_type", "B"); 
		ret.add(sta0604sDao.selectTotAniJnlInfo(map));
		System.out.println(ret);
		return ret;
	}
	
	public Map<String, Object> selectTotAniJnlInfo(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_type", param.get("sch_type"));
		map.put("cal_1", param.get("cal_1"));
		return sta0604sDao.selectTotAniJnlInfo(map);
	}
	
	public Map<String, Object> selectAniClsKnjpInfo(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_type", param.get("sch_type"));
		map.put("cal_1", param.get("cal_1"));
		return sta0604sDao.selectAniClsKnjpInfo(map);
	}
	
}
