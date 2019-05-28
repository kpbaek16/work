package GEIT.AMS.Controller.treat;

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

import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.Service.treat.Treat0401SSvc;
import GEIT.AMS.util.JsonUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/treat/0401", produces = "text/json; charset=EUC-KR")
public class Treat0401SCtr {

	@Autowired
	Treat0401SSvc treat0401sSvc;

	@Autowired
	private CmDocSvc cmDocSvc;

	private static final Logger logger = LoggerFactory.getLogger(Treat0401SCtr.class);

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
		mav.setViewName("/treat/0401S_Treat_Health_01");
		return mav;
	}

	@RequestMapping(value = "/selectDayJnlList")
	@ResponseBody
	public String selectDayJnlList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectDayJnlList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		String ret = JsonUtil.getJsonStringFromList(treat0401sSvc.selectDayJnlList(map));
		return ret;
	}

	@RequestMapping(value = "/view0401E")
	public ModelAndView view0401E(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0401E:" + param.toString());
		ModelAndView mav = new ModelAndView();
	/*	mav.addObject("docInfo", cmDocSvc.getBkDocInfo(param.get("docno").toString()));
		mav.addObject("cntInfo", cmDocSvc.getBKJinCnt(param.get("docno").toString()));
		mav.addObject("ImsInfo", cmDocSvc.getImsangTest(param.get("docno").toString()));*/
		mav.setViewName("/treat/0401E_Treat_Health_02");
		return mav;
	}

	/*@RequestMapping(value = "/view0401E1")
	public ModelAndView view0401E1(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0401E1:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/treat/0401E_Treat_Health_02_01");
		return mav;
	}

	@RequestMapping(value = "/view0401E2")
	public ModelAndView view0401E2(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0401E2:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/treat/0401E_Treat_Health_02_02");
		return mav;
	}

	@RequestMapping(value = "/view0401E3")
	public ModelAndView view0401E3(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0401E2:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/treat/0401E_Treat_Health_02_03");
		return mav;
	}*/
}
