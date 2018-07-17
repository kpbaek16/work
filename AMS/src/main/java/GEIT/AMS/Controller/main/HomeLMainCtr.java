package GEIT.AMS.Controller.main;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import GEIT.AMS.Dao.common.CmDocDao;
import GEIT.AMS.Service.biz.Biz0202SSvc;
import GEIT.AMS.Service.main.MainSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/main",produces = "text/json; charset=EUC-KR" )
public class HomeLMainCtr {

	private static final Logger logger = LoggerFactory.getLogger(HomeLMainCtr.class);
	
	@Autowired
	private MainSvc mainSvc;
	
	@Autowired
	private Biz0202SSvc biz0202sSvc;
	
	@Autowired
	private CmDocDao cmDocDao;

	@RequestMapping(value = "/L_Main_Admin")
	public ModelAndView mainAdmin(HttpServletRequest request, @RequestParam Map<String, Object> param, 
			@RequestParam(defaultValue="All") String optType,
            @RequestParam(defaultValue="") String mainSearch) {
		logger.info("L_Main_Admin:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/L_Main_Admin");
		List<Map<String, Object>> bizlist = biz0202sSvc.selectBizArticleList(param);
		mav.addObject("Bizlist", bizlist);
		mav.addObject("gb", mainSvc.getRecentBoard());
		
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession(false);
		map.put(SessionParam.ss_id, session.getAttribute(SessionParam.ss_id));
		mav.addObject("kjInfo", mainSvc.getDocKjInfo(map));
		mav.addObject("kjList", mainSvc.selectDocKjList(map));
		mav.addObject("schRstAnimal",cmDocDao.showAnimal(map));
		mav.addObject("chartTotAni", selectTotAniList(request,param));
		mav.addObject("chartBsAni", selectBsAniList(request,param));
		
		map.put("optType",optType);
		map.put("mainSearch",mainSearch);
		mav.addObject("sch",map);
		return mav;
	}
	
	@RequestMapping(value = "/showAnimal")
    @ResponseBody
	public String showAnimal(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("showAnimal:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmDocDao.showAnimal(param));
		return ret;
	}
	
	@RequestMapping(value = "/L_Main_User")
	public ModelAndView mainUser(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("L_Main_User:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/main/L_Main_User");
		mav.addObject("gb", mainSvc.getRecentBoard());
		
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession(false);
		map.put(SessionParam.ss_id, session.getAttribute(SessionParam.ss_id));
		mav.addObject("kjInfo", mainSvc.getDocKjInfo(map));
		mav.addObject("kjList", mainSvc.selectDocKjList(map));
		return mav;
	}
	
	@RequestMapping(value = "/selectMainSch")
    @ResponseBody
	public String selectMainSch(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectMainSch:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(mainSvc.selectMainSch(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectMainSch2")
    @ResponseBody
	public String selectMainSch2(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectMainSch2:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(mainSvc.selectMainSch2(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectMainSch3")
    @ResponseBody
	public String selectMainSch3(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectMainSch3:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(mainSvc.selectMainSch3(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectMainSch4")
    @ResponseBody
	public String selectMainSch4(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectMainSch4:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(mainSvc.selectMainSch4(param));
		return ret;
	}
	
	@RequestMapping(value = "/mainSearch", method = {RequestMethod.GET})
	public ModelAndView mainSearch(HttpServletRequest request, @RequestParam Map<String, Object> param,
				@RequestParam("optType") String optType, 
				@RequestParam("mainSearch") String mainSearch) {
		logger.info("searchResult:" + param.toString());
		ModelAndView mav = new ModelAndView();
		
		/*mav.addObject("All",mainSvc.selectAllSearch(param));*/
		mav.addObject("jinryo",mainSvc.selectJinryoSearch(param));
		mav.addObject("bokun",mainSvc.selectBokunSearch(param));
		mav.addObject("sayuk",mainSvc.selectSayukSearch(param));
	    mav.setViewName("/main/mainSearch");
		
		return mav;
	}	
	
	@RequestMapping(value = "/selectTotAniList")
	@ResponseBody
	public String selectTotAniList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectTotAniList:" + param.toString());
		HttpSession session = request.getSession(false);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
		String ret = JsonUtil.getListValuesFromList(mainSvc.selectTotAniList(map)).toString();
		return ret;
	}
	
	@RequestMapping(value = "/selectBsAniList")
	@ResponseBody
	public String selectBsAniList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectBsAniList:" + param.toString());
		HttpSession session = request.getSession(false);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
		String ret = JsonUtil.getListValuesFromList(mainSvc.selectBsAniList(map)).toString();
		return ret;
	}
	
}
