package GEIT.AMS.Controller.stat;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/stat/0612", produces = "text/json; charset=EUC-KR")
public class Sta0612SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0612SCtr.class);

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/stat/0612S_Sta_Recog_01");
		return mav;
	}

}
