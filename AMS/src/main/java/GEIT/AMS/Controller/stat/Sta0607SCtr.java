package GEIT.AMS.Controller.stat;

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

import GEIT.AMS.Service.stat.Sta0607SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/stat/0607", produces = "text/json; charset=EUC-KR")
public class Sta0607SCtr {

	private static final Logger logger = LoggerFactory.getLogger(Sta0607SCtr.class);

	@Autowired
	Sta0607SSvc sta0607sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		String year = cal.get(Calendar.YEAR)+"";

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("year", year);

		ModelAndView mav = new ModelAndView();
		mav.addObject("nowInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/stat/0607S_Sta_Burn_01");
		return mav;
	}


	@RequestMapping(value = "/selectAniBurnList")
	@ResponseBody
	public String selectAniBurnList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniBurnList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schYear", param.get("schYear"));
		String ret = JsonUtil.getJsonStringFromList(sta0607sSvc.selectAniBurnList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniBurnTotList")
	@ResponseBody
	public String selectAniBurnTotList2(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniBurnTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schYear", param.get("schYear"));
		String ret = JsonUtil.getJsonStringFromList(sta0607sSvc.selectAniBurnTotList(map));
		return ret;
	}
}
