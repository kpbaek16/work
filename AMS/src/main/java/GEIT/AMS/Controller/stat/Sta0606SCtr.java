package GEIT.AMS.Controller.stat;

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

import GEIT.AMS.Service.stat.Sta0606SSvc;
import GEIT.AMS.util.JsonUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/stat/0606", produces = "text/json; charset=EUC-KR")
public class Sta0606SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0606SCtr.class);

	@Autowired
	Sta0606SSvc sta0606sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", cal_1);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/stat/0606S_Sta_Rent_01");
		return mav;
	}

	@RequestMapping(value = "/selectAniRentList")
	@ResponseBody
	public String selectAniRentList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniRentList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schDate", param.get("schDate"));
		String ret = JsonUtil.getJsonStringFromList(sta0606sSvc.selectAniRentList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniRentTotList")
	@ResponseBody
	public String selectAniRentTotList2(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniRentTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schDate", param.get("schDate"));
		String ret = JsonUtil.getJsonStringFromList(sta0606sSvc.selectAniRentTotList(map));
		return ret;
	}

}
