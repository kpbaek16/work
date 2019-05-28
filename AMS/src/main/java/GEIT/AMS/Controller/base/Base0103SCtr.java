package GEIT.AMS.Controller.base;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import GEIT.AMS.Service.base.Base0103SSvc;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/base/0103", produces = "text/json; charset=EUC-KR")
public class Base0103SCtr {
	@Autowired
	Base0103SSvc base0103sSvc;

	private static final Logger logger = LoggerFactory.getLogger(Base0103SCtr.class);
	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("test",base0103sSvc.selectMaxNum(map));
		mav.setViewName("/base/0103S_DeptInfo_01");
		return mav;
	}
	
	// 부서 리스트
	@RequestMapping(value = "/selectDeptList")
    @ResponseBody
	public String selectDeptList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectDeptList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schType", param.get("schType"));
		map.put("schKeyword", param.get("schKeyword"));
		String ret = JsonUtil.getJsonStringFromList(base0103sSvc.selectDeptList(map));
		return ret;
	}
	
	// 팀 리스트
	@RequestMapping(value = "/selectTeamList")
    @ResponseBody
	public String selectTeamList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectTeamList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("dptno", param.get("dptno"));
		map.put("schType", param.get("schType"));
		map.put("schKeyword", param.get("schKeyword"));
		String ret = JsonUtil.getJsonStringFromList(base0103sSvc.selectTeamList(map));
		return ret;
	}
	
	// 부서 상세정보 불러오기
	@RequestMapping(value = "/selectDeptInfo")
	@ResponseBody
	public String selectDeptInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		    
		logger.info("selectDeptInfo:" + param.toString());
		String ret = null;

		Map<String, Object> map = base0103sSvc.selectDeptInfo(param.get("MDI_LINKNO").toString());
		JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
		}
	
	// 팀 상세정보 불러오기
	@RequestMapping(value = "/selectTeamInfo")
    @ResponseBody
	public String selectTeamInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectTeamInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0103sSvc.selectTeamInfo(param.get("teamno").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	@RequestMapping(value = "/updateDptInfo",  method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView updateDptInfo(HttpServletRequest request, @RequestParam Map<String, Object> map) throws IOException {
		logger.info("updateDptInfo:" + map.toString());
		logger.info("updateDptInfo:" + request.toString());
	ModelAndView mav = new ModelAndView();
	mav.setView(new RedirectView("/base/0103/main.do"));
	/*Integer result = base0103sSvc.updateDptInfo(map);*/
	return mav;
    }
}
