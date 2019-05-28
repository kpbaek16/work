package GEIT.AMS.Controller.his;

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

import GEIT.AMS.Service.his.His0703SSvc;
import GEIT.AMS.util.JsonUtil;

@Controller
@RequestMapping(value = "/his/0703", produces = "text/json; charset=EUC-KR")
public class His0703SCtr {

	@Autowired
	His0703SSvc his0703sSvc;

	private static final Logger logger = LoggerFactory.getLogger(His0703SCtr.class);

	@RequestMapping(value = "/main")
	public ModelAndView System_Info(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH)) + "-" + df.format(cal.get(Calendar.DATE));
		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/his/S_His_Vvrm_01");
		return mav;
	}
	
	@RequestMapping(value = "/selectVvrmHisList")
	@ResponseBody
	public String selectVvrmHisList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectVvrmHisList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("sch_mvi_vvrmname", param.get("sch_mvi_vvrmname"));
		String ret = JsonUtil.getJsonStringFromList(his0703sSvc.selectVvrmHisList(map));
		return ret;
	}

}
