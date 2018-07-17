package GEIT.AMS.Service.base;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0106SDao;

@Service
public class Base0106SSvc {
	@Autowired
	private Base0106SDao base0106sDao;

	// 강
	public List<Map<String, Object>> selectClassList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("clsType", "1");
		map.put("schKeyword", param.get("schKeyword"));
		return base0106sDao.selectAniClsList(map);
	}
	
	// 목
	public List<Map<String, Object>> selectOrderList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("clsType", "2");
		map.put("mac_anicode1", param.get("anicode1"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0106sDao.selectAniClsList(map);
	}
	
	// 과
	public List<Map<String, Object>> selectFamilyList(Map<String, Object> param){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("clsType", "3");
		map.put("mac_anicode1", param.get("anicode1"));
		map.put("mac_anicode2", param.get("anicode2"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0106sDao.selectAniClsList(map);
	}
	
	// 종
	public List<Map<String, Object>> selectSpeciesList(Map<String, Object> param){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("clsType", "4");
		map.put("mac_anicode1", param.get("anicode1"));
		map.put("mac_anicode2", param.get("anicode2"));
		map.put("mac_anicode3", param.get("anicode3"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0106sDao.selectAniClsList(map);
	}
	
	public Map<String, Object> selectAniClsInfo(String mac_aniclscode) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mac_aniclscode", mac_aniclscode);
		Map<String, Object> aniClsInfo = base0106sDao.selectAniClsInfo(map);
		return aniClsInfo;
	}
}
