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

import GEIT.AMS.Service.stat.Sta0611SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/stat/0611", produces = "text/json; charset=EUC-KR")
public class Sta0611SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Sta0611SCtr.class);

	@Autowired
	Sta0611SSvc sta0611sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		cal.add(Calendar.DAY_OF_YEAR, -300); 
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		
		mav.setViewName("/stat/0611S_Sta_Jong_01");
		return mav;
	}

	@RequestMapping(value = "/selectAniClsList")
	@ResponseBody
	public String selectAniClsList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectAniClsList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schClsCode", param.get("schClsCode"));
		map.put("schMacName", param.get("schMacName"));
		map.put("schVvrm", param.get("schVvrm"));
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("schDethType", param.get("schDethType"));
		map.put("schOrder", param.get("schOrder"));
		String ret = JsonUtil.getJsonStringFromList(sta0611sSvc.selectAniClsList(map));
		return ret;
	}

	@RequestMapping(value = "/selectAniClsTotList")
	@ResponseBody
	public String selectAniClsTotList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectAniClsTotList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schClsCode", param.get("schClsCode"));
		map.put("schMacName", param.get("schMacName"));
		map.put("schVvrm", param.get("schVvrm"));
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("schDethType", param.get("schDethType"));
		map.put("schOrder", param.get("schOrder"));
		String ret = JsonUtil.getJsonStringFromList(sta0611sSvc.selectAniClsTotList(map));
		return ret;
	}

}
