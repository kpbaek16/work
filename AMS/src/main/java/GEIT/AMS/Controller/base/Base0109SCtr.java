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
import GEIT.AMS.Service.base.Base0109SSvc;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/base/0109", produces = "text/json; charset=EUC-KR")
public class Base0109SCtr {
	 @Autowired
	 private Base0109SSvc base0109sSvc;
	 
	 @Autowired
	 private Base0102SSvc base0102sSvc;

	private static final Logger logger = LoggerFactory.getLogger(Base0109SCtr.class);
	
    @RequestMapping(value="/main")
    public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> map) {
    	logger.info("index:" + request.toString());
	ModelAndView mav = new ModelAndView();
	
	Map<String, Object> comm = new HashMap<String, Object>();
	List<Map<String, Object>> unitList = new ArrayList<Map<String, Object>>();
	comm.put("MCC_L_CODE", "600");
	comm.put("MCC_M_CODE", "602");
	unitList = base0102sSvc.getCommonCodeListSection(comm);
	
	List<Map<String, Object>> inwayList = new ArrayList<Map<String, Object>>();
	comm.put("MCC_L_CODE", "600");
	comm.put("MCC_M_CODE", "603");
	inwayList = base0102sSvc.getCommonCodeListSection(comm);
	
	mav.addObject("test", base0109sSvc.getMaxNumber(map));
	mav.addObject("unitList", unitList);
	mav.addObject("inwayList", inwayList);
	mav.setViewName("/base/0109S_Vaccine_01");
	return mav;
    }
    
    @RequestMapping(value = "/selectVcnList")
    @ResponseBody
	public String selectVcnList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectVcnList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0109sSvc.selectVcnList(param));
		return ret;
	}
    
    @RequestMapping(value = "/selectProdList")
    @ResponseBody
	public String selectProdList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectProdList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0109sSvc.selectProdList(param));
		return ret;
	}
    
    
    @RequestMapping(value = "/selectVcnInfo")
	@ResponseBody
	public String selectVcnInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		    
		logger.info("selectVcnInfo:" + param.toString());
		String ret = null;

		Map<String, Object> map = base0109sSvc.selectVcnInfo(param.get("MVI_VCNNO").toString());
		JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
		}
}
