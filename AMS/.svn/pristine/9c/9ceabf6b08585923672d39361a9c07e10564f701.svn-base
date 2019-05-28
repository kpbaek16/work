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

import GEIT.AMS.Service.stat.Sta0610SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/stat/0610", produces = "text/json; charset=EUC-KR")
public class Sta0610SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0610SCtr.class);

	@Autowired
	Sta0610SSvc sta0610sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", cal_1);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/stat/0610S_Sta_Month_01");
		return mav;
	}

	@RequestMapping(value = "/selectAniJnlIList")
	@ResponseBody
	public String selectAniJnlIList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniJnlIList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		String ret = JsonUtil.getJsonStringFromList(sta0610sSvc.selectAniJnlIList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniJnlOList")
	@ResponseBody
	public String selectAniJnlOList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniJnlOList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		String ret = JsonUtil.getJsonStringFromList(sta0610sSvc.selectAniJnlOList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniPrevTotList")
	@ResponseBody
	public String selectAniPrevTotList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniPrevTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_type", param.get("sch_type"));
		map.put("cal_1", param.get("cal_1"));
		String ret = JsonUtil.getJsonStringFromList(sta0610sSvc.selectAniDayTotList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniDayTotList")
	@ResponseBody
	public String selectAniDayTotList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectAniDayTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_type", "B");
		map.put("cal_1", param.get("cal_1"));
		String ret = JsonUtil.getJsonStringFromList(sta0610sSvc.selectAniDayTotList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniJnlOTotList")
	@ResponseBody
	public String selectAniJnlOTotList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniJnlOTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		String ret = JsonUtil.getJsonStringFromList(sta0610sSvc.selectAniJnlOTotList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectTotAniJnlList")
	@ResponseBody
	public String selectTotAniJnlList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectTotAniJnlList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sch_type", param.get("sch_type"));
		map.put("cal_1", param.get("cal_1"));
		String ret = JsonUtil.getJsonStringFromList(sta0610sSvc.selectTotAniJnlList(map)).toString();
		System.out.println(ret);
		return ret;
	}
	
	@RequestMapping(value = "/selectAniClsKnjpInfo")
	@ResponseBody
	public String selectAniClsKnjpInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectAniClsKnjpInfo:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		String ret = JsonUtil.getJsonStringFromMap(sta0610sSvc.selectAniClsKnjpInfo(map)).toString();
		return ret;
	}
}
