package GEIT.AMS.Controller.test;

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

import GEIT.AMS.Service.test.TestService;
import GEIT.AMS.auth.SessionParam;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/test")
public class TestController {

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Autowired
	private TestService testService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> map, HttpSession session, 
			SessionParam sessionParam) {
		ModelAndView mav = new ModelAndView();
		
			String ss_gha_key = (String) map.get("ss_gha_key");
			String ss_gha_username = (String) map.get("ss_gha_username");
			/*String ss_gha_dptcode = (String) map.get("ss_gha_dptcode");*/
			String ss_gha_dptname = (String) map.get("ss_gha_dptname");
			/*String ss_gha_dptcodeparnt = (String) map.get("ss_gha_dptcodeparnt");*/
			String ss_gha_dptlvlcode = (String) map.get("ss_gha_dptlvlcode");
			String ss_gha_dptlvlname = (String) map.get("ss_gha_dptlvlname");
			String ss_gha_dptpositcode = (String) map.get("ss_gha_dptpositcode");
			String ss_gha_dptpositname = (String) map.get("ss_gha_dptpositname");
			
			/*logger.info(CKEY +"::"+ Name + "::"+ DptName);*/ 
			session.setAttribute(SessionParam.ss_gha_key, ss_gha_key);
			session.setAttribute(SessionParam.ss_gha_username, ss_gha_username);
			/*session.setAttribute(SessionParam.ss_gha_dptcode, ss_gha_dptcode);*/
			session.setAttribute(SessionParam.ss_gha_dptname, ss_gha_dptname);
			/*session.setAttribute(SessionParam.ss_gha_dptcodeparnt, ss_gha_dptcodeparnt);*/
			session.setAttribute(SessionParam.ss_gha_dptlvlcode, ss_gha_dptlvlcode);
			session.setAttribute(SessionParam.ss_gha_dptlvlname, ss_gha_dptlvlname);
			session.setAttribute(SessionParam.ss_gha_dptpositcode, ss_gha_dptpositcode);
			session.setAttribute(SessionParam.ss_gha_dptpositname, ss_gha_dptpositname);
			
			
			mav.setViewName("/main/L_Main_User");
		
			
		return mav;

	}

	/*@RequestMapping(value = "/self_certification")
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
	}*/
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(@RequestParam("ss_userid") String ss_userid, HttpServletRequest request){
		String id = request.getParameter("ss_userid");
		
		boolean flag = true;
		String str = "";
		
		if(id == null){
			id = "";
		}
		if(!id.equals("")){
			flag = testService.idCheck(ss_userid);
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
}
