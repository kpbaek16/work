package GEIT.AMS.Service.jour;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.jour.Jour0303SDao;

@Service
public class Jour0303SSvc {

	@Autowired
	private Jour0303SDao jour0303sDao;

	public List<Map<String, Object>> selectBurnReptList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("schAname", param.get("schAname"));
		map.put("selbox", param.get("selbox"));
		return jour0303sDao.selectBurnReptList(map);
	}
	
}
