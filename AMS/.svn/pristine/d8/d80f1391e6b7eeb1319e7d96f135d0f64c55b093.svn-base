package GEIT.AMS.Service.stat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0608SDao;

@Service
public class Sta0608SSvc {

	@Autowired
	private Sta0608SDao sta0608sDao;

	public List<Map<String, Object>> selectAniDeadList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schYear", param.get("schYear"));
		map.put("schMonth", param.get("schMonth"));
		return sta0608sDao.selectAniDeadList(map);
	}

	public List<Map<String, Object>> selectAniDeadTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schYear", param.get("schYear"));
		map.put("schMonth", param.get("schMonth"));
		return sta0608sDao.selectAniDeadTotList(map);
	}
		
}
