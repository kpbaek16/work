package GEIT.AMS.Service.treat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.treat.Treat0405SDao;

@Service
public class Treat0405SSvc {

	@Autowired
	private Treat0405SDao treat0405sDao;

	public List<Map<String, Object>> selectAnesList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("divKeyword", param.get("divKeyword"));
		map.put("drugKeyword", param.get("drugKeyword"));
		map.put("nameKeyword", param.get("nameKeyword"));
		return treat0405sDao.selectAnesList(map);
	}
	
}
