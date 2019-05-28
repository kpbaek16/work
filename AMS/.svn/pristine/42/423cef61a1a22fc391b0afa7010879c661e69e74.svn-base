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

import GEIT.AMS.Service.stat.Sta0608SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/stat/0608", produces = "text/json; charset=EUC-KR")
public class Sta0608SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0608SCtr.class);

	@Autowired
	Sta0608SSvc sta0608sSvc;
	
	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		String year = cal.get(Calendar.YEAR)+"";
		String month = String.valueOf(cal.get(Calendar.MONTH)+1);

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("year", year);
		map.put("month", month);

		ModelAndView mav = new ModelAndView();
		mav.addObject("nowInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/stat/0608S_Sta_Dead_01");
		return mav;
	}

	@RequestMapping(value = "/selectAniDeadList")
	@ResponseBody
	public String selectAniDeadList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniDeadList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schYear", param.get("schYear"));
		map.put("schMonth", param.get("schMonth"));
		String ret = JsonUtil.getJsonStringFromList(sta0608sSvc.selectAniDeadList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniDeadTotList")
	@ResponseBody
	public String selectAniDeadTotList2(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniDeadTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schYear", param.get("schYear"));
		map.put("schMonth", param.get("schMonth"));
		String ret = JsonUtil.getJsonStringFromList(sta0608sSvc.selectAniDeadTotList(map));
		return ret;
	}
}
