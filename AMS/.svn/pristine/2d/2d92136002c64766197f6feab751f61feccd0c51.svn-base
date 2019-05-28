package GEIT.AMS.Controller.common;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import GEIT.AMS.Service.common.CmUserSvc;
import GEIT.AMS.auth.AuthUtil;
import GEIT.AMS.auth.HjptParam;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/common", produces = "text/plain; charset=EUC-KR")
public class CmUserCtr {

	private static final Logger logger = LoggerFactory.getLogger(CmUserCtr.class);

	@Autowired
	private CmUserSvc cmUserSvc;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index");
		return mav;
	}

	@RequestMapping(value = "/self_certification")
	public ModelAndView self_certification(HttpServletRequest request, @RequestParam Map<String, Object> map) {
	    String sid = (String) map.get("sid");
	    String spw = (String) map.get("spw");
	    logger.info(sid + "::" + spw);
		Map<String, Object> result = cmUserSvc.getLoginInfo(sid, spw);
	    
		ModelAndView mav = new ModelAndView();
		if (result.get("Result").equals("Null")) {
			// 아이디 없음
			mav.setView(new RedirectView("/Base/Ani_Group.do"));
		} else if (result.get("Result").equals("Empty")) {
			// 비밀번호 없음
			mav.setView(new RedirectView("/Base/Ani_Group.do"));
		} else if (result.get("Result").equals("Equal")) {
			// 비밀번호 일치
			mav.setView(new RedirectView("/Base/Ani_Group.do"));
		} else if (result.get("Result").equals("Wrong")) {
			// 비밀번호 불일치
			mav.setView(new RedirectView("/Base/Ani_Group.do"));
		}

		System.out.println("Result : " + result);
		return mav;
	}
	
	/**
	 * 행정포탈 가상 로그인
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/testlogIn", method = RequestMethod.GET)
	public ModelAndView hjptlogIn(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();

		String sid = (String) param.get(SessionParam.ss_gha_key);

		Map<String, Object> userMap = cmUserSvc.getHjptLoginInfo(sid);
		AuthUtil authUtil = new AuthUtil(request);
		HttpSession session = request.getSession(false);
		if (userMap != null) {
			if(userMap.get("MSU_ID")!=null) {
				authUtil.logIn(session, userMap);
			}else {
				authUtil.hjptLogIn(session, userMap);
				authUtil.GPKILogIn(session);
			}
		}else {
			session.setAttribute(HjptParam.GHA_KEY, sid);
		}
		mav.setView(new RedirectView("/index.do"));
		
		System.out.println("Result : " + userMap);
		return mav;
	}

	/*gpkilogIn test*/
	@ResponseBody
	@RequestMapping(value = "/gpkilogIn", method = RequestMethod.GET)
	public String gpkilogIn(@RequestParam("sid") String sid, HttpServletRequest request){
		HttpSession session = request.getSession(true);
		session.setAttribute(HjptParam.GHA_KEY, sid);
		String ret = sid ;
		return ret;
	}

	/**
	 * AMS2(고도화) 로그인
	 * @param request
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/ams2logIn", method = RequestMethod.GET)
	public ModelAndView ams2logIn(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();

		String sid = (String) param.get(SessionParam.ss_gha_key);

		AuthUtil authUtil = new AuthUtil(request);
		authUtil.logOut();
		HttpSession session = request.getSession(true);

		Map<String, Object> userMap = cmUserSvc.getHjptLoginInfo(sid);
		if (userMap != null) {
			if(userMap.get("MSU_ID")!=null) {
			    List<Map<String, Object>> menuList = cmUserSvc.selectMenuPmsList(userMap.get("MSU_USERID").toString());
			    userMap.put(SessionParam.ss_menu_pms, JsonUtil.getJsonStringFromList(menuList));
				authUtil.logIn(session, userMap);
			}else {
				authUtil.hjptLogIn(session, userMap);
				authUtil.GPKILogIn(session);
			}
		}else {
			session.setAttribute(HjptParam.GHA_KEY, sid);
		}
		
		mav.setView(new RedirectView("/index.do"));
		
		System.out.println("Result : " + userMap);
		return mav;
	}

	/**
	 * 사용자 로그인
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/logInAjax")
    @ResponseBody
	public String logInAjax(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("logInAjax:" + param.toString());
		String ret = null;

	    Map<String, Object> userInfoMap = cmUserSvc.getUserInfo(param.get("userid").toString(), param.get("pwd").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(userInfoMap);
		if (userInfoMap!=null) {
		    List<Map<String, Object>> menuList = cmUserSvc.selectMenuPmsList(param.get("userid").toString());
		    userInfoMap.put(SessionParam.ss_menu_pms, JsonUtil.getJsonStringFromList(menuList));
			AuthUtil authUtil = new AuthUtil(request);
			HttpSession session = request.getSession(false);
			authUtil.logIn(session, userInfoMap);
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}

	/**
	 * 사용자 로그아웃
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/logOut")
	public ModelAndView logOut(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		AuthUtil authUtil = new AuthUtil(request);
		authUtil.logOut();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index");
		return mav;
	}

	/**
	 * 사용자 조회
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/getUserInfo")
    @ResponseBody
	public String getUserInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("getUserInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = cmUserSvc.getUserInfo(param.get("userid").toString(), param.get("pwd").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	/**
	 * 직원 초회 등록
	 * @param request
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/regUserInfo")
    @ResponseBody
	public String regUserInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    logger.info("regUserInfo:" + param.toString());
	    
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession(false);
		
		map.put("sid", param.get("sid"));
		map.put("ss_id", param.get("sid"));
		map.put("ss_userid", param.get("userid"));
		map.put("pwd", param.get("pwd"));

		map.put("mui_name", session.getAttribute(SessionParam.ss_gha_username));
		map.put("mui_dptlvlcode", session.getAttribute(SessionParam.ss_gha_dptlvlcode));
		map.put("mui_dptlvlname", session.getAttribute(SessionParam.ss_gha_dptlvlname));
		map.put("mui_dptpositcode", session.getAttribute(SessionParam.ss_gha_dptpositcode));
		map.put("mui_dptpositname", session.getAttribute(SessionParam.ss_gha_dptpositname));
		map.put("mui_lgkeyset", session.getAttribute(SessionParam.ss_gha_key));

		int i = cmUserSvc.regUserInfo(map);
	    String qryRslt = "Y";
		if (i == 0){
			qryRslt = "N";
		}
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);

		json.put("qryRslt", qryRslt);
		
		return json.toString();

	}
	
	
	/**
	 * 사용자 등록
	 * @param request
	 * @param param
	 * @return
	 */
	@RequestMapping(value = "/createSysUser")
    @ResponseBody
	public String createSysUser(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    logger.info("createSysUser:" + param.toString());

		int i = cmUserSvc.createSysUser(param);
	    String qryRslt = "Y";
		if (i == 0){
			qryRslt = "N";
		}
	    JSONObject json = JsonUtil.getJsonStringFromMap(param);

		json.put("qryRslt", qryRslt);
		
		return json.toString();

	}
	
	/*아이디 중복 검사*/
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String idCheck(@RequestParam("ss_userid") String ss_userid, HttpServletRequest request){
		String id = request.getParameter("ss_userid");
		
		boolean flag = true;
		String str = "";
		
		if(id == null){
			id = "";
		}
		if(!id.equals("")){
			flag = cmUserSvc.idCheck(ss_userid);
		}
		if(flag)
		{
			str = "N";
		}
		else{
			str ="Y";
		}
		return str;
	}
	
	/*직원번호 삭제여부*/
	@ResponseBody
	@RequestMapping(value = "/checkDelUser", method = RequestMethod.GET)
	public String checkDelUser(@RequestParam("sid") String sid, HttpServletRequest request){
		boolean flag = cmUserSvc.isDelUserInfo(sid);
		String ret = flag? "Y" : "N" ;
		return ret;
	}
	
	/*test*/
	@ResponseBody
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(HttpServletRequest request){
		String ret = "";
        HttpSession session = request.getSession(false);
    	if (session!=null) {
    		Enumeration eSession = session.getAttributeNames();
    		while (eSession.hasMoreElements()) {
				String name = (String) eSession.nextElement();
				String value = (String) session.getAttribute(name);
				ret += name + "::" + value + "\n";
			}
		}
		return ret;
	}
}
