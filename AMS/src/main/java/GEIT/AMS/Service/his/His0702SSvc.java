package GEIT.AMS.Service.his;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.his.His0702SDao;

@Service
public class His0702SSvc {

	@Autowired
	private His0702SDao His0702SDao;

	public List<Map<String, Object>> selectUserHisList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_mui_name", param.get("sch_mui_name"));
		return His0702SDao.selectUserHisList(map);
	}

}
