package GEIT.AMS.Controller.treat;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import GEIT.AMS.Service.base.Base0102SSvc;
import GEIT.AMS.Service.biz.Biz0202SSvc;
import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.Service.treat.Treat0403SSvc;
import GEIT.AMS.Service.treat.Treat0406SSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import GEIT.AMS.util.PmsUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/treat/0406", produces = "text/json; charset=EUC-KR")
public class Treat0406SCtr {

	@Autowired
	Treat0406SSvc treat0406SSvc;
	
	@Autowired
	Treat0403SSvc treat0403sSvc;
	
	@Autowired
	Base0102SSvc base0102SSvc;
	
	@Autowired
	private Biz0202SSvc biz0202sSvc;
	
	@Autowired
	private CmDocSvc cmDocSvc;

	private static final Logger logger = LoggerFactory.getLogger(Treat0406SCtr.class);

	@RequestMapping(value = "/main")
	public ModelAndView System_Info(HttpServletRequest request,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
    		@RequestParam(value = "cal_2", defaultValue = "") String cal_2,
    		@RequestParam(value = "jinryoNum", defaultValue = "") String jinryoNum,
    		@RequestParam(value = "aniName", defaultValue = "") String aniName,
    		@RequestParam(value = "aniNum", defaultValue = "") String aniNum,
    		@RequestParam(value = "KS_DIVISION", defaultValue = "A") String KS_DIVISION,
    		@RequestParam(value = "KSTYPE", defaultValue = "") String KSTYPE,
    		@RequestParam(value = "KS_STATUS", defaultValue = "") String KS_STATUS,
    		@RequestParam(value = "page", defaultValue = "1") String page,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		if(cal_1.equals("") && cal_2.equals("")){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
			Date nowYear = new Date();
			String dateString = formatter.format(nowYear);
			cal_1 = dateString + "-01-01";
		}

		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> KS_DIVISION_LIST = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "500");
		comm.put("MCC_M_CODE", "500");
		KS_DIVISION_LIST = base0102SSvc.getCommonCodeListSection(comm);
		
