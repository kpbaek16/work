package GEIT.AMS.Service.base;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0102SDao;

@Service
public class Base0102SSvc {

	@Autowired
	private Base0102SDao base0102sDao;

	public List<Map<String, Object>> getCommonCodeListCategory(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "Category");
		map.put("schKeyword", param.get("schKeyword"));
		return base0102sDao.getCommonCategory(map);
	}

	public List<Map<String, Object>> getCommonCodeListDivision(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "Division");
		map.put("MCC_L_CODE", param.get("MCC_L_CODE"));	
		map.put("schKeyword", param.get("schKeyword"));
		return base0102sDao.getCommonDivision(map);
	}

	public List<Map<String, Object>> getCommonCodeListSection(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "Section");
		map.put("MCC_L_CODE", param.get("MCC_L_CODE"));
		map.put("MCC_M_CODE", param.get("MCC_M_CODE"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0102sDao.getCommonSection(map);
	}
	
	public Map<String, Object> getCategoryInfo(String MCC_L_CODE) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MCC_L_CODE", MCC_L_CODE);
		Map<String, Object> getDivisionInfo = base0102sDao.getCategoryInfo(map);
		return getDivisionInfo;
	}
	
	public Map<String, Object> getDivisionInfo(String MCC_M_CODE) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MCC_M_CODE", MCC_M_CODE);
		Map<String, Object> getDivisionInfo = base0102sDao.getDivisionInfo(map);
		return getDivisionInfo;
	}

	public Map<String, Object> getSectionInfo(String MCC_L_CODE,String MCC_M_CODE,String MCC_S_CODE) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MCC_L_CODE", MCC_L_CODE);
		map.put("MCC_M_CODE", MCC_M_CODE);
		map.put("MCC_S_CODE", MCC_S_CODE);
		Map<String, Object> getSectionInfo = base0102sDao.getSectionInfo(map);
		return getSectionInfo;
	}
}
