package GEIT.AMS.Service.jour;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.jour.Jour0301SDao;

@Service
public class Jour0301SSvc {

	@Autowired
	private Jour0301SDao jour0301sDao;

	public List<Map<String, Object>> selectDayJnlList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("vlist", param.get("vlist"));
		
		return jour0301sDao.selectDayJnlList(map);
	}
	
	public Map<String, Object> selectSydailyCh(String MAI_ANICODE) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MAI_ANICODE", MAI_ANICODE);
	
		Map<String, Object> sych = jour0301sDao.selectSydailyCh(map);
		return sych;
		}
}