		comm = new HashMap<String, Object>();
		List<Map<String, Object>> KSTYPE_LIST = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "500");
		comm.put("MCC_M_CODE", "501");
		KSTYPE_LIST = base0102SSvc.getCommonCodeListSection(comm);
		
        List<Map<String, Object>> jinryolist = treat0406SSvc.selectInspctMgr(cal_1, cal_2, jinryoNum, aniName, aniNum, KS_DIVISION, KSTYPE, KS_STATUS, page);
        int jinryolistCount = treat0406SSvc.selectInspctMgrCount(cal_1, cal_2, jinryoNum, aniName, aniNum, KS_DIVISION, KSTYPE, KS_STATUS);
    	Map<String, Object> Map_page = treat0406SSvc.pageSET(jinryolistCount, page);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/treat/0406S_Prev_Insp_01");
		mav.addObject("KS_DIVISION", KS_DIVISION_LIST);
		mav.addObject("KSTYPE", KSTYPE_LIST);
		mav.addObject("jinryolist", jinryolist);
		mav.addObject("cal_1", cal_1);
		mav.addObject("cal_2", cal_2);
		mav.addObject("jinryoNum", jinryoNum);
		mav.addObject("aniName", aniName);
		mav.addObject("aniNum", aniNum);
		mav.addObject("DIVISION", KS_DIVISION);
		mav.addObject("KSINFO", KSTYPE);
		mav.addObject("STATUS", KS_STATUS);
		mav.addObject("FirstPage", Map_page.get("FirstPage").toString());
		mav.addObject("LastPage", Map_page.get("LastPage").toString());
		mav.addObject("TotalPage", Map_page.get("TotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	
	@RequestMapping(value = "/selectInspctMgrJinryo")
    @ResponseBody
	public String selectInspctMgrJinryo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectInspctMgrJinryo:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(treat0406SSvc.selectInspctMgrJinryo(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectInspctMgrBukum")
    @ResponseBody
	public String selectInspctMgrBukum(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectInspctMgrBukum:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(treat0406SSvc.selectInspctMgrBukum(param));
		return ret;
	}
	
	@RequestMapping(value = "/view0406E")
	public ModelAndView view0406E(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		logger.info("view0406E:" + param.toString());
		ModelAndView mav = new ModelAndView();
		mav.addObject("insInfo", cmDocSvc.getInspctMgr(param.get("docno").toString()));
		mav.addObject("bloodTest", cmDocSvc.getBloodTest());
		mav.setViewName("/treat/inspctView");
		return mav;
	}
	
	@RequestMapping(value = "/InspctMgrRes.do")
	public ModelAndView InspctMgrRes(
			HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JJJ_DOCNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "msg", defaultValue = "") String msg
			){
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0403/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}

		if(JJJ_DOCNO.equals("")){
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","진료번호를 가져오지 못했습니다.");
			return mav;
		}
		Map<String, Object> jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JJJ_DOCNO);
		if(jinryoINFO == null){
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","진료정보를 가져오지 못했습니다.");
			return mav;
		}
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> KSlist = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "500");
		comm.put("MCC_M_CODE", "501");
		KSlist = base0102SSvc.getCommonCodeListSection(comm);
		List<Map<String, Object>> KSLIST = treat0406SSvc.selectKSDataList(KSlist, JJJ_DOCNO, DTLDay);
		Map<String, Object> KSINFO  = new HashMap<String, Object>();
		if(KSLIST != null && KSLIST.size() > 0){
			KSINFO = KSLIST.get(0);
		}
		String ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		
		mav.setViewName("/treat/0406E_Prev_Insp_02");
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("KSLIST", KSLIST);
		mav.addObject("KSINFO", KSINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("MenuType", MenuType);
		mav.addObject("msg",msg);
		return mav;
	}
	@RequestMapping(value = "/InspctMgrRes_Save")
	public ModelAndView InspctMgrRes_Save(HttpServletRequest request, @RequestParam Map<String, Object> param) 
	{
		System.out.println("InspctMgrRes_Save!! DOCNO = " + param.get("DOCNO") + ", JJJ_DOCNO = " + param.get("JRNO") + ", DTLDay = " + param.get("DTLDay") + ", KSDOCNO = " + param.get("KSDOCNO"));
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        
		ModelAndView mav = new ModelAndView();
		
		if(param.get("DOCNO") == null || param.get("DOCNO").toString().equals("")){
			mav.setViewName("redirect:/treat/0403/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
		
		if(param.get("JRNO") == null || param.get("JRNO").toString().equals("")){
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", param.get("DOCNO"));
			mav.addObject("JRNO", "");
			mav.addObject("msg","진료번호를 가져오지 못했습니다.");
			return mav;
		}
		
		if(param.get("DTLDay") == null || param.get("DTLDay").toString().equals("")){
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", param.get("DOCNO"));
			mav.addObject("JRNO", param.get("JRNO"));
			mav.addObject("msg","진료내역 일자를 가져오지 못했습니다.");
			return mav;
		}
        Map<String, Object> comm = new HashMap<String, Object>();
    	List<Map<String, Object>> KSlist = new ArrayList<Map<String, Object>>();
    	comm.put("MCC_L_CODE", "500");
    	comm.put("MCC_M_CODE", "501");
    	KSlist = base0102SSvc.getCommonCodeListSection(comm);
        
        int Chk = treat0406SSvc.setKSInfo(param, KSlist, USERID);
        if(Chk == -1){
        	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
        	mav.addObject("DOCNO", param.get("DOCNO"));
        	mav.addObject("JRNO", param.get("JRNO"));
        	mav.addObject("DTLDay", param.get("DTLDay"));
        	mav.addObject("MenuType", param.get("MenuType"));
        	mav.addObject("msg","검사정보 저장에 실패하였습니다.");
        	return mav;
        }
        else{
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", param.get("DOCNO"));
			mav.addObject("JRNO", param.get("JRNO"));
			return mav;
        }
	}
	@RequestMapping(value = "/InspctMgr_K01")
	public ModelAndView InspctMgr_K01(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		String ANICLS = m_AniTmp.get("MAI_ANICLSCODE") != null ? m_AniTmp.get("MAI_ANICLSCODE").toString() : "";
		List<Map<String, Object>> KS01INFO = treat0406SSvc.getKS01List(DTLDay, MenuType, KSDOCNO, ANICLS);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K01");
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS01INFO", KS01INFO);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K01_Save")
	public ModelAndView InspctMgr_K01_Save(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		System.out.println("InspctMgr_K01_Save!! DOCNO = " + param.get("DOCNO") + ", JRNO = " + param.get("JRNO")
		+ ", MenuType = " + param.get("MenuType") + ", KSDOCNO = " + param.get("KSDOCNO")
		+ ", DTLDay = " + param.get("DTLDay"));
		
    	ModelAndView mav = new ModelAndView();
		if(param.get("DOCNO") == null || param.get("DOCNO").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(param.get("JRNO") == null || param.get("JRNO").toString().equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(param.get("DTLDay") == null || param.get("DTLDay").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(param.get("KSDOCNO") == null || param.get("KSDOCNO").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(param.get("MenuType") == null || param.get("MenuType").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> KSK01list = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "500");
		comm.put("MCC_M_CODE", "502");
		KSK01list = base0102SSvc.getCommonCodeListSection(comm);
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        
		boolean chk = treat0406SSvc.setK01DataInfo(param, KSK01list, USERID);
		
		if(param.get("RetURL") == null || param.get("RetURL").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!chk){
				mav.addObject("msg","저장중에 에러가 발생하였습니다.");
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", param.get("DOCNO"));
    	mav.addObject("JRNO", param.get("JRNO"));
    	mav.addObject("DTLDay", param.get("DTLDay"));
    	mav.addObject("MenuType", param.get("MenuType"));
		if(!chk){
			mav.addObject("msg","저장중에 에러가 발생하였습니다.");
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K01_Delete")
	public ModelAndView InspctMgr_K01_Delete(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		System.out.println("InspctMgr_K01_Delete!! DOCNO = " + param.get("DOCNO") + ", JRNO = " + param.get("JRNO")
		+ ", MenuType = " + param.get("MenuType") + ", KSDOCNO = " + param.get("KSDOCNO")
		+ ", DTLDay = " + param.get("DTLDay"));
		
    	ModelAndView mav = new ModelAndView();
		if(param.get("DOCNO") == null || param.get("DOCNO").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(param.get("JRNO") == null || param.get("JRNO").toString().equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(param.get("DTLDay") == null || param.get("DTLDay").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(param.get("KSDOCNO") == null || param.get("KSDOCNO").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(param.get("MenuType") == null || param.get("MenuType").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		String msg = "";
		int chk = treat0406SSvc.deleteK01Info(param.get("KSDOCNO").toString(), param.get("DTLDay").toString());
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(param.get("KSDOCNO").toString(), param.get("MenuType").toString(), "K01", param.get("cal_1").toString(), "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(param.get("RetURL") == null || param.get("RetURL").toString().equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", param.get("DOCNO"));
    	mav.addObject("JRNO", param.get("JRNO"));
    	mav.addObject("DTLDay", param.get("DTLDay"));
    	mav.addObject("MenuType", param.get("MenuType"));
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K02")
	public ModelAndView InspctMgr_K02(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("InspctMgr_K02!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		List<Map<String, Object>> KS02INFO = treat0406SSvc.getKS02List(KSDOCNO, DTLDay, MenuType);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K02");
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS02INFO", KS02INFO);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K02_Save")
	public ModelAndView InspctMgr_K02_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "JJDKSK_WAY", defaultValue = "") List<String> JJDKSK_WAY,
			@RequestParam(value = "JJDKSK_PART", defaultValue = "") List<String> JJDKSK_PART,
			@RequestParam(value = "JJDKSK_RSLT", defaultValue = "") List<String> JJDKSK_RSLT
			) {
		
		System.out.println("InspctMgr_K02_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", JJDKSK_WAY = " + JJDKSK_WAY.size() + ", JJDKSK_PART = " + JJDKSK_PART.size() + ", JJDKSK_RSLT = " + JJDKSK_RSLT.size());
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		boolean chk = treat0406SSvc.setK02DataInfo(KSDOCNO, DTLDay, MenuType, JJDKSK_WAY, JJDKSK_PART, JJDKSK_RSLT, USERID, cal_1);
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!chk){
				mav.addObject("msg","저장중에 에러가 발생하였습니다.");
			}
			return mav;
		}
		
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!chk){
			mav.addObject("msg","저장중에 에러가 발생하였습니다.");
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K02_Delete")
	public ModelAndView InspctMgr_K02_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL
			) {
	
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String msg = "";
		int chk = treat0406SSvc.deleteK02Info(KSDOCNO, DTLDay, MenuType);
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(KSDOCNO, MenuType, "K02", cal_1, "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K03")
	public ModelAndView InspctMgr_K03(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("InspctMgr_K03!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		List<Map<String, Object>> KS03INFO = treat0406SSvc.getKS03List(KSDOCNO, DTLDay, MenuType);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K03");
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS03INFO", KS03INFO);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K03_Save")
	public ModelAndView InspctMgr_K03_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "JJDKJK_WAY", defaultValue = "") List<String> JJDKJK_WAY,
			@RequestParam(value = "JJDKJK_PART", defaultValue = "") List<String> JJDKJK_PART,
			@RequestParam(value = "JJDKJK_RSLT", defaultValue = "") List<String> JJDKJK_RSLT
			) {
		
		System.out.println("InspctMgr_K03_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", JJDKJK_WAY = " + JJDKJK_WAY.size() + ", JJDKJK_PART = " + JJDKJK_PART.size() + ", JJDKJK_RSLT = " + JJDKJK_RSLT.size());
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		boolean chk = treat0406SSvc.setK03DataInfo(KSDOCNO, DTLDay, MenuType, JJDKJK_WAY, JJDKJK_PART, JJDKJK_RSLT, USERID, cal_1);
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!chk){
				mav.addObject("msg","저장중에 에러가 발생하였습니다.");
			}
			return mav;
		}
		
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!chk){
			mav.addObject("msg","저장중에 에러가 발생하였습니다.");
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K03_Delete")
	public ModelAndView InspctMgr_K03_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL
			) {
	
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String msg = "";
		int chk = treat0406SSvc.deleteK03Info(KSDOCNO, DTLDay, MenuType);
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(KSDOCNO, MenuType, "K03", cal_1, "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K04")
	public ModelAndView InspctMgr_K04(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("InspctMgr_K04!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> KS503LIST = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "500");
		comm.put("MCC_M_CODE", "503");
		KS503LIST = base0102SSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> KS04INFO = treat0406SSvc.getKS04List(KSDOCNO, DTLDay, MenuType);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K04");
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS04INFO", KS04INFO);
		mav.addObject("KS503LIST", KS503LIST);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K04_Save")
	public ModelAndView InspctMgr_K04_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "JJDKHS_PART", defaultValue = "") List<String> JJDKHS_PART,
			@RequestParam(value = "JJDKHS_DSKYUN", defaultValue = "") List<String> JJDKHS_DSKYUN,
			@RequestParam(value = "JJDKHS_RSLT", defaultValue = "") List<String> JJDKHS_RSLT
			) {
		
		System.out.println("InspctMgr_K04_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", JJDKHS_PART = " + JJDKHS_PART.size() + ", JJDKHS_DSKYUN = " + JJDKHS_DSKYUN.size() + ", JJDKHS_RSLT = " + JJDKHS_RSLT.size());
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		boolean chk = treat0406SSvc.setK04DataInfo(KSDOCNO, DTLDay, MenuType, JJDKHS_PART, JJDKHS_DSKYUN, JJDKHS_RSLT, USERID, cal_1);
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!chk){
				mav.addObject("msg","저장중에 에러가 발생하였습니다.");
			}
			return mav;
		}
		
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!chk){
			mav.addObject("msg","저장중에 에러가 발생하였습니다.");
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K04_Delete")
	public ModelAndView InspctMgr_K04_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL
			) {
	
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String msg = "";
		int chk = treat0406SSvc.deleteK04Info(KSDOCNO, DTLDay, MenuType);
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(KSDOCNO, MenuType, "K04", cal_1, "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K05")
	public ModelAndView InspctMgr_K05(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("InspctMgr_K05!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> KS504LIST = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "500");
		comm.put("MCC_M_CODE", "504");
		KS504LIST = base0102SSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> KS05INFO = treat0406SSvc.getKS05List(KSDOCNO, DTLDay, MenuType);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K05");
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS05INFO", KS05INFO);
		mav.addObject("KS504LIST", KS504LIST);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K05_Save")
	public ModelAndView InspctMgr_K05_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "JJDKKS_WAY", defaultValue = "") List<String> JJDKKS_WAY,
			@RequestParam(value = "JJDKKS_PART", defaultValue = "") List<String> JJDKKS_PART,
			@RequestParam(value = "JJDKKS_RSLT", defaultValue = "") List<String> JJDKKS_RSLT,
			@RequestParam(value = "JJDKKS_RSLTDC", defaultValue = "") List<String> JJDKKS_RSLTDC
			) {
		
		System.out.println("InspctMgr_K05_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", JJDKKS_WAY = " + JJDKKS_WAY.size() 
		+ ", JJDKKS_PART = " + JJDKKS_PART.size() + ", JJDKKS_RSLT = " + JJDKKS_RSLT.size() + ", JJDKKS_RSLTDC = " + JJDKKS_RSLTDC.size());
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		boolean chk = treat0406SSvc.setK05DataInfo(KSDOCNO, DTLDay, MenuType, JJDKKS_WAY, JJDKKS_PART, JJDKKS_RSLT, JJDKKS_RSLTDC, USERID, cal_1);
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!chk){
				mav.addObject("msg","저장중에 에러가 발생하였습니다.");
			}
			return mav;
		}
		
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!chk){
			mav.addObject("msg","저장중에 에러가 발생하였습니다.");
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K05_Delete")
	public ModelAndView InspctMgr_K05_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL
			) {
	
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String msg = "";
		int chk = treat0406SSvc.deleteK05Info(KSDOCNO, DTLDay, MenuType);
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(KSDOCNO, MenuType, "K05", cal_1, "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K06")
	public ModelAndView InspctMgr_K06(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("InspctMgr_K06!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> KS504LIST = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "500");
		comm.put("MCC_M_CODE", "504");
		KS504LIST = base0102SSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> KS06INFO = treat0406SSvc.getKS06List(KSDOCNO, DTLDay, MenuType);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K06");
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS06INFO", KS06INFO);
		mav.addObject("KS504LIST", KS504LIST);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K06_Save")
	public ModelAndView InspctMgr_K06_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "JJDKJH_WAY", defaultValue = "") List<String> JJDKJH_WAY,
			@RequestParam(value = "JJDKJH_PART", defaultValue = "") List<String> JJDKJH_PART,
			@RequestParam(value = "JJDKJH_RSLT", defaultValue = "") List<String> JJDKJH_RSLT,
			@RequestParam(value = "JJDKJH_RSLTDC", defaultValue = "") List<String> JJDKJH_RSLTDC
			) {
		
		System.out.println("InspctMgr_K06_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", JJDKJH_WAY = " + JJDKJH_WAY.size() 
		+ ", JJDKJH_PART = " + JJDKJH_PART.size() + ", JJDKJH_RSLT = " + JJDKJH_RSLT.size() + ", JJDKJH_RSLTDC = " + JJDKJH_RSLTDC.size());
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		boolean chk = treat0406SSvc.setK06DataInfo(KSDOCNO, DTLDay, MenuType, JJDKJH_WAY, JJDKJH_PART, JJDKJH_RSLT, JJDKJH_RSLTDC, USERID, cal_1);
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!chk){
				mav.addObject("msg","저장중에 에러가 발생하였습니다.");
			}
			return mav;
		}
		
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!chk){
			mav.addObject("msg","저장중에 에러가 발생하였습니다.");
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K06_Delete")
	public ModelAndView InspctMgr_K06_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL
			) {
	
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String msg = "";
		int chk = treat0406SSvc.deleteK06Info(KSDOCNO, DTLDay, MenuType);
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(KSDOCNO, MenuType, "K06", cal_1, "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K07")
	public ModelAndView InspctMgr_K07(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("InspctMgr_K07!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		
		Map<String, Object> KS07INFO = treat0406SSvc.getKS07List(KSDOCNO, DTLDay, MenuType);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K07");
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS07INFO", KS07INFO);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K07_Save")
	public ModelAndView InspctMgr_K07_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "JJDKPC_ITEM", defaultValue = "") String JJDKPC_ITEM,
			@RequestParam(value = "JJDKPC_SIRYO", defaultValue = "") String JJDKPC_SIRYO,
			@RequestParam(value = "JJDKPC_RSLT", defaultValue = "") String JJDKPC_RSLT,
			@RequestParam("biz_file") MultipartFile biz_file
			) {
		
		System.out.println("InspctMgr_K07_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", JJDKPC_ITEM = " + JJDKPC_ITEM
		+ ", JJDKPC_SIRYO = " + JJDKPC_SIRYO + ", JJDKPC_RSLT = " + JJDKPC_RSLT);
		
		if(biz_file != null){
			System.out.println("biz_file = " + biz_file.getName());
		}
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        String msg = "";
		boolean chk = treat0406SSvc.setK07DataInfo(KSDOCNO, DTLDay, MenuType, JJDKPC_ITEM, JJDKPC_SIRYO, JJDKPC_RSLT, USERID, cal_1);
		if(chk)
		{
			if(!biz_file.isEmpty()){
				try{
					if(treat0406SSvc.insfile(biz_file, KSDOCNO, request) == -1){
						msg = "파일업로드에 성공하였으나 파일정보 저장에 실패하였습니다.";
					}
	    		}
	    		catch (Exception e) {
	    			msg = "파일저장에 실패하였습니다.";
	    		}
			}
		}
		else{
			msg = "저장중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
		
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/deleteFileInfo.do", method = RequestMethod.POST)
	public ModelAndView deleteFileInfo(
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "CLS1", defaultValue = "1") String CLS1,
			@RequestParam(value = "SEQNO", defaultValue = "1") String SEQNO,
		HttpServletRequest request){
		
		String page = "";
    	ModelAndView mav = new ModelAndView();
        if (CLS1.equals("PCR"))
        {
            page = "K07";
        }
        else if (CLS1.equals("XRAY"))
        {
            page = "K09";
        }
        else if (CLS1.equals("CHEMP"))
        {
            page = "K10";
        }
    	mav.setViewName("redirect:/treat/0406/InspctMgr_" + page + ".do");
    	if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		if(CLS1.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","삭제할 파일의 파입이 확실하지 않습니다.");
			return mav;
		}
		
		System.out.println("deleteFileList!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay);
        boolean deleteChk = treat0406SSvc.deleteFileInfo(KSDOCNO, CLS1, SEQNO);
        if(!deleteChk){
			mav.addObject("msg","파일삭제에 실패하였습니다.");
        }
        else{
			mav.addObject("msg","파일삭제 완료");
        }
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
    	mav.addObject("KSDOCNO", KSDOCNO);
    	mav.addObject("RetURL", RetURL);
    	return mav;
	}
	@RequestMapping(value = "/Filedownload.do")
	public ModelAndView Ajax_Filedownload(
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "CLS1", defaultValue = "1") String CLS1,
			@RequestParam(value = "SEQNO", defaultValue = "1") String SEQNO
			){
		
		String page = "";
    	ModelAndView mav = new ModelAndView();
        if (CLS1.equals("PCR"))
        {
            page = "K07";
        }
        else if (CLS1.equals("XRAY"))
        {
            page = "K09";
        }
        else if (CLS1.equals("CHEMP"))
        {
            page = "K10";
        }
    	mav.setViewName("redirect:/treat/0406/InspctMgr_" + page + ".do");
    	if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		if(CLS1.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","삭제할 파일의 파입이 확실하지 않습니다.");
			return mav;
		}
		
		List<Map<String, Object>> fileinfo = treat0403sSvc.SelectFileList(KSDOCNO, "", CLS1);
		if(fileinfo != null && fileinfo.size() > 0){
			for (Map<String, Object> map : fileinfo) {
				if(map.get("BDA_BZSEQNO").toString().equals(SEQNO)){
					return new ModelAndView("fileDownloadUtil", "downloadFile",map);
				}
			}
			
		}
	    mav.addObject("DOCNO", DOCNO);
	    mav.addObject("JRNO", JRNO);
	    mav.addObject("DTLDay", DTLDay);
	    mav.addObject("MenuType", MenuType);
	   	mav.addObject("KSDOCNO", KSDOCNO);
	    mav.addObject("RetURL", RetURL);
		mav.addObject("msg","파일정보를 가져오지 못했습니다.");
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K07_Delete")
	public ModelAndView InspctMgr_K07_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL
			) {
	
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String msg = "";
		int chk = treat0406SSvc.deleteK07Info(KSDOCNO, DTLDay, MenuType);
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(KSDOCNO, MenuType, "K07", cal_1, "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
			else{
				int deleteChk = treat0403sSvc.deleteFileList(KSDOCNO, "", "PCR");
		        if(deleteChk == -1){
		        	msg = "파일삭제에 실패하였습니다.";
		        }
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K08")
	public ModelAndView InspctMgr_K08(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("InspctMgr_K08!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> KS504LIST = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "500");
		comm.put("MCC_M_CODE", "504");
		KS504LIST = base0102SSvc.getCommonCodeListSection(comm);
		
		List<Map<String, Object>> KS08INFO = treat0406SSvc.getKS08List(KSDOCNO, DTLDay, MenuType);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K08");
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS08INFO", KS08INFO);
		mav.addObject("KS504LIST", KS504LIST);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K08_Save")
	public ModelAndView InspctMgr_K08_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "S_CODE", defaultValue = "") List<String> S_CODE,
			@RequestParam(value = "JJDKSB_RSLTDC", defaultValue = "") List<String> JJDKSB_RSLTDC,
			@RequestParam(value = "JJDKSB_RSLT", defaultValue = "") List<String> JJDKSB_RSLT
			) {
		
		System.out.println("InspctMgr_K08_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", S_CODE = " + S_CODE.size() 
		+ ", JJDKSB_RSLTDC = " + JJDKSB_RSLTDC.size() + ", JJDKSB_RSLT = " + JJDKSB_RSLT.size());
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		boolean chk = treat0406SSvc.setK08DataInfo(KSDOCNO, DTLDay, MenuType, S_CODE, JJDKSB_RSLTDC, JJDKSB_RSLT, USERID, cal_1);
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!chk){
				mav.addObject("msg","저장중에 에러가 발생하였습니다.");
			}
			return mav;
		}
		
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!chk){
			mav.addObject("msg","저장중에 에러가 발생하였습니다.");
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K08_Delete")
	public ModelAndView InspctMgr_K08_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL
			) {
	
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String msg = "";
		int chk = treat0406SSvc.deleteK08Info(KSDOCNO, DTLDay, MenuType);
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(KSDOCNO, MenuType, "K08", cal_1, "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K09")
	public ModelAndView InspctMgr_K09(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("InspctMgr_K09!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		
		
		
		Map<String, Object> KS09INFO = treat0406SSvc.getKS09List(KSDOCNO, DTLDay, MenuType);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K09");
		List<Map<String, Object>> Filelist = biz0202sSvc.selectFileList2(KSDOCNO, "XRAY");
    	for(int i = 0;i<Filelist.size();++i){
    		mav.addObject("fileNAME" + ( i + 1 ), Filelist.get(i).get("BDA_CMNT"));
    		mav.addObject("fileSEQ" + ( i + 1 ), Filelist.get(i).get("BDA_BZSEQNO"));
    	}
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS09INFO", KS09INFO);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K09_Save")
	public ModelAndView InspctMgr_K09_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "JJDKXR_RSLT", defaultValue = "") String JJDKXR_RSLT,
			@RequestParam("biz_file1") MultipartFile biz_file1,
			@RequestParam("biz_file2") MultipartFile biz_file2,
			@RequestParam("biz_file3") MultipartFile biz_file3
			) {
		
		System.out.println("InspctMgr_K09_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", JJDKXR_RSLT = " + JJDKXR_RSLT);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		boolean chk = treat0406SSvc.setK09DataInfo(KSDOCNO, DTLDay, MenuType, JJDKXR_RSLT, USERID, cal_1);
		String msg = "";
		if(chk){
			try {
				if(treat0406SSvc.insfile(biz_file1, biz_file2, biz_file3, "XRAY", KSDOCNO, request) == -1){
					msg = "파일업로드에 성공하였으나 파일정보 저장에 실패하였습니다.";
				}
				else{
					biz0202sSvc.updateFileSeqInfo2(KSDOCNO, "XRAY");
				}
			} catch (Exception e) {
				msg = "파일저장에 실패하였습니다.";
			}
		}
		else{
			msg = "저장중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
		
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K09_Delete")
	public ModelAndView InspctMgr_K09_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL
			) {
	
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String msg = "";
		int chk = treat0406SSvc.deleteK09Info(KSDOCNO, DTLDay, MenuType);
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(KSDOCNO, MenuType, "K09", cal_1, "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
			else{
				boolean filechk = treat0406SSvc.deleteFileList(KSDOCNO, "XRAY");
				if(!filechk){
					msg = "일부 파일 삭제에 실패하였습니다.";
				}
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K10")
	public ModelAndView InspctMgr_K10(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("InspctMgr_K10!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String ANICODE = "";
		Map<String, Object> jinryoINFO = null;
		if(MenuType.equals("J")){
			jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
			ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		}
		else{
			jinryoINFO = treat0403sSvc.getBuPSInfo(JRNO);
			ANICODE = jinryoINFO.get("MAI_ANICODE") != null ? jinryoINFO.get("MAI_ANICODE").toString() : "";
		}
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		if(m_AniTmp == null){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","동물정보를 가져오지 못했습니다.");
			return mav;
		}
		
		
		
		Map<String, Object> KS10INFO = treat0406SSvc.getKS10List(KSDOCNO, DTLDay, MenuType);
		
		mav.setViewName("/treat/0406E_Prev_Insp_K10");
		List<Map<String, Object>> Filelist = biz0202sSvc.selectFileList2(KSDOCNO, "CHEMP");
    	for(int i = 0;i<Filelist.size();++i){
    		mav.addObject("fileNAME" + ( i + 1 ), Filelist.get(i).get("BDA_CMNT"));
    		mav.addObject("fileSEQ" + ( i + 1 ), Filelist.get(i).get("BDA_BZSEQNO"));
    	}
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("KS10INFO", KS10INFO);
		mav.addObject("MenuType", MenuType);
		mav.addObject("JRNO", JRNO);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("KSDOCNO", KSDOCNO);
		mav.addObject("RetURL", RetURL);
		mav.addObject("msg", msg);
		mav.addObject("PMS0406", PmsUtil.getPMSinfo("0406", request));
		return mav;
	}
	@RequestMapping(value = "/InspctMgr_K10_Save")
	public ModelAndView InspctMgr_K10_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "JJDKEP_RSLT", defaultValue = "") String JJDKEP_RSLT,
			@RequestParam("biz_file1") MultipartFile biz_file1,
			@RequestParam("biz_file2") MultipartFile biz_file2,
			@RequestParam("biz_file3") MultipartFile biz_file3
			) {
		
		System.out.println("InspctMgr_K10_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", MenuType = " + MenuType + ", KSDOCNO = " + KSDOCNO
		+ ", DTLDay = " + DTLDay + ", JJDKEP_RSLT = " + JJDKEP_RSLT);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		boolean chk = treat0406SSvc.setK10DataInfo(KSDOCNO, DTLDay, MenuType, JJDKEP_RSLT, USERID, cal_1);
		String msg = "";
		if(chk){
			try {
				if(treat0406SSvc.insfile(biz_file1, biz_file2, biz_file3, "CHEMP", KSDOCNO, request) == -1){
					msg = "파일업로드에 성공하였으나 파일정보 저장에 실패하였습니다.";
				}
				else{
					biz0202sSvc.updateFileSeqInfo2(KSDOCNO, "CHEMP");
				}
			} catch (Exception e) {
				msg = "파일저장에 실패하였습니다.";
			}
		}
		else{
			msg = "저장중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
		
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
	@RequestMapping(value = "/InspctMgr_K10_Delete")
	public ModelAndView InspctMgr_K10_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "MenuType", defaultValue = "") String MenuType,
			@RequestParam(value = "KSDOCNO", defaultValue = "") String KSDOCNO,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
			@RequestParam(value = "RetURL", defaultValue = "") String RetURL
			) {
	
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
	
		if(JRNO.equals("") ){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","예약일자가 없습니다.");
			return mav;
		}
		
		if(KSDOCNO.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","검사예약 번호가 없습니다.");
			return mav;
		}
		
		if(MenuType.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			mav.addObject("msg","진료 및 부검 여부가 확실하지 않습니다.");
			return mav;
		}
		
		String msg = "";
		int chk = treat0406SSvc.deleteK10Info(KSDOCNO, DTLDay, MenuType);
		if(chk >= 0){
	        HttpSession session = request.getSession(false);
	        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	        
			int KSChk = treat0406SSvc.updateKSStatusInfo(KSDOCNO, MenuType, "K10", cal_1, "0", USERID);
			if(KSChk == -1){
				msg = "삭제를 완료하였으나 검사예약 상태업데이트에 실패하였습니다.";
			}
			else{
				boolean filechk = treat0406SSvc.deleteFileList(KSDOCNO, "CHEMP");
				if(!filechk){
					msg = "일부 파일 삭제에 실패하였습니다.";
				}
			}
		}
		else{
			msg = "삭제중에 에러가 발생하였습니다.";
		}
		if(RetURL.equals("")){
			mav.setViewName("redirect:/treat/0406/main.do");
			if(!msg.equals("")){
				mav.addObject("msg",msg);
			}
			return mav;
		}
    	mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
    	mav.addObject("DOCNO", DOCNO);
    	mav.addObject("JRNO", JRNO);
    	mav.addObject("DTLDay", DTLDay);
    	mav.addObject("MenuType", MenuType);
		if(!msg.equals("")){
			mav.addObject("msg",msg);
		}
    	return mav;
	}
}
