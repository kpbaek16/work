package GEIT.AMS.Service.stat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0605SDao;

@Service
public class Sta0605SSvc {

	@Autowired
	private Sta0605SDao sta0605sDao;

	public List<Map<String, Object>> selectAniBreedList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		return sta0605sDao.selectAniBreedList(map);
	}
	
	public List<Map<String, Object>> selectAniBreedTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		return sta0605sDao.selectAniBreedTotList(map);
	}
	
}
