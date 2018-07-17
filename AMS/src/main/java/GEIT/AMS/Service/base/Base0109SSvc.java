package GEIT.AMS.Service.base;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0109SDao;

@Service
public class Base0109SSvc {
	@Autowired
	private Base0109SDao base0109sDao;
	
	public List<Map<String, Object>> selectVcnList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", param.get("vcn"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0109sDao.selectVcnList(map);
	}
	
	public List<Map<String, Object>> selectProdList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", param.get("prod"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0109sDao.selectVcnList(map);
	}
	
	public Map<String, Object> selectVcnInfo(String MVI_VCNNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MVI_VCNNO", MVI_VCNNO);

		Map<String, Object> vcnInfo = base0109sDao.selectVcnInfo(map);
		return vcnInfo;
		}
	
	public Map<String, Object> getMaxNumber(Map<String, Object> map) {
		return base0109sDao.getMaxNumber(map);
	}
	
}
