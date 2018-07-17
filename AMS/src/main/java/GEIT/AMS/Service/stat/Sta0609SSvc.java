package GEIT.AMS.Service.stat;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.stat.Sta0609SDao;

@Service
public class Sta0609SSvc {

	@Autowired
	private Sta0609SDao sta0609sDao;

	public List<Map<String, Object>> selectAniIoIList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("daio_iotype", "1");
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("del_sts", param.get("del_sts"));
		return sta0609sDao.selectAniIoIList(map);
	}

	public List<Map<String, Object>> selectAniIoOList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("daio_iotype", "2");
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("del_sts", param.get("del_sts"));
		return sta0609sDao.selectAniIoOList(map);
	}
	
}
