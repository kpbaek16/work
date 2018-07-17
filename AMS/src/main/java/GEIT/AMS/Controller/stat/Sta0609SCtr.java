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

import GEIT.AMS.Service.stat.Sta0609SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/stat/0609", produces = "text/json; charset=EUC-KR")
public class Sta0609SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0609SCtr.class);

	@Autowired
	Sta0609SSvc sta0609sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> param) {
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
		
		mav.setViewName("/stat/0609S_Sta_Inout_01");
		return mav;
	}

	@RequestMapping(value = "/selectAniIoIList")
	@ResponseBody
	public String selectAniIoIList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniIoIList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("del_sts", String.valueOf(param.get("del_sts")));
		String ret = JsonUtil.getJsonStringFromList(sta0609sSvc.selectAniIoIList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniIoOList")
	@ResponseBody
	public String selectAniIoOList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniIoOList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("del_sts", String.valueOf(param.get("del_sts")));
		String ret = JsonUtil.getJsonStringFromList(sta0609sSvc.selectAniIoOList(map));
		return ret;
	}
}
