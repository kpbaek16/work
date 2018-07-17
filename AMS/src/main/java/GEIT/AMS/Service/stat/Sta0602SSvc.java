package GEIT.AMS.Service.stat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0602SDao;

@Service
public class Sta0602SSvc {

	@Autowired
	private Sta0602SDao sta0602sDao;

	public List<Map<String, Object>> selectAniVvrmList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("schVvrm", param.get("schVvrm"));
		return sta0602sDao.selectAniVvrmList(map);
	}

	public List<Map<String, Object>> selectAniVvrmTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("schVvrm", param.get("schVvrm"));
		return sta0602sDao.selectAniVvrmTotList(map);
	}
	
}
