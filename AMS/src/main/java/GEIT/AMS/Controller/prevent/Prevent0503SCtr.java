package GEIT.AMS.Controller.prevent;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import GEIT.AMS.Service.prevent.Prevent0503SSvc;
import GEIT.AMS.util.JsonUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/prevent/0503", produces = "text/json; charset=EUC-KR")
public class Prevent0503SCtr {

	@Autowired
	Prevent0503SSvc prevent0503SSvc;

	private static final Logger logger = LoggerFactory.getLogger(Prevent0503SCtr.class);

	@RequestMapping(value = "/main")
	public ModelAndView System_Info(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		cal.add(Calendar.DAY_OF_YEAR, -180); 
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/prevent/0406S_Prev_Vac_01");
		return mav;
	}
	
	@RequestMapping(value = "/selectVcnlist")
    @ResponseBody
	public String selectVcnlist(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectVcnlist:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(prevent0503SSvc.selectVcnlist(param));
		return ret;
	}
	
}
