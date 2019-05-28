package GEIT.AMS.Controller.common;

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

import GEIT.AMS.Service.common.CmCodeSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/common/code", produces = "text/plain; charset=EUC-KR")
public class CmCodeCtr {

	private static final Logger logger = LoggerFactory.getLogger(CmCodeCtr.class);

	@Autowired
	private CmCodeSvc cmCodeSvc;

	@RequestMapping(value = "/selectAniCls1List")
    @ResponseBody
	public String selectAniCls1List(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAniCls1List:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectAniCls1List(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniRankList")
	@ResponseBody
	public String selectAniRankList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectAniRankList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectAniRankList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniCitesList")
	@ResponseBody
	public String selectAniCitesList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectAniCitesList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectAniCitesList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAuthGrpList")
	@ResponseBody
	public String selectAuthGrpList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectAuthGrpList:" + param.toString());
		HttpSession session = request.getSession(false);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectAuthGrpList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectTeamAuthGrpList")
	@ResponseBody
	public String selectTeamAuthGrpList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectTeamAuthGrpList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mti_teamno", param.get("mti_teamno"));
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectTeamAuthGrpList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectVvrmList")
	@ResponseBody
	public String selectVvrmList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectVvrmList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectVvrmList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectDptList")
	@ResponseBody
	public String selectDptList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectDptList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectDptList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectDptTeamList")
	@ResponseBody
	public String selectDptTeamList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectDptTeamList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mti_dptno", param.get("mti_dptno"));
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectDptTeamList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectJccodeList")
	@ResponseBody
	public String selectJccodeList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectJccodeList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectJccodeList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectSyPtnList")
	@ResponseBody
	public String selectSyPtnList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectSyPtnList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmCodeSvc.selectSyPtnList(param));
		return ret;
	}
}
