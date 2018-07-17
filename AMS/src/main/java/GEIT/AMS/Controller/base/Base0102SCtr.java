package GEIT.AMS.Controller.base;

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
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/base/0102", produces = "text/json; charset=EUC-KR")
public class Base0102SCtr {
	@Autowired
	Base0102SSvc base0102sSvc;

	private static final Logger logger = LoggerFactory.getLogger(Base0102SCtr.class);

	@RequestMapping("/main")
	 public ModelAndView Common_Code(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		/*mav.addObject("CommonCode",base0102sSvc.getCommonCode());*/
		mav.setViewName("/base/0102S_CommonCode");
		return mav;
	}
	
	@RequestMapping(value = "/selectCategory")
    @ResponseBody
	public String selectCategory(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectCategory :" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0102sSvc.getCommonCodeListCategory(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectDivision")
    @ResponseBody
	public String CommonCodeListDivision(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectDivision :" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0102sSvc.getCommonCodeListDivision(param));
		return ret;
	}

	@RequestMapping(value = "/selectSection")
    @ResponseBody
	public String CommonCodeListSection(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectSection :" + param.toString());	
		String ret = JsonUtil.getJsonStringFromList(base0102sSvc.getCommonCodeListSection(param));
		return ret;
	}
	
	@RequestMapping(value = "/getCategoryInfo")
    @ResponseBody
	public String getCategoryInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("getCategoryInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0102sSvc.getCategoryInfo(
	    		param.get("MCC_L_CODE").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	@RequestMapping(value = "/getDivisionInfo")
    @ResponseBody
	public String getDivisionInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("getDivisionInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0102sSvc.getDivisionInfo(
	    		param.get("MCC_M_CODE").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	@RequestMapping(value = "/getSectionInfo")
    @ResponseBody
	public String getSectionInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAniInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0102sSvc.getSectionInfo(
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
