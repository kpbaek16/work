package GEIT.AMS.Service.his;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.his.His0703SDao;

@Service
public class His0703SSvc {

	@Autowired
	private His0703SDao His0703SDao;

	public List<Map<String, Object>> selectVvrmHisList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_mvi_vvrmname", param.get("sch_mvi_vvrmname"));
		return His0703SDao.selectVvrmHisList(map);
	}

}
