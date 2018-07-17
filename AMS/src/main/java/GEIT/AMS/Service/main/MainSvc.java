package GEIT.AMS.Service.main;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.main.MainDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class MainSvc {

	@Autowired
	private MainDao mainDao;
	
	/*메인 페이지 공지사항 Top 7  가져오기 */
	public List<Map<String, Object>> getRecentBoard() {
		return mainDao.getRecentBoard();
	}
	
	public List<Map<String, Object>> selectMainSch(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "All");
		map.put("schKeyword", param.get("schKeyword"));
		return mainDao.selectMainSch(map);
	}
	
	public List<Map<String, Object>> selectMainSch2(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "Name");
		map.put("schKeyword", param.get("schKeyword"));
		return mainDao.selectMainSch(map);
	}
	
	public List<Map<String, Object>> selectMainSch3(Map<String, Object> param){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "Vvrm");
		map.put("schKeyword", param.get("schKeyword"));
		return mainDao.selectMainSch(map);
	}
	
	public List<Map<String, Object>> selectMainSch4(Map<String, Object> param){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", "Code");
		map.put("schKeyword", param.get("schKeyword"));
		return mainDao.selectMainSch(map);
	}
	
	public Map<String, Object> getDocKjInfo(Map<String, Object> param) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_id, param.get(SessionParam.ss_id));

		return mainDao.getDocKjInfo(map);
	}
	
	public List<Map<String, Object>> selectDocKjList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_id, param.get(SessionParam.ss_id));

		return mainDao.selectDocKjList(map);
	}
	
	public List<Map<String, Object>> selectTotAniList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		return mainDao.selectTotAniList(map);
	}
	
	public List<Map<String, Object>> selectBsAniList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		return mainDao.selectBsAniList(map);
	}
	
	/*public List<Map<String, Object>> selectAllSearch(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("optType", "All");
		map.put("mainSearch",param.get("mainSearch"));
		return mainDao.selectComSearch(map);
	}*/
	
	public List<Map<String, Object>> selectSayukSearch(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("optType", "sayuk");
		map.put("mainSearch",param.get("mainSearch"));
		return mainDao.selectSayukSearch(map);
	}
	
	public List<Map<String, Object>> selectJinryoSearch(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("optType", "jinryo");
		map.put("mainSearch",param.get("mainSearch"));
		return mainDao.selectJinryoSearch(map);
	}
	
	public List<Map<String, Object>> selectBokunSearch(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("optType", "bokun");
		map.put("mainSearch",param.get("mainSearch"));
		return mainDao.selectBokunSearch(map);
	}
	
}
