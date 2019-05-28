package GEIT.AMS.Controller.base;

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
import GEIT.AMS.Service.base.Base0105SSvc;
import GEIT.AMS.Service.base.Base0107SSvc;
import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.Service.common.CmFileSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/base/0107", produces = "text/json; charset=EUC-KR")
public class Base0107SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Base0107SCtr.class);
	
	@Autowired
	private Base0107SSvc base0107sSvc;
	
	@Autowired
	private Base0102SSvc base0102sSvc;
	
	@Autowired
	private Base0105SSvc base0105sSvc;
	
	@Autowired
	private CmDocSvc cmDocSvc;

	@Autowired
	private CmFileSvc cmFileSvc;
	 
	@RequestMapping(value = "/main")
	public ModelAndView index(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));
		String cal_4 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		cal.add(Calendar.DAY_OF_YEAR, -180); 
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));
		String cal_3 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));
		
		List<Map<String, Object>> vvrmList = new ArrayList<Map<String, Object>>();
		vvrmList = cmDocSvc.selectBVvrm(param);
		
		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		map.put("cal_3", cal_3);
		map.put("cal_4", cal_4);
		mav.addObject("vvrmList", vvrmList);
		
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/base/0107S_AniInfo_01");
		
		return mav;
	}
	
	@RequestMapping(value = "/selectPagingList")
    @ResponseBody
	public String selectPagingList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("selectPagingList:" + param.toString());
		List<Map<String, Object>> ret = (List<Map<String, Object>>) base0107sSvc.selectAniPagingList(param).get("result");
		return JsonUtil.getJsonStringFromList(ret);
	}
	
	@RequestMapping(value = "/selectAllList")
	@ResponseBody
	public String selectAllList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("selectAllList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0107sSvc.selectAllList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAliveList")
    @ResponseBody
	public String selectAliveList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAliveList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0107sSvc.selectAliveList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectDeathList")
    @ResponseBody
	public String selectDeathList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectDeathList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0107sSvc.selectDeathList(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectBVvrm")
    @ResponseBody
	public String selectBVvrm(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("selectBVvrm:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(cmDocSvc.selectBVvrm(param));
		return ret;
	}
	
	@RequestMapping(value = "/view0107E")
	public ModelAndView view0107E(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0107E:" + param.toString());
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> lybanipList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "250");
		lybanipList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> LRsnList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "251");
		LRsnList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> regList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "200");
		regList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> stsList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "201");
		stsList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> genList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "202");
		genList = base0102sSvc.getCommonCodeListSection(comm);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("lybanipList", lybanipList);
		mav.addObject("LRsnList", LRsnList);
		mav.addObject("regList", regList);
		mav.addObject("stsList", stsList);
		mav.addObject("genList", genList);
		
		/*동물정보[그룹정보]*/
		mav.addObject("clsInfo", cmDocSvc.getClsInfo(param.get("MAI_AniCode").toString()));
		/*동물정보[기본정보]*/
		mav.addObject("basicInfo", cmDocSvc.getBasicInfo(param.get("MAI_AniCode").toString()));
		/*동물정보[임시]*/
		mav.addObject("aniInfo", cmDocSvc.getAnimalInfo(param.get("MAI_AniCode").toString()));
		
		
		mav.addObject("bornInfo", cmDocSvc.getAniBorn(param.get("MAI_AniCode").toString()));
		mav.addObject("deadInfo", cmDocSvc.getAniPyesa(param.get("MAI_AniCode").toString()));
		mav.addObject("banipInfo", cmDocSvc.getAniBanip(param.get("MAI_AniCode").toString()));
		mav.addObject("getImsin", cmDocSvc.getImsin(param.get("MAI_AniCode").toString()));
		mav.addObject("vvrmList", cmDocSvc.selectBVvrm(param));
		mav.addObject("uploadPath", cmFileSvc.getStUploadPath());
		mav.addObject("stFileList", cmFileSvc.selectStFileList(param.get("MAI_AniCode").toString()));
		mav.setViewName("/base/0107S_AniInfo_03_01");
		return mav;
	}
	
	@RequestMapping(value = "/selectBornList")
    @ResponseBody
	public String selectBornList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectBornList:" + param.toString());
		String ret = null;		
		 Map<String, Object> map = cmDocSvc.getAniBorn(param.get("MAI_AniCode").toString());
		    JSONObject json = JsonUtil.getJsonStringFromMap(map);
			if (map!=null) {
				ret = json.toString();
			}
		return ret;
	}
	
	@RequestMapping(value = "/showGunzip")
	public ModelAndView showGunzip(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("showGunzip:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/base/viewGunzip");
		return mav;
	}
	
	// 강
	@RequestMapping(value = "/selectClassList")
    @ResponseBody
	public String selectClassList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectClassList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0107sSvc.selectClassList(param));
		return ret;
	}
	
	// 목
	@RequestMapping(value = "/selectOrderList")
    @ResponseBody
	public String selectOrderList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectOrderList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0107sSvc.selectOrderList(param));
		return ret;
	}
	
	// 과
	@RequestMapping(value = "/selectFamilyList")
    @ResponseBody
	public String selectFamilyList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectFamilyList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0107sSvc.selectFamilyList(param));
		return ret;
	}
	
	// 종
	@RequestMapping(value = "/selectSpeciesList")
    @ResponseBody
	public String selectSpeciesList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectSpeciesList:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0107sSvc.selectSpeciesList(param));
		return ret;
	}
	
	// 상세
	@RequestMapping(value = "/getSubDetailInfo")
    @ResponseBody
	public String getSubDetailInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("getSubDetailInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0107sSvc.getSubDetailInfo(param.get("mac_aniclscode").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	@RequestMapping(value = "/add_animal")
	public ModelAndView add_animal(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("add_animal:" + param.toString());
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> gubunList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "200");
		gubunList = base0102sSvc.getCommonCodeListSection(comm);
		
		comm = new HashMap<String, Object>();
		List<Map<String, Object>> statusList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "201");
		statusList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> genderList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "202");
		genderList = base0102sSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> vvrmList = new ArrayList<Map<String, Object>>();
		vvrmList = cmDocSvc.selectBVvrm(param);
		
		List<Map<String, Object>> dptList = new ArrayList<Map<String, Object>>();
		dptList = base0105sSvc.showDptTeam(param);
		
		mav.addObject("aniInfo", cmDocSvc.getAnimalInfo2(param.get("mac_aniclscode").toString()));
		mav.setViewName("/base/addAnimal");
		mav.addObject("MAX",base0107sSvc.selectMaxAnum(param));
		mav.addObject("gubunList", gubunList);
		mav.addObject("statusList", statusList);
		mav.addObject("vvrmList", vvrmList);
		mav.addObject("dptList", dptList);
		mav.addObject("genderList", genderList);
		return mav;
	}
	
	@RequestMapping(value="/AniInfoAdd_Save")
    public ModelAndView AniInfoAdd_Save(HttpServletRequest request,
    		@RequestParam(value = "regSelbox", defaultValue = "") String regSelbox,
    		@RequestParam(value = "stsSelbox", defaultValue = "") String stsSelbox,
    		@RequestParam(value = "dptSelbox", defaultValue = "") String dptSelbox,
    		@RequestParam(value = "vvrmSelbox", defaultValue = "") String vvrmSelbox,
    		@RequestParam(value = "cal_1", defaultValue = "") String cal_1) {
    	
    	System.out.println("AniInfoAdd_Save!! regSelbox = " + regSelbox + ", stsSelbox = " + stsSelbox + ", dptSelbox = " + dptSelbox + ", vvrmSelbox = " + vvrmSelbox +", cal_1 =" + cal_1);
    	ModelAndView mav = new ModelAndView();
		if(regSelbox.equals("") || stsSelbox.equals("") || dptSelbox.equals("") || vvrmSelbox.equals("") || cal_1.equals("")){
			mav.setViewName("redirect:/base/0107/add_animal.do");
			mav.addObject("msg","요청정보를 모두 입력해주세요.");
			return mav;
		}
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		return mav;
        
       /* int Jinryo_Chk = treat0402sSvc.insertJinryoInfo(true, stsSelbox, dptSelbox, vvrmSelbox, regSelbox, cal_1 ,USERID);
        if(Jinryo_Chk == -1){
			mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
			mav.addObject("msg","저장에 실패하였습니다.");
			return mav;
        }
        else{
			mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
			return mav;
        }*/
    }
}
