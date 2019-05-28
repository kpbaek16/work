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

import GEIT.AMS.Service.stat.Sta0602SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/stat/0602", produces = "text/json; charset=EUC-KR")
public class Sta0602SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0602SCtr.class);

	@Autowired
	Sta0602SSvc sta0602sSvc;

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
		mav.setViewName("/stat/0602S_Sta_Vvrm_01");
		return mav;
	}


	@RequestMapping(value = "/selectAniVvrmList")
	@ResponseBody
	public String selectAniVvrmList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectAniVvrmList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("schVvrm", param.get("schVvrm"));
		String ret = JsonUtil.getJsonStringFromList(sta0602sSvc.selectAniVvrmList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniVvrmTotList")
	@ResponseBody
	public String selectAniVvrmTotList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniVvrmTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("schVvrm", param.get("schVvrm"));
		String ret = JsonUtil.getJsonStringFromList(sta0602sSvc.selectAniVvrmTotList(map));
		return ret;
	}
}
