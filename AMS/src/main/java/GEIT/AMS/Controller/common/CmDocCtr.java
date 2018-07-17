package GEIT.AMS.Controller.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/common/doc", produces = "text/plain; charset=EUC-KR")
public class CmDocCtr {

	private static final Logger logger = LoggerFactory.getLogger(CmDocCtr.class);

	@Autowired
	private CmDocSvc cmDocSvc;

	@RequestMapping(value = "/getSyDailyInfo")
    @ResponseBody
	public String getSyDailyInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("getSyDailyInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = cmDocSvc.getSyDocInfo(param.get("sdj_docno").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	@RequestMapping(value = "/getBkDailyInfo")
	@ResponseBody
	public String getBkDailyInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("getBkDailyInfo:" + param.toString());
		String ret = null;
		
		Map<String, Object> map = cmDocSvc.getBkDocInfo(param.get("jbj_docno").toString());
		JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	// 동물정보 상세 
/*	@RequestMapping(value = "/getAnimalInfo")
    @ResponseBody
	public String getAnimalInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("getAnimalInfo:" + param.toString());
		String ret = null;
	    Map<String, Object> map = cmDocSvc.getAnimalInfo(param.get("MAC_ANICLSCODE").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}*/
	
	@RequestMapping(value = "/selectLayersch")
    @ResponseBody
	public String selectLayersch(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectLayersch:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmDocSvc.selectLayersch(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectLayersch2")
    @ResponseBody
	public String selectLayersch2(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectLayersch2:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmDocSvc.selectLayersch2(param));
		return ret;
	}
}
