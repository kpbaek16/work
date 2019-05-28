package GEIT.AMS.auth;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AuthUtil {
    private static HttpServletRequest request;
    private static HttpSession session;
	private static final Logger logger = LoggerFactory.getLogger(AuthUtil.class);
	
    public AuthUtil(HttpServletRequest request) {
        session = request.getSession(true);
    }

    public boolean isGPKILogin() {
        boolean ret = false;
        if (session!=null) {
			if (session.getAttribute(HjptParam.GHA_KEY) != null) {
				ret = true;
			} 
		}
		return ret;
    }
    
    public boolean isHjptLogin() {
    	boolean ret = false;
    	if (session!=null) {
    		if (session.getAttribute(SessionParam.ss_gha_key) != null) {
    			ret = true;
    		} 
    	}
    	return ret;
    }

    public boolean isUserLogin() {
    	boolean ret = false;
    	if (session!=null) {
			if (session.getAttribute(SessionParam.ss_userid) != null) {
				ret = true;
			} 
		}
		return ret;
    }
    
    public void GPKILogIn(HttpSession session) {
    	logger.info("userInfoMap::" + session.toString());
		session.setAttribute(HjptParam.GHA_KEY, session.getAttribute(SessionParam.ss_gha_key));
		session.setAttribute(HjptParam.GHA_DPTCODE, session.getAttribute(SessionParam.ss_gha_dptcode));
		session.setAttribute(HjptParam.GHA_DPTCODEPARNT, session.getAttribute(SessionParam.ss_gha_dptcodeparnt));
		session.setAttribute(HjptParam.GHA_DPTLVLCODE, session.getAttribute(SessionParam.ss_gha_dptlvlcode));
		session.setAttribute(HjptParam.GHA_DPTLVLNAME, session.getAttribute(SessionParam.ss_gha_dptlvlname));
		session.setAttribute(HjptParam.GHA_DPTNAME, session.getAttribute(SessionParam.ss_gha_dptname));
		session.setAttribute(HjptParam.GHA_DPTPOSITCODE, session.getAttribute(SessionParam.ss_gha_dptpositcode));
		session.setAttribute(HjptParam.GHA_DPTPOSITNAME, session.getAttribute(SessionParam.ss_gha_dptpositname));
		session.setAttribute(HjptParam.GHA_USERNAME, session.getAttribute(SessionParam.ss_gha_username));
    }
    
    public void hjptLogIn(HttpSession session, Map userInfoMap) {
    	System.out.println("userInfoMap::" + userInfoMap);
		session.setAttribute(SessionParam.ss_gha_key, userInfoMap.get("MUI_LGKEYSET"));
		session.setAttribute(SessionParam.ss_gha_username, userInfoMap.get("MUI_NAME"));
		session.setAttribute(SessionParam.ss_gha_dptcode, userInfoMap.get("MTI_DPTNO"));
		session.setAttribute(SessionParam.ss_gha_dptname, userInfoMap.get("MDI_DPTNAME"));
		session.setAttribute(SessionParam.ss_gha_dptlvlcode, userInfoMap.get("MUI_DPTLVLCODE"));
		session.setAttribute(SessionParam.ss_gha_dptlvlname, userInfoMap.get("MUI_DPTLVLNAME"));
		session.setAttribute(SessionParam.ss_gha_dptpositcode, userInfoMap.get("MUI_DPTPOSITCODE"));
		session.setAttribute(SessionParam.ss_gha_dptpositname, userInfoMap.get("MUI_DPTPOSITNAME"));
    }
    
    public void logIn(HttpSession session, Map userInfoMap) {
    	logger.info("userInfoMap::" + userInfoMap);
		session.setAttribute(SessionParam.ss_gha_username, userInfoMap.get("MUI_NAME"));
		session.setAttribute(SessionParam.ss_gha_dptcode, userInfoMap.get("MTI_DPTNO")); //temp..
		session.setAttribute(SessionParam.ss_gha_dptname, userInfoMap.get("MDI_DPTNAME"));
		session.setAttribute(SessionParam.ss_gha_dptlvlcode, userInfoMap.get("MUI_DPTLVLCODE"));
		session.setAttribute(SessionParam.ss_gha_dptlvlname, userInfoMap.get("MUI_DPTLVLNAME"));
		session.setAttribute(SessionParam.ss_gha_dptpositcode, userInfoMap.get("MUI_DPTPOSITCODE"));
		session.setAttribute(SessionParam.ss_gha_dptpositname, userInfoMap.get("MUI_DPTPOSITNAME"));
		session.setAttribute(SessionParam.ss_id, userInfoMap.get("MUI_ID"));
		
		session.setAttribute(SessionParam.ss_userid, userInfoMap.get("MSU_USERID"));
		session.setAttribute(SessionParam.ss_msu_aprv_yn, userInfoMap.get("MSU_APRV_YN"));
		session.setAttribute(SessionParam.ss_pmslvl, userInfoMap.get("MSU_PMSLVL"));
		session.setAttribute(SessionParam.ss_pwd, userInfoMap.get("MSU_PWD"));
		session.setAttribute(SessionParam.ss_mti_dptno, userInfoMap.get("MTI_DPTNO"));
		session.setAttribute(SessionParam.ss_teamno, userInfoMap.get("MUI_TEAMNO"));
		session.setAttribute(SessionParam.ss_auth_grp, userInfoMap.get("MAG_GRPCODE"));
		session.setAttribute(SessionParam.ss_menu_pms, userInfoMap.get(SessionParam.ss_menu_pms));
		session.setAttribute(SessionParam.ss_is_vm, userInfoMap.get("IS_VM"));
    }
    
    public void logOut() {
    	if (session!=null) {
			session.invalidate();
		}
    }

}