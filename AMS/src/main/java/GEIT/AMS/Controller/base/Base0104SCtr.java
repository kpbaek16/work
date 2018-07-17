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

import GEIT.AMS.Service.base.Base0104SSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/base/0104", produces = "text/json; charset=EUC-KR")
public class Base0104SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Base0104SCtr.class);
	
	@Autowired
	private Base0104SSvc base0104sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/base/0104S_User_01");
		return mav;
	}

	@RequestMapping(value = "/selectDeptList")
    @ResponseBody
	public String selectDeptList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectDeptList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", param.get("schType"));
		map.put("schKeyword", param.get("schKeyword"));
		String ret = JsonUtil.getJsonStringFromList(base0104sSvc.selectDeptList(map));
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
		String ret = JsonUtil.getJsonStringFromList(base0104sSvc.selectTeamList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectUserList")
    @ResponseBody
	public String selectUserList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectUserList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0104sSvc.selectUserList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectUserInfo")
    @ResponseBody
	public String selectUserInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectUserInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0104sSvc.selectUserInfo(param.get("mui_id").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	@RequestMapping(value = "/selectUserKjpList")
	@ResponseBody
	public String selectUserKjpList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectUserKjpList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_dptno", param.get("sch_dptno")==null? "" : param.get("sch_dptno").toString());
		map.put("sch_teamno", param.get("sch_teamno")==null? "" : param.get("sch_teamno").toString());
		map.put("sch_mui_id", param.get("sch_mui_id")==null? "" : param.get("sch_mui_id").toString());
		String ret = JsonUtil.getJsonStringFromList(base0104sSvc.selectUserKjpList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectUserRcvTypeList")
	@ResponseBody
	public String selectUserRcvTypeList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectUserRcvTypeList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("muk_rcvtype", param.get("muk_rcvtype").toString());
		map.put("muk_userid", param.get("muk_userid").toString());
		String ret = JsonUtil.getJsonStringFromList(base0104sSvc.selectUserRcvTypeList(map));
		return ret;
	}
	
	
	@RequestMapping(value = "/deleteUserRcvType")
	@ResponseBody
	public int deleteUserRcvType(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("deleteUserRcvType:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("muk_userid", param.get("muk_userid").toString());
		map.put("muk_kjid", param.get("muk_kjid").toString());
		int ret = base0104sSvc.deleteUserRcvType(map);
		return ret;
	}
	
	@RequestMapping(value = "/saveUserInfo")
	@ResponseBody
	public String saveUserInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		JSONObject json = new JSONObject();
		Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
		logger.info("saveUserInfo:" + param.toString());
		HttpSession session = request.getSession(false);
		
		int ret=0;
		if (param.get("mti_teamno")!=null && param.get("mti_teamno").toString().length() > 0) {
			Map<String, Object> mapUser = new LinkedHashMap<String, Object>();
			mapUser.put("mui_id", param.get("mag_id").toString());
			mapUser.put("mui_teamno", param.get("mti_teamno").toString());
			mapUser.put("mui_jccode", param.get("mui_jccode").toString());
			mapUser.put("mui_hptelno", param.get("mui_hptelno").toString());
			mapUser.put("mui_lincno", param.get("mui_lincno").toString());
			mapUser.put("mui_mainbiz", param.get("mui_mainbiz").toString());
			mapUser.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
			ret = base0104sSvc.updateUserInfo(mapUser);
		}

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mag_id", param.get("mag_id").toString());
		map.put("mag_grpcode", param.get("mag_grpcode").toString());
		map.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
		
		ret = base0104sSvc.createAuthGrpInfo(map);
		resultMap.put("cnt", ret);
		json.put("saveRslt", resultMap);
		return json.toString();
	}
}
