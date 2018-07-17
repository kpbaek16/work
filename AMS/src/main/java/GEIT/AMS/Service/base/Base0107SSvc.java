package GEIT.AMS.Service.base;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0107SDao;

@Service
public class Base0107SSvc {
	@Autowired
	private Base0107SDao base0107sDao;
	
	public Map<String, Object> selectAniPagingList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("pyeType", "All");
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("cal_3", param.get("cal_3"));
		map.put("cal_4", param.get("cal_4"));
		map.put("cal_5", param.get("cal_5"));
		map.put("cal_6", param.get("cal_6"));
		map.put("schKeyword", param.get("schKeyword"));
		map.put("codeSearch", param.get("codeSearch"));
		map.put("DAIO_Place", param.get("DAIO_Place"));
		map.put("selbox", param.get("selbox"));
		map.put("sortType",param.get("sortType"));
		map.put("tmp",param.get("tmp"));
		/*map.put("del_chk",param.get("del_chk"));*/
		map.put("del_sts", param.get("del_sts"));
		map.put("gunzip",param.get("gunzip"));
		
		// paging
		map.put("PAGE_NO",param.get("PAGE_NO"));
		map.put("PAGE_ROW",param.get("PAGE_ROW"));
		map.put("PAGE_SIZE",param.get("PAGE_SIZE"));
		Map pagingMap = base0107sDao.selectAniPagingList(map);
		return pagingMap;
	}
	
	public List<Map<String, Object>> selectAllList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("pyeType", "All");
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("cal_3", param.get("cal_3"));
		map.put("cal_4", param.get("cal_4"));
		map.put("cal_5", param.get("cal_5"));
		map.put("cal_6", param.get("cal_6"));
		map.put("schKeyword", param.get("schKeyword"));
		map.put("codeSearch", param.get("codeSearch"));
		map.put("DAIO_Place", param.get("DAIO_Place"));
		map.put("selbox",param.get("selbox"));
		map.put("sortType",param.get("sortType"));
		map.put("tmp",param.get("tmp"));
		/*map.put("del_chk",param.get("del_chk"));*/
		map.put("del_sts", param.get("del_sts"));
		map.put("gunzip",param.get("gunzip"));
		return base0107sDao.selectAniList(map);
	}
	
	public List<Map<String, Object>> selectAliveList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("pyeType", "Alive");
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("cal_3", param.get("cal_3"));
		map.put("cal_4", param.get("cal_4"));
		map.put("cal_5", param.get("cal_5"));
		map.put("cal_6", param.get("cal_6"));
		map.put("schKeyword", param.get("schKeyword"));
		map.put("codeSearch", param.get("codeSearch"));
		map.put("DAIO_Place", param.get("DAIO_Place"));
		map.put("selbox",param.get("selbox"));
		map.put("tmp",param.get("tmp"));
		map.put("sortType",param.get("sortType"));
		map.put("del_sts", param.get("del_sts"));
		map.put("gunzip",param.get("gunzip"));
		return base0107sDao.selectAniList(map);
	}
	
	public List<Map<String, Object>> selectDeathList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("pyeType", "Death");
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("cal_3", param.get("cal_3"));
		map.put("cal_4", param.get("cal_4"));
		map.put("cal_5", param.get("cal_5"));
		map.put("cal_6", param.get("cal_6"));
		map.put("schKeyword", param.get("schKeyword"));
		map.put("codeSearch", param.get("codeSearch"));
		map.put("DAIO_Place", param.get("DAIO_Place"));
		map.put("selbox",param.get("selbox"));
		map.put("tmp",param.get("tmp"));
		map.put("sortType",param.get("sortType"));
		map.put("del_sts", param.get("del_sts"));
		map.put("gunzip",param.get("gunzip"));
		return base0107sDao.selectAniList(map);
	}
	
	// 강
		public List<Map<String, Object>> selectClassList(Map<String, Object> param) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("clsType", "1");
			map.put("subSchKeyword", param.get("subSchKeyword"));
			return base0107sDao.selectSubGruopList(map);
		}
		
		// 목
		public List<Map<String, Object>> selectOrderList(Map<String, Object> param) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("clsType", "2");
			map.put("mac_anicode1", param.get("anicode1"));
			map.put("subSchKeyword", param.get("subSchKeyword"));
			return base0107sDao.selectSubGruopList(map);
		}
		
		// 과
		public List<Map<String, Object>> selectFamilyList(Map<String, Object> param){
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("clsType", "3");
			map.put("mac_anicode1", param.get("anicode1"));
			map.put("mac_anicode2", param.get("anicode2"));
			map.put("subSchKeyword", param.get("subSchKeyword"));
			return base0107sDao.selectSubGruopList(map);
		}
		
		// 종
		public List<Map<String, Object>> selectSpeciesList(Map<String, Object> param){
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("clsType", "4");
			map.put("mac_anicode1", param.get("anicode1"));
			map.put("mac_anicode2", param.get("anicode2"));
			map.put("mac_anicode3", param.get("anicode3"));
			map.put("subSchKeyword", param.get("subSchKeyword"));
			return base0107sDao.selectSubGruopList(map);
		}
		
		// 상세
		public Map<String, Object> getSubDetailInfo(String mac_aniclscode) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("mac_aniclscode", mac_aniclscode);
			Map<String, Object> aniClsInfo = base0107sDao.getSubDetailInfo(map);
			return aniClsInfo;
		}
		
		// 해당 동물 최신값 구하기
		public Map<String, Object> selectMaxAnum(Map<String, Object> map) {
			return base0107sDao.selectMaxAnum(map);
		}
}
