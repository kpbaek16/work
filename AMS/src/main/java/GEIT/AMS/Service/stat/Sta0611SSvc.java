package GEIT.AMS.Service.stat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0611SDao;

@Service
public class Sta0611SSvc {

	@Autowired
	private Sta0611SDao sta0611sDao;

	public List<Map<String, Object>> selectAniClsList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schClsCode", param.get("schClsCode"));
		map.put("schMacName", param.get("schMacName"));
		map.put("schVvrm", param.get("schVvrm"));
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("schDethType", param.get("schDethType"));
		map.put("schOrder", param.get("schOrder"));
		return sta0611sDao.selectAniClsList(map);
	}

	public List<Map<String, Object>> selectAniClsTotList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schClsCode", param.get("schClsCode"));
		map.put("schMacName", param.get("schMacName"));
		map.put("schVvrm", param.get("schVvrm"));
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("schDethType", param.get("schDethType"));
		map.put("schOrder", param.get("schOrder"));
		return sta0611sDao.selectAniClsTotList(map);
	}
	
}
