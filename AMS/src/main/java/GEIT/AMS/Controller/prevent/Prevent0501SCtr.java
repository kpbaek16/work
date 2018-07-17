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

import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.Service.prevent.Prevent0501SSvc;
import GEIT.AMS.Service.prevent.Prevent0504SSvc;
import GEIT.AMS.Service.treat.Treat0406SSvc;
import GEIT.AMS.util.JsonUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/prevent/0501", produces = "text/json; charset=EUC-KR")
public class Prevent0501SCtr {

	@Autowired
	Prevent0501SSvc prevent0501SSvc;
	
	@Autowired
	Treat0406SSvc treat0406SSvc;

	@Autowired
	Prevent0504SSvc prevent0504SSvc;
	
	@Autowired
	private CmDocSvc cmDocSvc;

	private static final Logger logger = LoggerFactory.getLogger(Prevent0501SCtr.class);

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
		mav.setViewName("/prevent/0501S_Prev_Auto_01");
		return mav;
	}
	
	@RequestMapping(value = "/selectBukumlist")
    @ResponseBody
	public String selectBukumlist(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectBukumlist:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(prevent0501SSvc.selectBukumlist(param));
		return ret;
	}
	
	@RequestMapping(value = "/view0501E")
	public ModelAndView view0501E(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0501E:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("bukumDoc", cmDocSvc.getBukumDoc(param.get("docno").toString()));
		mav.addObject("basicDoc", cmDocSvc.getBukumBasic(param.get("docno").toString()));
		mav.addObject("bukumRpt", cmDocSvc.getBukumRpt(param.get("docno").toString()));
		mav.setViewName("/prevent/0501E_Prev_Auto_02");
		return mav;
	}
	
	@RequestMapping(value = "/view0501F")
	public ModelAndView view0501F(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0501E:" + param.toString());
		ModelAndView mav = new ModelAndView();
		/*mav.addObject("sts", prevent0504SSvc.selectStatus(param.get("JJJ_DOCNO").toString()));*/
		mav.setViewName("/prevent/0405S_Prev_Insp_01");
		return mav;
	}
	
	@RequestMapping(value = "/view0501K01")
	public ModelAndView view0501K01(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0501K01:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("K01", prevent0504SSvc.selectK01(param.get("docno").toString()));
		mav.addObject("K01_Result", prevent0504SSvc.K01_Result(param.get("code").toString(), param.get("docno2").toString()));
		mav.setViewName("/prevent/0501S_Prev_Insp_K01");
		return mav;
	}
	
	@RequestMapping(value = "/view0501K02")
	public ModelAndView view0501K02(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0501K02:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("K02", prevent0504SSvc.selectK02(param.get("docno").toString(), param.get("docno2").toString()));
		mav.setViewName("/prevent/0501S_Prev_Insp_K02");
		return mav;
	}
	
	@RequestMapping(value = "/view0501K03")
	public ModelAndView view0501K03(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0501K03:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("K03", prevent0504SSvc.selectK03(param.get("docno").toString(), param.get("docno2").toString()));
		mav.setViewName("/prevent/0501S_Prev_Insp_K03");
		return mav;
	}
	
	@RequestMapping(value = "/view0501K04")
	public ModelAndView view0501K04(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0501K04:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("K04", prevent0504SSvc.selectK04(param.get("docno").toString(), param.get("docno2").toString()));
		mav.setViewName("/prevent/0501S_Prev_Insp_K04");
		return mav;
	}
	
}
