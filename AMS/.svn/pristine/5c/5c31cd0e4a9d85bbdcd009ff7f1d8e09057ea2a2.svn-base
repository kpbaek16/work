package GEIT.AMS.Service.his;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.his.His0701SDao;

@Service
public class His0701SSvc {

	@Autowired
	private His0701SDao His0701SDao;

	public List<Map<String, Object>> selectAniHisList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_mac_name", param.get("sch_mac_name"));
		map.put("sch_aniclscode", param.get("sch_aniclscode"));
		return His0701SDao.selectAniHisList(map);
	}

}
