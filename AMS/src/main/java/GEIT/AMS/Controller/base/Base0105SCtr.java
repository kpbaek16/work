package GEIT.AMS.Controller.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import GEIT.AMS.Service.base.Base0102SSvc;
import GEIT.AMS.Service.base.Base0105SSvc;
import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/base/0105", produces = "text/json; charset=EUC-KR")
public class Base0105SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Base0105SCtr.class);

	@Autowired
	private Base0105SSvc base0105sSvc;
	
	@Autowired
	private Base0102SSvc base0102sSvc;
	
	@Autowired
	private CmDocSvc cmDocSvc;
	
	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> map, @RequestParam Map<String, Object> param) {
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> teamList = new ArrayList<Map<String, Object>>();
		teamList = base0105sSvc.showDptTeam(param);
		
		List<Map<String, Object>> patternList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "100");
		comm.put("MCC_M_CODE", "110");
		patternList = base0102sSvc.getCommonCodeListSection(comm);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("MAX",base0105sSvc.getMaxNum(map));
		mav.addObject("teamList", teamList);
		mav.addObject("patternList", patternList);
		mav.setViewName("/base/0105S_AnimalCage_01");
		return mav;
	}

	@RequestMapping(value = "/showDptTeam")
    @ResponseBody
	public String showDptTeam(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("showAnimal:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0105sSvc.showDptTeam(param));
		return ret;
	}

	@RequestMapping(value = "/selectDeptList")
    @ResponseBody
	public String selectDeptList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectDeptList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", param.get("schType"));
		map.put("schKeyword", param.get("schKeyword"));
		String ret = JsonUtil.getJsonStringFromList(base0105sSvc.selectDeptList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectTeamList")
    @ResponseBody
	public String selectTeamList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectTeamList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("dptno", param.get("dptno"));
		map.put("schType", param.get("schType"));
		map.put("schKeyword", param.get("schKeyword"));
		String ret = JsonUtil.getJsonStringFromList(base0105sSvc.selectTeamList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectVvrmList")
    @ResponseBody
	public String selectUserList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectVvrmList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("team_no", param.get("team_no"));
		map.put("schType", param.get("schType"));
		map.put("schKeyword", param.get("schKeyword"));
		String ret = JsonUtil.getJsonStringFromList(base0105sSvc.selectVvrmList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectSypattnList")
	@ResponseBody
	public String selectSypattnList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectSypattnList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mvi_vvrmno", param.get("mvi_vvrmno"));
		String ret = JsonUtil.getJsonStringFromList(base0105sSvc.selectSypattnList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectVvrmInfo")
    @ResponseBody
	public String selectUserInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectVvrmInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0105sSvc.selectVvrmInfo(param.get("mvi_vvrmno").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
		
	@RequestMapping(value = "/selectManagerList")
	@ResponseBody
	public String selectManagerList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectManagerList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("dptno", param.get("dptno")==null? "" : param.get("dptno").toString());
		map.put("team_no", param.get("team_no")==null? "" : param.get("team_no").toString());
		map.put("vvrmno", param.get("vvrmno")==null? "" : param.get("vvrmno").toString());
		map.put("sch_vvrmno", param.get("sch_vvrmno")==null? "" : param.get("sch_vvrmno").toString());
		map.put("schType", param.get("schType"));
		map.put("schKeyword", param.get("schKeyword"));
		String ret = JsonUtil.getJsonStringFromList(base0105sSvc.selectManagerList(map));
		return ret;
	}
	
	@RequestMapping(value = "/createVmlList")
    @ResponseBody
	public String createVmlList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    logger.info("createVmlList:" + param.toString());
	    
		HttpSession session = request.getSession(false);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
		map.put("vvrmno", param.get("vvrmno").toString());
		map.put("schKeyword", param.get("schKeyword"));

		if (param.get("list_Y").toString().compareTo("") == 0) {
			map.put("list_Y", null);
		} else {
			List<String> list = new ArrayList<String>();
			StringTokenizer listToken = new StringTokenizer(param.get("list_Y").toString(), ",");
			while (listToken.hasMoreElements()) {
				String value = (String) listToken.nextElement();
				list.add(value);
			}
			map.put("list_Y", list);
		}
		
		if (param.get("list_N").toString().compareTo("") == 0) {
			map.put("list_N", null);
		} else {
			List<String> list = new ArrayList<String>();
			StringTokenizer listToken = new StringTokenizer(param.get("list_N").toString(), ",");
			while (listToken.hasMoreElements()) {
				String value = (String) listToken.nextElement();
				list.add(value);
			}
			map.put("list_N", list);
		}
		
		int i = base0105sSvc.createVmlList(map);
	    String qryRslt = "Y";
		if (i == 0){
			qryRslt = "N";
		}
	    JSONObject json = JsonUtil.getJsonStringFromMap(param);

		json.put("qryRslt", qryRslt);
		
		return json.toString();

	}
}
