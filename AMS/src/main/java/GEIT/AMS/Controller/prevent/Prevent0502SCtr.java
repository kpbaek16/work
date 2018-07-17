package GEIT.AMS.Controller.prevent;

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

import GEIT.AMS.Service.prevent.Prevent0502SSvc;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/prevent/0502", produces = "text/json; charset=EUC-KR")
public class Prevent0502SCtr {

	@Autowired
	Prevent0502SSvc prevent0502SSvc;

	private static final Logger logger = LoggerFactory.getLogger(Prevent0502SCtr.class);

	@RequestMapping(value = "/main")
	public ModelAndView System_Info(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		cal.add(Calendar.DAY_OF_YEAR, -365); 
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/prevent/0405S_Prev_Insp_01");
		return mav;
	}
	
	@RequestMapping(value = "/selectCategory")
    @ResponseBody
	public String selectCategory(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectCategory :" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(prevent0502SSvc.CategoryList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectDivision")
    @ResponseBody
	public String CommonCodeListDivision(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectDivision :" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(prevent0502SSvc.DivisionList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectSection")
    @ResponseBody
	public String CommonCodeListSection(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectSection :" + param.toString());	
		String ret = JsonUtil.getJsonStringFromList(prevent0502SSvc.SectionList(param));
		return ret;
	}
	
	@RequestMapping(value = "/getDetailInfo")
    @ResponseBody
	public String getDetailInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("getDetailInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = prevent0502SSvc.getDetailInfo(
	    		param.get("MCC_L_CODE").toString(),
	    		param.get("MCC_M_CODE").toString(), 
	    		param.get("MCC_S_CODE").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
}
