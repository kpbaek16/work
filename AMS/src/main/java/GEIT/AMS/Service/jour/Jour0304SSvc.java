package GEIT.AMS.Service.jour;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.jour.Jour0304SDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class Jour0304SSvc {

	@Autowired
	private Jour0304SDao jour0304sDao;

	public List<Map<String, Object>> selectDethReptList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("schAname", param.get("schAname"));
		map.put("selbox",param.get("selbox"));
		return jour0304sDao.selectDethReptList(map);
	}
	
	public List<Map<String, Object>> selectAllList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("pyeType", "All");
		map.put("schKeyword", param.get("schKeyword"));
		map.put("codeSearch", param.get("codeSearch"));
		map.put("selbox",param.get("selbox"));
		return jour0304sDao.search_pop_code(map);
	}
	
	public List<Map<String, Object>> selectAliveList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("pyeType", "Alive");
		map.put("schKeyword", param.get("schKeyword"));
		map.put("codeSearch", param.get("codeSearch"));
		map.put("selbox",param.get("selbox"));
		return jour0304sDao.search_pop_code(map);
	}
	
	public List<Map<String, Object>> selectDeathList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("pyeType", "Death");
		map.put("schKeyword", param.get("schKeyword"));
		map.put("codeSearch", param.get("codeSearch"));
		map.put("selbox",param.get("selbox"));
		return jour0304sDao.search_pop_code(map);
	}
	
	public Map<String, Object> getAnimalInfo(String MAI_ANICODE) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MAI_ANICODE", MAI_ANICODE);
		Map<String, Object> user = jour0304sDao.getAnimalInfo(map);
		return user;
	}
	
	public int insPsWrite(Map<String, Object> param, String PDR_DocNo, HttpServletRequest req){
	    HttpSession session = req.getSession(false);
		Map<String, Object> ps = new HashMap<String, Object>();
		ps.put("PDR_DocNo", PDR_DocNo);
		ps.put("PDR_PSDate", param.get("pdate"));
		ps.put("PDR_UserID", session.getAttribute(SessionParam.ss_id));
		ps.put("PDR_AniCode", param.get("acode"));
		ps.put("PDR_DethProc", param.get("psrn"));
		ps.put("PDR_Cmnt", param.get("bigo"));
		ps.put("PDR_WaySch", param.get("pplan"));
		ps.put("PDR_BukmReq", param.get("PDR_BukmReq"));
		ps.put("PDR_RsltDocNo", param.get("PDR_RsltDocNo"));
		ps.put("CMN_MAK_ID", session.getAttribute(SessionParam.ss_id));
		ps.put("CMN_UPD_ID", session.getAttribute(SessionParam.ss_id));
		return jour0304sDao.insPsWrite(ps);
	}
}
