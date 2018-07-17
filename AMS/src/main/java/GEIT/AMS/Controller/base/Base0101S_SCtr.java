package GEIT.AMS.Controller.base;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import GEIT.AMS.Service.base.Base0101SSvc;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/base/0101")
public class Base0101S_SCtr {
	 @Autowired
	   Base0101SSvc base0101sSvc;

	private static final Logger logger = LoggerFactory.getLogger(Base0101S_SCtr.class);
	
	 // 기준정보관리 -> 시스템정보 조회
    @RequestMapping(value="/main")
    public ModelAndView System_Info(HttpServletRequest request) {
    	logger.info("System_Info:" + request.toString());
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/base/0101S_System");
	mav.addObject("SystemInfo", base0101sSvc.getSystemInfo());
	mav.addObject("DptList", base0101sSvc.selectDptList());
	return mav;
    }

    // 기준정보관리 -> 시스템정보 수정
    @RequestMapping(value = "/System_Info_Update",  method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView System_Info_Update(HttpServletRequest request, @RequestParam Map<String, Object> map) throws IOException {
    	logger.info("System_Info_Update:" + request.toString());
	ModelAndView mav = new ModelAndView();
	mav.setView(new RedirectView("/base/0101/main.do"));
	boolean result = base0101sSvc.updateSystemInfo(map);
	return mav;
    }
}
