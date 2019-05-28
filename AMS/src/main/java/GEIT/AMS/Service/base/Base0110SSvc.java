package GEIT.AMS.Service.base;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0110SDao;

@Service
public class Base0110SSvc {
	
	@Autowired
	private Base0110SDao base0110sDao;
	
	public List<Map<String, Object>> selectClsList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", param.get("schType"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0110sDao.selectClsList(param);
	}
	
	public List<Map<String, Object>> selectDrugList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MDI_CLSCODE", param.get("MDI_CLSCODE"));
		map.put("schType", param.get("schType"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0110sDao.selectDrugList(param);
	}
	
	public Map<String, Object> selectClsInfo(String MDI_CLSCODE) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MDI_CLSCODE", MDI_CLSCODE);

		Map<String, Object> clsInfo = base0110sDao.selectClsInfo(map);
		return clsInfo;
	}
	
	public Map<String, Object> selectDrugInfo(String MDI_DRUGCODE) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MDI_DRUGCODE", MDI_DRUGCODE);

		Map<String, Object> druInfo = base0110sDao.selectDrugInfo(map);
		return druInfo;
	}
	
	public Map<String, Object> getMaxNumber(Map<String, Object> map) {
		return base0110sDao.getMaxNumber(map);
	}
	
}
