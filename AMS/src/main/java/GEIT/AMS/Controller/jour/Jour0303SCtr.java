package GEIT.AMS.Controller.jour;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.LinkedHashMap;
import java.util.List;
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

import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.Service.jour.Jour0303SSvc;
import GEIT.AMS.util.JsonUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/jour/0303", produces = "text/json; charset=EUC-KR")
public class Jour0303SCtr {

	@Autowired
	Jour0303SSvc jour0303sSvc;
	
	@Autowired
	private CmDocSvc cmDocSvc;

	private static final Logger logger = LoggerFactory.getLogger(Jour0303SCtr.class);

	@RequestMapping(value = "/main")
	public ModelAndView main(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		cal.add(Calendar.DAY_OF_YEAR, -180); 
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));
		
		List<Map<String, Object>> vvrmList = new ArrayList<Map<String, Object>>();
		vvrmList = cmDocSvc.selectBVvrm(param);
		
		
		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		mav.addObject("vvrmList", vvrmList);
		
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/jour/0303S_Jour_Burn_01");
		return mav;
	}
	
	@RequestMapping(value = "/selectBurnReptList")
	@ResponseBody
	public String selectBurnReptList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectBurnReptList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(jour0303sSvc.selectBurnReptList(param));
		return ret;
	}
	
	@RequestMapping(value = "/view0303E")
	public ModelAndView view0304E(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0303E:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("burnInfo", cmDocSvc.getBurnInfo(param.get("docno").toString()));
		mav.addObject("vvrmList", cmDocSvc.selectBVvrm(param));
		mav.setViewName("/jour/0303E_Jour_Burn_02");
		return mav;
	}
	
	@RequestMapping(value = "/b_report_write")
	public ModelAndView b_report_write(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		cal.add(Calendar.DAY_OF_YEAR, 0); 
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));
		
		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.addObject("vvrmList", cmDocSvc.selectBVvrm(param));
		mav.setViewName("/jour/burn_write");
		
		return mav;
	}
}
