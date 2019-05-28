package GEIT.AMS.Service.stat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0604SDao;

@Service
public class Sta0604SSvc {

	@Autowired
	private Sta0604SDao sta0604sDao;

	public List<Map<String, Object>> selectAniIoIList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		return sta0604sDao.selectAniIoIList(map);
	}

	public List<Map<String, Object>> selectAniIoOList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		return sta0604sDao.selectAniIoOList(map);
	}
	
	public List<Map<String, Object>> selectAniIoITotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("daio_iotype", "1");
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		return sta0604sDao.selectAniIoTotList(map);
	}
	
	public List<Map<String, Object>> selectAniIoOTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("daio_iotype", "2");
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		return sta0604sDao.selectAniIoTotList(map);
	}
	
	public List<Map<String, Object>> selectTotAniIoList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		return sta0604sDao.selectTotAniIoList(map);
	}
	
}
