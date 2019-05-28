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
import GEIT.AMS.Service.base.Base0110SSvc;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/base/0110", produces = "text/json; charset=EUC-KR")
public class Base0110SCtr {
private static final Logger logger = LoggerFactory.getLogger(Base0110SCtr.class);
	
	@Autowired
	private Base0110SSvc base0110sSvc;
	
	@Autowired
	 private Base0102SSvc base0102sSvc;
	
	@RequestMapping(value = "/main")
	public ModelAndView main(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> typeList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "600");
		comm.put("MCC_M_CODE", "601");
		typeList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> unitList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "600");
		comm.put("MCC_M_CODE", "602");
		unitList = base0102sSvc.getCommonCodeListSection(comm);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("Number", base0110sSvc.getMaxNumber(map));
		mav.addObject("typeList", typeList);
		mav.addObject("unitList", unitList);
		mav.setViewName("/base/0110S_Medicine_01");
		return mav;
	}
	
	@RequestMapping(value = "/selectClsList")
    @ResponseBody
	public String selectClsList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectClsList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0110sSvc.selectClsList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectDrugList")
    @ResponseBody
	public String selectDrugList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectDrugList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0110sSvc.selectDrugList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectClsInfo")
    @ResponseBody
	public String selectClsInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectClsInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0110sSvc.selectClsInfo(param.get("MDI_CLSCODE").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	@RequestMapping(value = "/selectDrugInfo")
    @ResponseBody
	public String selectDrugInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectDrugInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0110sSvc.selectDrugInfo(param.get("MDI_DRUGCODE").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	
	

}
