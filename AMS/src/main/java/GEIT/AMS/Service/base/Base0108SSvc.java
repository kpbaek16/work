package GEIT.AMS.Service.base;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0108SDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class Base0108SSvc {

	@Autowired
	private Base0108SDao base0108sDao;

	public List<Map<String, Object>> selectAniCls1List(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("clsType", "1");
		map.put("schKeyword", param.get("schKeyword"));
		return base0108sDao.selectAniClsList(map);
	}

	public List<Map<String, Object>> selectAniCls2List(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("clsType", "2");
		map.put("mac_anicode1", param.get("anicode1"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0108sDao.selectAniClsList(map);
	}

	public List<Map<String, Object>> selectAniCls3List(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("clsType", "3");
		map.put("mac_anicode1", param.get("anicode1"));
		map.put("mac_anicode2", param.get("anicode2"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0108sDao.selectAniClsList(map);
	}
	
	public List<Map<String, Object>> selectAniCls4List(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("clsType", "4");
		map.put("mac_anicode1", param.get("anicode1"));
		map.put("mac_anicode2", param.get("anicode2"));
		map.put("mac_anicode3", param.get("anicode3"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0108sDao.selectAniClsList(map);
	}
	
	public Map<String, Object> selectAniClsInfo(String mac_aniclscode) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mac_aniclscode", mac_aniclscode);

		Map<String, Object> aniClsInfo = base0108sDao.selectAniClsInfo(map);
		return aniClsInfo;
	}
	
	public List<Map<String, Object>> selectBdInspList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mac_aniclscode", param.get("mac_aniclscode"));

		return base0108sDao.selectBdInspList(map);
	}
	
	public List<Map<String, Object>> selectBdItemList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mac_aniclscode", param.get("mac_aniclscode"));
		map.put("schKeyword", param.get("schKeyword"));
		return base0108sDao.selectBdItemList(map);
	}
	
	public int createBdInspList(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		map.put("mac_aniclscode", param.get("mac_aniclscode"));
		map.put("list", param.get("list"));
		map.put("schKeyword", param.get("schKeyword"));
		
		int ret = base0108sDao.deleteBdInspList(map);
		ret += base0108sDao.createBdInspList(map);
		
		System.out.println("createBdInspList ret===>" + ret);
		return ret;
	}
	
	public List<Map<String, Object>> selectCommBdItemList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schKeyword", param.get("schKeyword"));
		return base0108sDao.selectCommBdItemList(map);
	}
	
	public Map<String, Object> selectBdItemInfo(String mcc_s_code) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mcc_s_code", mcc_s_code);

		Map<String, Object> aniClsInfo = base0108sDao.selectBdItemInfo(map);
		return aniClsInfo;
	}
	
	public int createBdItem(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		map.put("mcc_s_code", param.get("mcc_s_code"));
		map.put("mcc_s_name", param.get("mcc_s_name"));
		map.put("mcc_sort_order", param.get("mcc_sort_order"));
		map.put("mcc_com_s1", param.get("mcc_com_s1"));
		
		int ret = 0;
		if(param.get("regMode").toString().compareTo("I")==0) {
			ret = base0108sDao.insertBdItem(map);
		}else if(param.get("regMode").toString().compareTo("U")==0) {
			ret = base0108sDao.updateBdItem(map);
		}
		
		System.out.println("createBdItem ret===>" + ret);
		return ret;
	}
	
	public int deleteBdItem(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mcc_s_code", param.get("mcc_s_code"));
		
		int ret = base0108sDao.deleteBdItem(map);
		
		System.out.println("deleteBdItem ret===>" + ret);
		return ret;
	}
	
	public int updateBdInsp(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mbi_aniclscode", param.get("mbi_aniclscode"));
		map.put("mbi_bdinspcode", param.get("mbi_bdinspcode"));
		map.put("mbi_mean", param.get("mbi_mean"));
		map.put("mbi_stddevi", param.get("mbi_stddevi"));
		
		int ret = base0108sDao.updateBdInsp(map);
		
		System.out.println("updateBdInsp ret===>" + ret);
		return ret;
	}
	
}
