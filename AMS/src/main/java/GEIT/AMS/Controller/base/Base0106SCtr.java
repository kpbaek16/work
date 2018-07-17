package GEIT.AMS.Controller.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import GEIT.AMS.Service.base.Base0102SSvc;
import GEIT.AMS.Service.base.Base0106SSvc;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/base/0106", produces = "text/json; charset=EUC-KR")
public class Base0106SCtr {
	
	private static final Logger logger = LoggerFactory.getLogger(Base0106SCtr.class);
	
	@Autowired
	private Base0106SSvc base0106sSvc;
	
	@Autowired
	private Base0102SSvc base0102sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> citesList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "206");
		citesList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> endangList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "207");
		endangList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> rankList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "205");
		rankList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> estmList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "212");
		estmList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> kjjList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "211");
		kjjList = base0102sSvc.getCommonCodeListSection(comm);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("citesList", citesList);
		mav.addObject("endangList", endangList);
		mav.addObject("rankList", rankList);
		mav.addObject("estmList", estmList);
		mav.addObject("kjjList", kjjList);
		mav.setViewName("/base/0106S_AniGroup");
		
		return mav;
	}
	
	// 강
	@RequestMapping(value = "/selectClassList")
    @ResponseBody
	public String selectClassList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectClassList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0106sSvc.selectClassList(param));
		return ret;
	}
	
	// 목
	@RequestMapping(value = "/selectOrderList")
    @ResponseBody
	public String selectOrderList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectOrderList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0106sSvc.selectOrderList(param));
		return ret;
	}
	
	// 과
	@RequestMapping(value = "/selectFamilyList")
    @ResponseBody
	public String selectAniCls3List(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectFamilyList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0106sSvc.selectFamilyList(param));
		return ret;
	}
	
	// 종
	@RequestMapping(value = "/selectSpeciesList")
    @ResponseBody
	public String selectSpeciesList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectSpeciesList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0106sSvc.selectSpeciesList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniClsInfo")
    @ResponseBody
	public String selectAniClsInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAniInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0106sSvc.selectAniClsInfo(param.get("mac_aniclscode").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}

}
