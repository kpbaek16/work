package GEIT.AMS.Controller;

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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import GEIT.AMS.Service.UserService;
import GEIT.AMS.auth.AuthUtil;
import GEIT.AMS.auth.SessionParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    /**
     * Simply selects the home view to render by returning its name.
     */

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(false);
		AuthUtil authUtil = new AuthUtil(request);
		if (authUtil.isUserLogin()) {
		    mav.setView(new RedirectView("/main/L_Main_Admin.do"));
		}else if (authUtil.isGPKILogin()) {
			if (authUtil.isHjptLogin()) {
				if(session.getAttribute(SessionParam.ss_userid)!=null) {
					mav.setViewName("/index");
				}else {
				    mav.setView(new RedirectView("/main/L_Main_User.do"));
				}
			}else {
				session.invalidate();
				mav.setViewName("/common/Error"); //삭제된 사용자
			}
		}else {
			mav.setViewName("index");
		}

		return mav;
	}

    @RequestMapping(value = "/potal_certification", method = RequestMethod.GET)
    public ModelAndView potal_certification(HttpServletRequest request, @RequestParam("CKey") String CKey) {
	ModelAndView mav = new ModelAndView();
	return mav;
    }

    @RequestMapping(value = "/self_certification", method = RequestMethod.POST)
    public ModelAndView self_certification(HttpServletRequest request, @RequestParam("loginId") String id, @RequestParam("passWord") String pw) {
	ModelAndView mav = new ModelAndView();
	
	Map<String, Object> result = userService.getLoginInfo(id, pw);

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

    /*******************************************************************************/

    // header
    @RequestMapping(value = "/header")
    public ModelAndView header(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/inc/header");
	return mav;
    }

    // menu bar
    @RequestMapping(value = "/lnb")
    public ModelAndView lnb(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/inc/lnb");
	return mav;
    }

    // footer
    @RequestMapping(value = "/footer")
    public ModelAndView footer(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/inc/footer");
	return mav;
    }

    // start
    @RequestMapping(value = "/start")
    public ModelAndView start(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/inc/start");
	return mav;
    }
    
    /*******************************************************************************/ 
    
}
