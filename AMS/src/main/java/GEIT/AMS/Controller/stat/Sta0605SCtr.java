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

import GEIT.AMS.Service.stat.Sta0605SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/stat/0605", produces = "text/json; charset=EUC-KR")
public class Sta0605SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0605SCtr.class);

	@Autowired
	Sta0605SSvc sta0605sSvc;

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
		mav.setViewName("/stat/0605S_Sta_Breed_01");
		return mav;
	}

	@RequestMapping(value = "/selectAniBreedList")
	@ResponseBody
	public String selectAniBreedList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniBreedList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		String ret = JsonUtil.getJsonStringFromList(sta0605sSvc.selectAniBreedList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniBreedTotList")
	@ResponseBody
	public String selectAniBreedTotList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniBreedTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		String ret = JsonUtil.getJsonStringFromList(sta0605sSvc.selectAniBreedTotList(map));
		return ret;
	}
	
}
