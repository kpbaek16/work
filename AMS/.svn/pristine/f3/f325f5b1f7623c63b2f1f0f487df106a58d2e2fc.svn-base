package GEIT.AMS.Controller.jour;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.Service.jour.Jour0304SSvc;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/jour/0304", produces = "text/json; charset=EUC-KR")
public class Jour0304SCtr {

	@Autowired
	Jour0304SSvc jour0304sSvc;
	
	@Autowired
	private CmDocSvc cmDocSvc;

	private static final Logger logger = LoggerFactory.getLogger(Jour0304SCtr.class);

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
		mav.setViewName("/jour/0304S_Jour_Dead_01");
		return mav;
	}
	
	@RequestMapping(value = "/selectDethReptList")
	@ResponseBody
	public String selectDethReptList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectDethReptList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(jour0304sSvc.selectDethReptList(param));
		return ret;
	}
	
	@RequestMapping(value = "/view0304E")
	public ModelAndView view0304E(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0304E:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("dethInfo", cmDocSvc.getDethInfo(param.get("docno").toString()));
		mav.addObject("vvrmList", cmDocSvc.selectBVvrm(param));
		mav.setViewName("/jour/0304E_Jour_Dead_02");
		return mav;
	}
	@RequestMapping(value = "/p_report_write")
	public ModelAndView p_report_write(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		mav.setViewName("/jour/dead_write");
		return mav;
	}
	
	@RequestMapping(value = "/search_anicode")
	public ModelAndView animalCard(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("search_anicode");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/jour/search_code");
		return mav;
	}
	
	@RequestMapping(value = "/selectAllList")
    @ResponseBody
	public String selectAllList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAllList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(jour0304sSvc.selectAllList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAliveList")
    @ResponseBody
	public String selectAliveList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAliveList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(jour0304sSvc.selectAliveList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectDeathList")
    @ResponseBody
	public String selectDeathList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectDeathList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(jour0304sSvc.selectDeathList(param));
		return ret;
	}
	
	@RequestMapping(value = "/getAnimalInfo")
    @ResponseBody
	public String getAnimalInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("getAnimalInfo(jourajax):" + param.toString());
		String ret = null;
	    Map<String, Object> map = jour0304sSvc.getAnimalInfo(param.get("MAI_ANICODE").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	 @RequestMapping(value="/insertPS")
	    public ModelAndView insPsWrite(HttpServletRequest request, 
	    		@RequestParam(value = "PDR_PSDate", defaultValue = "") String PDR_PSDate){
	    	Map<String, Object> param = new HashMap<String,Object>();
	    	ModelAndView mav = new ModelAndView();
			return mav;
	    }
	
}
