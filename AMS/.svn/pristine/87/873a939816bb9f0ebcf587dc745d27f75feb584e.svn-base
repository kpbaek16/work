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

import GEIT.AMS.Service.stat.Sta0604SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/stat/0604", produces = "text/json; charset=EUC-KR")
public class Sta0604SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0604SCtr.class);

	@Autowired
	Sta0604SSvc sta0604sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		cal.add(Calendar.DAY_OF_YEAR, -180); 
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/stat/0604S_Sta_Incdec_01");
		return mav;
	}

	@RequestMapping(value = "/selectAniIoIList")
	@ResponseBody
	public String selectAniIoIList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniIoIList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		String ret = JsonUtil.getJsonStringFromList(sta0604sSvc.selectAniIoIList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniIoOList")
	@ResponseBody
	public String selectAniIoOList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniIoOList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		String ret = JsonUtil.getJsonStringFromList(sta0604sSvc.selectAniIoOList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniIoITotList")
	@ResponseBody
	public String selectAniIoITotList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniIoITotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		String ret = JsonUtil.getJsonStringFromList(sta0604sSvc.selectAniIoITotList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniIoOTotList")
	@ResponseBody
	public String selectAniIoOTotList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniIoOTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		String ret = JsonUtil.getJsonStringFromList(sta0604sSvc.selectAniIoOTotList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectTotAniIoList")
	@ResponseBody
	public String selectTotAniIoList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectTotAniIoList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		String ret = JsonUtil.getJsonStringFromList(sta0604sSvc.selectTotAniIoList(map));
		return ret;
	}
}
