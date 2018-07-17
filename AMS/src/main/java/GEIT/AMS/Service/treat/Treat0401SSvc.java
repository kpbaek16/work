package GEIT.AMS.Service.treat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.treat.Treat0401SDao;

@Service
public class Treat0401SSvc {

	@Autowired
	private Treat0401SDao treat0401sDao;

	public List<Map<String, Object>> selectDayJnlList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		return treat0401sDao.selectDayJnlList(map);
	}
	
}
