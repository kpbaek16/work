package GEIT.AMS.Controller.base;

import java.util.LinkedHashMap;
import java.util.Map;

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

import GEIT.AMS.Service.base.Base0120SSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/base/0120", produces = "text/json; charset=EUC-KR")
public class Base0120SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Base0120SCtr.class);
	
	@Autowired
	private Base0120SSvc base0120sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/base/0120S_AuthMenu");
		return mav;
	}

	@RequestMapping(value = "/selectAuthGrpList")
    @ResponseBody
	public String selectAuthGrpList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAuthGrpList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0120sSvc.selectAuthGrpList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAuthMenuList")
	@ResponseBody
	public String selectAuthMenuList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectAuthMenuList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0120sSvc.selectAuthMenuList(param));
		return ret;
	}
	
	
	@RequestMapping(value = "/saveAuthGrpList")
	@ResponseBody
	public String saveAuthGrpList(HttpServletRequest request, @RequestParam Map<String, Object> param,
			@RequestParam(value = "mag_id_list") String[] mag_id_list,
			@RequestParam(value = "mag_grpcode_list") String[] mag_grpcode_list,
			@RequestParam(value = "mag_st_day_list") String[] mag_st_day_list,
			@RequestParam(value = "mag_ed_day_list") String[] mag_ed_day_list) {
		logger.info("saveAuthGrpList:" + param.toString());
		JSONObject json = new JSONObject();

		String qryRslt = "N";
		int cnt = 0;
		for (int i = 0; i < mag_id_list.length; i++) {
			System.out.println(mag_id_list[i].toString() + "::" + mag_grpcode_list[i].toString() + "::"
					 + mag_st_day_list[i].toString() + "::" + mag_ed_day_list[i].toString());
			HttpSession session = request.getSession(false);
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
			map.put("mag_id", mag_id_list[i]);
			map.put("mag_grpcode", mag_grpcode_list[i]);
			map.put("mag_st_day", mag_st_day_list[i].replaceAll("-", ""));
			map.put("mag_ed_day", mag_ed_day_list[i].replaceAll("-", ""));
			
			cnt += base0120sSvc.saveAuthGrpList(map);
			qryRslt = "Y";
		}
		if (cnt == 0) {
			qryRslt = "N";
		}
		json.put("qryRslt", qryRslt);

		return json.toString();
	}
	
	@RequestMapping(value = "/saveUserPmsList")
	@ResponseBody
	public String saveUserPmsList(HttpServletRequest request, @RequestParam Map<String, Object> param,
			@RequestParam(value = "mup_userid_list") String[] mup_userid_list,
			@RequestParam(value = "mup_progid_list") String[] mup_progid_list,
			@RequestParam(value = "mup_srchlvl_list") String[] mup_srchlvl_list,
			@RequestParam(value = "mup_updlvl_list") String[] mup_updlvl_list) {
		logger.info("saveUserPmsList:" + param.toString());
		JSONObject json = new JSONObject();
		
		String qryRslt = "N";
		int cnt = 0;
		for (int i = 0; i < mup_userid_list.length; i++) {
			System.out.println(mup_userid_list[i].toString() + "::" + mup_progid_list[i].toString() + "::" + mup_srchlvl_list[i].toString() + "::"
					+ mup_updlvl_list[i].toString());
			HttpSession session = request.getSession(false);
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
			map.put("mup_userid", mup_userid_list[i]);
			map.put("mup_progid", mup_progid_list[i]);
			map.put("mup_srchlvl", mup_srchlvl_list[i]);
			map.put("mup_updlvl", mup_updlvl_list[i]);
			
			cnt += base0120sSvc.saveUserPmsList(map);
			qryRslt = "Y";
		}
		if (cnt == 0) {
			qryRslt = "N";
		}
		json.put("qryRslt", qryRslt);
		
		return json.toString();
	}

	
}
