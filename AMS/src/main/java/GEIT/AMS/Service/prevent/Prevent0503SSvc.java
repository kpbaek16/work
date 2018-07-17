package GEIT.AMS.Service.prevent;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.prevent.Prevent0503SDao;

@Service
public class Prevent0503SSvc {

	@Autowired
	private Prevent0503SDao prevent0503SDao;

	public List<Map<String, Object>> selectVcnlist(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("nameKeyword", param.get("nameKeyword"));
		map.put("vvrmKeyword", param.get("vvrmKeyword"));
		map.put("prdKeyword", param.get("prdKeyword"));
		map.put("vcnKeyword", param.get("vcnKeyword"));
		return prevent0503SDao.selectVcnlist(map);
	}
	
}
