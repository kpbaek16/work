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
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import GEIT.AMS.Service.base.Base0102SSvc;
import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.Service.common.CmFileSvc;
import GEIT.AMS.Service.jour.Jour0301ESvc;
import GEIT.AMS.Service.jour.Jour0301SSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/jour/0301", produces = "text/json; charset=EUC-KR")
public class Jour0301SCtr {

	@Autowired
	Jour0301SSvc jour0301sSvc;
	
	@Autowired
	Jour0301ESvc jour0301eSvc;
	
	@Autowired
	Base0102SSvc base0102sSvc;

	@Autowired
	private CmDocSvc cmDocSvc;

	@Autowired
	private CmFileSvc cmFileSvc;
	 
	private static final Logger logger = LoggerFactory.getLogger(Jour0301SCtr.class);
	
	 // tab01
    @RequestMapping(value = "/tab01")
    public ModelAndView tab01(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/jour/0301E_Jour_jour_tab01");
	return mav;
    }
    
    // tab02
    @RequestMapping(value = "/tab02")
    public ModelAndView tab02(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/jour/0301E_Jour_jour_tab02");
	return mav;
    }
    
    // tab03
    @RequestMapping(value = "/tab03")
    public ModelAndView tab03(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/jour/0301E_Jour_jour_tab03");
	return mav;
    }
    
    // tab04
    @RequestMapping(value = "/tab04")
    public ModelAndView tab04(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/jour/0301E_Jour_jour_tab04");
	return mav;
    }
    
    // tab05
    @RequestMapping(value = "/tab05")
    public ModelAndView tab05(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/jour/0301E_Jour_jour_tab05");
	return mav;
    }
    
    @RequestMapping(value = "/getCheckAnimal")
    @ResponseBody
    public String getCheckAnimal(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	
	logger.info("getCheckAnimal:" + param.toString());
	String ret = null;

    Map<String, Object> map = cmDocSvc.getCheckAnimal(param.get("MAI_ANICODE").toString());
    
    JSONObject json = JsonUtil.getJsonStringFromMap(map);
	if (map!=null) {
		ret = json.toString();
	}
	logger.info("ret:" + ret);
	return ret;
    }

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
		mav.setViewName("/jour/0301S_Jour_Jour_01");
		return mav;
	}

	@RequestMapping(value = "/selectDayJnlList")
	@ResponseBody
	public String selectDayJnlList(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectDayJnlList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("vlist", param.get("vlist"));
		String ret = JsonUtil.getJsonStringFromList(jour0301sSvc.selectDayJnlList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectSydailyCh")
    @ResponseBody
	public String selectSydailyCh(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectSydailyCh:" + param.toString());
		String ret = null;

	    Map<String, Object> map = jour0301sSvc.selectSydailyCh(param.get("MAI_ANICODE").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}

	@RequestMapping(value = "/view0301E")
	public ModelAndView view0301E(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0301E:" + param.toString());
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> weatherList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "100");
		comm.put("MCC_M_CODE", "106");
		weatherList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> facilityList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "100");
		comm.put("MCC_M_CODE", "108");
		facilityList = base0102sSvc.getCommonCodeListSection(comm);
		
		mav.addObject("facilityList", facilityList);
		mav.addObject("weatherList",weatherList);
		mav.addObject("aniCount",cmDocSvc.selectAniCount(param.get("vvrmno").toString(), param.get("date").toString()));
		mav.addObject("sdj01Cmnt",cmDocSvc.getSDJ01Cmnt(param.get("docno").toString()));
		mav.addObject("sdj05Msg",cmDocSvc.getSDJ05Msg(param.get("docno").toString()));
		mav.addObject("loanInfo",cmDocSvc.getSyLoanInfo(param.get("vvrmno").toString(), param.get("date").toString()));
		mav.addObject("jnl03sj", jour0301eSvc.selectJNL03_SJ(param.get("docno").toString()));
		
		mav.addObject("jnl02sp",jour0301eSvc.selectJnl02_SP(param.get("docno").toString()));
		mav.addObject("sdj02ae",jour0301eSvc.selctSDJ02_AE(param.get("docno").toString()));
		mav.addObject("jnl01ch",jour0301eSvc.selctJNL01_CH(param.get("docno").toString()));
		
		
		/*동물및 시설점검*/
		/*동물사 온도*/
		mav.addObject("svgtemp",jour0301eSvc.getSVG_TEMP(param.get("docno").toString()));
		/*내외 순찰실적, 시설점검 특이사항, 개선사항*/
		mav.addObject("sdjsj",jour0301eSvc.getSDJ_SJ(param.get("docno").toString()));
		
		/*사육관리*/
		/*사료관리(종별)*/
		mav.addObject("sdj03species", jour0301eSvc.selectSDJ03_Species(param.get("vvrmno").toString()));
		/*사료관리(개별)*/
		mav.addObject("sdj03anilist", jour0301eSvc.selectSDJ03_aniList(param.get("vvrmno").toString()));
		/*Select 동물사육관리 , 위생 및 방역관리*/
		mav.addObject("sdj02aAniprv",jour0301eSvc.getSDJ02_AniPrv(param.get("docno").toString()));
		/*Select 안전교육 등 관리 , 기타*/
		mav.addObject("sdjseCmnt",jour0301eSvc.getSDJ_SafeEtc_CMNT(param.get("docno").toString()));
		
		mav.addObject("docInfo", cmDocSvc.getSyDocInfo(param.get("docno").toString()));
		mav.addObject("vvrmList", cmDocSvc.getSyVvrmList(param.get("docno").toString()));
		mav.addObject("ssPath", cmFileSvc.getSsUploadPath());
		mav.addObject("ssFileList", cmFileSvc.selectSsFileList(param.get("docno").toString()));
		mav.addObject("syPath", cmFileSvc.getSyUploadPath());
		mav.addObject("syFileList", cmFileSvc.selectSyFileList(param.get("docno").toString()));
		mav.addObject("ae_popup", jour0301eSvc.selectAE_popup(param.get("vvrmno").toString()));
		mav.setViewName("/jour/0301E_Jour_Jour_02");
		return mav;
	}
	
	@RequestMapping(value="/layer03_Search")
    public ModelAndView main_Manual(HttpServletRequest request, @RequestParam Map<String, Object> param) {
    	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("/jour/0301E_Jour_jour_tab02");
		return mav;
    }
}
