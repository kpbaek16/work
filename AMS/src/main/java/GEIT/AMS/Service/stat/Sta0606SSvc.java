package GEIT.AMS.Service.stat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0606SDao;

@Service
public class Sta0606SSvc {

	@Autowired
	private Sta0606SDao sta0606sDao;

	public List<Map<String, Object>> selectAniRentList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schDate", param.get("schDate"));
		return sta0606sDao.selectAniRentList(map);
	}

	public List<Map<String, Object>> selectAniRentTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schDate", param.get("schDate"));
		return sta0606sDao.selectAniRentTotList(map);
	}
	
}
