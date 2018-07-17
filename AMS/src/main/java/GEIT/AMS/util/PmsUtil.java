package GEIT.AMS.util;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import GEIT.AMS.auth.SessionParam;

public class PmsUtil {
	/**
	 * PROG(공통코드 MENU01 메뉴정보)를 받아서 권한정보를 리턴한다.
	 * Return : "Y"(추가변경권한있음), "N"(읽기권한만 있음), ""(권한없음)
	 * @param String, HttpServletRequest
	 * @return String
	 */
	public static String getPMSinfo(String PROG, HttpServletRequest request){
		String ReturnVal = "";
		HttpSession session = request.getSession(false);
		String Grp = session.getAttribute(SessionParam.ss_auth_grp).toString();
		System.out.println("Grp = " + Grp);
		if(Grp.equals("SA")){
			return "Y";
		}
        String Pms = session.getAttribute(SessionParam.ss_menu_pms).toString();
        System.out.println("Pms = " + Pms);
        List<Map<String, Object>> list = JsonUtil.getListMapFromString(Pms);
        for (Map<String, Object> map : list) {
			if(map.get("MUP_PROGID").toString().equals(PROG)){
				if(map.get("MUP_UPDLVL").toString().equals("1")){
					return "Y";
				}
				else{
					if(map.get("MUP_SRCHLVL").toString().equals("1")){
						return "N";
					}
				}
			}
		}
        return ReturnVal;
	}
}
