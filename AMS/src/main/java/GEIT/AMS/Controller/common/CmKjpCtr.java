package GEIT.AMS.Controller.common;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestParam;

import GEIT.AMS.Service.common.CmKjpSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;

public class CmKjpCtr{

	CmKjpSvc cmKjpSvc;

	private static final Logger logger = LoggerFactory.getLogger(CmKjpCtr.class);

	public CmKjpCtr(CmKjpSvc cmKjpSvc) {
		super();
		this.cmKjpSvc = cmKjpSvc;
	}

	public String selectUserKjpList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectUserKjpList:" + param.toString());
		HttpSession session = request.getSession(false);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_id, session.getAttribute(SessionParam.ss_id));
		String ret = JsonUtil.getJsonStringFromList(cmKjpSvc.selectUserKjpList(map));
		return ret;
	}
	
	public String selectUserRcvTypeList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectUserRcvTypeList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("muk_rcvtype", param.get("muk_rcvtype").toString());
		HttpSession session = request.getSession(false);
		map.put("muk_userid", session.getAttribute(SessionParam.ss_id));
		String ret = JsonUtil.getJsonStringFromList(cmKjpSvc.selectUserRcvTypeList(map));
		return ret;
	}
	
	public int deleteUserRcvType(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("deleteUserRcvType:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		HttpSession session = request.getSession(false);
		map.put("muk_userid", session.getAttribute(SessionParam.ss_id));
		map.put("muk_kjid", param.get("muk_kjid").toString());
		int ret = cmKjpSvc.deleteUserRcvType(map);
		return ret;
	}
}
