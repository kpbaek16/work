package GEIT.AMS.Service.prevent;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.prevent.Prevent0502SDao;

@Service
public class Prevent0502SSvc {

	@Autowired
	private Prevent0502SDao prevent0502SDao;

	public List<Map<String, Object>> CategoryList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "Category");
		map.put("schKeyword", param.get("schKeyword"));
		return prevent0502SDao.CategoryList(map);
	}
	
	public List<Map<String, Object>> DivisionList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "Division");
		map.put("MCC_L_CODE", param.get("MCC_L_CODE"));
		map.put("MCC_M_CODE", param.get("MCC_M_CODE"));
		map.put("schKeyword", param.get("schKeyword"));
		return prevent0502SDao.DivisionList(map);
	}
	
	public List<Map<String, Object>> SectionList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "Section");
		map.put("MCC_L_CODE", param.get("MCC_L_CODE"));
		map.put("MCC_M_CODE", param.get("MCC_M_CODE"));
		map.put("schKeyword", param.get("schKeyword"));
		return prevent0502SDao.SectionList(map);
	}
	
	public Map<String, Object> getDetailInfo(String MCC_L_CODE,String MCC_M_CODE,String MCC_S_CODE) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MCC_L_CODE", MCC_L_CODE);
		map.put("MCC_M_CODE", MCC_M_CODE);
		map.put("MCC_S_CODE", MCC_S_CODE);
		Map<String, Object> detailInfo = prevent0502SDao.getDetailInfo(map);
		return detailInfo;
	}
}
