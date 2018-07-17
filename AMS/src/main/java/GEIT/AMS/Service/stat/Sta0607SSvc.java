package GEIT.AMS.Service.stat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0607SDao;

@Service
public class Sta0607SSvc {

	@Autowired
	private Sta0607SDao sta0607sDao;

	public List<Map<String, Object>> selectAniBurnList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schYear", param.get("schYear"));
		return sta0607sDao.selectAniBurnList(map);
	}

	public List<Map<String, Object>> selectAniBurnTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schYear", param.get("schYear"));
		return sta0607sDao.selectAniBurnTotList(map);
	}
	
}
