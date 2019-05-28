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

import GEIT.AMS.Service.stat.Sta0601SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/stat/0601", produces = "text/json; charset=EUC-KR")
public class Sta0601SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0601SCtr.class);

	@Autowired
	Sta0601SSvc sta0601sSvc;
	
	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		cal.add(Calendar.DAY_OF_YEAR, -30); 
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		
		mav.setViewName("/stat/0601S_Sta_Class_01");
		return mav;
	}

	@RequestMapping(value = "/selectAniClsList")
	@ResponseBody
	public String selectAniClsList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniClsList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		String ret = JsonUtil.getJsonStringFromList(sta0601sSvc.selectAniClsList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniClsTotList")
	@ResponseBody
	public String selectAniClsTotList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniClsTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		String ret = JsonUtil.getJsonStringFromList(sta0601sSvc.selectAniClsTotList(map));
		return ret;
	}

	@RequestMapping(value = "/selectTotAniClsList")
	@ResponseBody
	public String selectTotAniClsList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectTotAniClsList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		String ret = JsonUtil.getJsonStringFromList(sta0601sSvc.selectTotAniClsList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectTotClsList")
	@ResponseBody
	public String selectTotClsList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectTotClsList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		String ret = JsonUtil.getJsonStringFromList(sta0601sSvc.selectTotClsList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectClsList")
	@ResponseBody
	public String selectClsList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectClsList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_anicode1", param.get("sch_anicode1"));
		String ret = JsonUtil.getJsonStringFromList(sta0601sSvc.selectClsList(map));
		return ret;
	}
}
