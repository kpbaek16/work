package GEIT.AMS.Controller.treat;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

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
import GEIT.AMS.Service.treat.Treat0402SSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import GEIT.AMS.util.PmsUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/treat/0402", produces = "text/json; charset=EUC-KR")
public class Treat0402SCtr {

	@Autowired
	Treat0402SSvc treat0402sSvc;
	
	@Autowired
	private Base0102SSvc base0102SSvc;

	private static final Logger logger = LoggerFactory.getLogger(Treat0402SCtr.class);

	@RequestMapping(value = "/JINRYO_RCT_INFO")
	public ModelAndView JINRYO_RCT_INFO(HttpServletRequest request,
    		@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
    		@RequestParam(value = "cal_2", defaultValue = "") String cal_2,
    		@RequestParam(value = "numKeyword", defaultValue = "") String numKeyword,
    		@RequestParam(value = "vvrmKeyword", defaultValue = "") String vvrmKeyword,
    		@RequestParam(value = "nameKeyword", defaultValue = "") String nameKeyword,
    		@RequestParam(value = "jinryoKind", defaultValue = "") String jinryoKind,
    		@RequestParam(value = "jinryoStatus", defaultValue = "") String jinryoStatus,
    		@RequestParam(value = "page", defaultValue = "1") String page,
    		@RequestParam(value = "msg", defaultValue = "") String msg
    		) {
		
		if(cal_1.equals("") && cal_2.equals("")){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
			Date nowYear = new Date();
			String dateString = formatter.format(nowYear);
			cal_1 = dateString + "-01-01";
		}
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("cal_1", cal_1);
		param.put("cal_2", cal_2);
		param.put("numKeyword", numKeyword);
		param.put("vvrmKeyword", vvrmKeyword);
		param.put("nameKeyword", nameKeyword);
		param.put("jinryoKind", jinryoKind);
		param.put("jinryoStatus", jinryoStatus);
		param.put("page", page);
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> Kindlist = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "300");
		comm.put("MCC_M_CODE", "300");
		Kindlist = base0102SSvc.getCommonCodeListSection(comm);
		
		comm = new HashMap<String, Object>();
		List<Map<String, Object>> Statuslist = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "300");
		comm.put("MCC_M_CODE", "301");
		Statuslist = base0102SSvc.getCommonCodeListSection(comm);
		
		System.out.println("");
		System.out.println("------------------------------------------------\n");
		System.out.println("JINRYO_RCT_INFO!! cal_1 = " + param.get("cal_1") + ", cal_2 = " + param.get("cal_2") 
		+ ", numKeyword = " + param.get("numKeyword") + ", vvrmKeyword = " + param.get("vvrmKeyword") 
		+ ", nameKeyword = " + param.get("nameKeyword") + ", jinryoKind = " + param.get("jinryoKind") 
		+ ", jinryoStatus = " + param.get("jinryoStatus") + ", page = " + param.get("page") + ", msg = " + msg);
		
        List<Map<String, Object>> jinryolist = treat0402sSvc.selectAllList(param);
		
		System.out.println("jinryolist size = " + jinryolist.size());
    	Map<String, Object> Map_page = treat0402sSvc.pageSET(jinryolist, page);
    	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/treat/0402S_Treat_Req_01");
		mav.addObject("jinryoKind", Kindlist);
		mav.addObject("jinryoStatus", Statuslist);
		mav.addObject("jinryolist", jinryolist);
		mav.addObject("cal_1", cal_1);
		mav.addObject("cal_2", cal_2);
		mav.addObject("numKeyword", numKeyword);
		mav.addObject("vvrmKeyword", vvrmKeyword);
		mav.addObject("nameKeyword", nameKeyword);
		mav.addObject("Kind", jinryoKind);
		mav.addObject("Status", jinryoStatus);
		mav.addObject("FirstPage", Map_page.get("FirstPage").toString());
		mav.addObject("LastPage", Map_page.get("LastPage").toString());
		mav.addObject("TotalPage", Map_page.get("TotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		mav.addObject("msg", msg);
		mav.addObject("PMS0402", PmsUtil.getPMSinfo("0402", request));
		mav.addObject("PMS0403", PmsUtil.getPMSinfo("0403", request));
		return mav;
	}
	
	@RequestMapping(value = "/CareRctAdd")
	public ModelAndView CareRctAdd(HttpServletRequest request) {
		
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> SEXList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "200");
		comm.put("MCC_M_CODE", "202");
		SEXList = base0102SSvc.getCommonCodeListSection(comm);
		
		comm = new HashMap<String, Object>();
		List<Map<String, Object>> KindList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "300");
		comm.put("MCC_M_CODE", "300");
		KindList = base0102SSvc.getCommonCodeListSection(comm);
		
        HttpSession session = request.getSession(false);
        String USERNAME = session.getAttribute(SessionParam.ss_gha_username).toString();
        String USERDEPT = session.getAttribute(SessionParam.ss_gha_dptname).toString();
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date nowYear = new Date();
		String RCTDATE = formatter.format(nowYear);
		
		List<Map<String, Object>> VVRMList = treat0402sSvc.getVVRMdata();
    	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/treat/0402E_Treat_Req_02");
		mav.addObject("SEXList", SEXList);
		mav.addObject("KindList", KindList);
		mav.addObject("USERNAME", USERNAME);
		mav.addObject("USERDEPT", USERDEPT);
		mav.addObject("VVRMList", VVRMList);
		mav.addObject("RCTDATE", RCTDATE);
		mav.addObject("PMS0402", PmsUtil.getPMSinfo("0402", request));
		return mav;
	}
	@RequestMapping(value = "/CareRctModify")
	public ModelAndView CareRctModify(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "msg", defaultValue = "") String msg
			) {
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> KindList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "300");
		comm.put("MCC_M_CODE", "300");
		KindList = base0102SSvc.getCommonCodeListSection(comm);
		
		comm = new HashMap<String, Object>();
		List<Map<String, Object>> Statuslist = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "300");
		comm.put("MCC_M_CODE", "301");
		Statuslist = base0102SSvc.getCommonCodeListSection(comm);
		
		Map<String, Object> JJRInfo = treat0402sSvc.getRctDetail(DOCNO);
		
		String ANICODE = JJRInfo.get("BAA_ANICODE") != null ? JJRInfo.get("BAA_ANICODE").toString() : "";
		Map<String, Object> AniINFO = treat0402sSvc.getAniINFO(ANICODE);
		
		mav.setViewName("/treat/0402E_Treat_Req_03");
		mav.addObject("JJRInfo", JJRInfo);
		mav.addObject("KindList", KindList);
		mav.addObject("AniINFO", AniINFO);
		mav.addObject("Statuslist", Statuslist);
		mav.addObject("msg",msg);
		mav.addObject("PMS0402", PmsUtil.getPMSinfo("0402", request));
		mav.addObject("PMS0403", PmsUtil.getPMSinfo("0403", request));
		return mav;
	}
	@RequestMapping(value = "/CareRctModify_HsptlCnfm")
	public ModelAndView CareRctModify_HsptlCnfm(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO) {
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		mav.setViewName("redirect:/treat/0402/CareRctModify.do");
		mav.addObject("DOCNO",DOCNO);
		if(treat0402sSvc.updateRCT_HosptlCnfm(DOCNO, USERID) == -1){
			mav.addObject("msg","병원확인 실패");
		}
		return mav;
	}
	@RequestMapping(value = "/CareRctModify_Delete")
	public ModelAndView CareRctModify_Delete(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO) {
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
	    	mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
		if(treat0402sSvc.deleteANI_ATCHInfo(DOCNO) >= 0){
			if(treat0402sSvc.deleteJinryoRCTInfo(DOCNO) == -1){
				mav.setViewName("redirect:/treat/0402/CareRctModify.do");
				mav.addObject("DOCNO",DOCNO);
				mav.addObject("msg","접수정보 삭제 실패! 동물정보를 다시 등록해주시기 바랍니다.");
				return mav;
			}
		}
		else{
			mav.setViewName("redirect:/treat/0402/CareRctModify.do");
			mav.addObject("DOCNO",DOCNO);
			mav.addObject("msg","동물정보 삭제 실패");
			return mav;
		}
    	mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
		mav.addObject("msg","삭제완료");
		return mav;
	}
	
	@RequestMapping(value = "/CareRctModify_Save")
	public ModelAndView CareRctModify_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "selectKind", defaultValue = "") String selectKind,
    		@RequestParam(value = "JJRCMNT", defaultValue = "") String JJRCMNT,
    		@RequestParam(value = "JYADD_ANICODE", defaultValue = "") String JYADD_ANICODE) {
		
		System.out.println("CareRctAdd_Save!! JYADD_ANICODE = " + JYADD_ANICODE + ", selectKind = " + selectKind + ", JJRCMNT = " + JJRCMNT);
    	ModelAndView mav = new ModelAndView();
		if(JYADD_ANICODE.equals("") || selectKind.equals("") || JJRCMNT.equals("")){
			mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
			mav.addObject("msg","요청정보를 모두 입력해주세요.");
			return mav;
		}
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        
        int ModifyChk = treat0402sSvc.updateJinryoRCTInfo(DOCNO, selectKind, JJRCMNT, USERID);
        if(ModifyChk >= 0){
        	Map<String, Object> JJRInfo = treat0402sSvc.getRctDetail(DOCNO);
        	if(JJRInfo == null){
        		mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
        		mav.addObject("msg","접수정보를 가져오지 못했습니다.");
        		return mav;
        	}
        	if(!JJRInfo.get("BAA_ANICODE").toString().equals(JYADD_ANICODE)){
        		int Del_AniChk = treat0402sSvc.deleteANI_ATCHInfo(DOCNO);
        		if(Del_AniChk >= 0){
        			int insert_AniChk = treat0402sSvc.insertANI_ATCHInfo(DOCNO, JYADD_ANICODE, USERID);
        			if(insert_AniChk == -1){
            			mav.setViewName("redirect:/treat/0402/CareRctModify.do");
            			mav.addObject("DOCNO",DOCNO);
            			mav.addObject("msg","동물정보 수정 실패! 동물정보를 다시 등록해주시기 바랍니다.");
            			return mav;
        			}
        		}
        		else{
        			mav.setViewName("redirect:/treat/0402/CareRctModify.do");
        			mav.addObject("DOCNO",DOCNO);
        			mav.addObject("msg","동물정보 수정 실패");
        			return mav;
        		}
        	}
        }
        else{
        	mav.setViewName("redirect:/treat/0402/CareRctModify.do");
			mav.addObject("DOCNO",DOCNO);
			mav.addObject("msg","접수정보 업데이트 실패!");
			return mav;
        }
    	mav.setViewName("redirect:/treat/0402/CareRctModify.do");
		mav.addObject("DOCNO",DOCNO);
		return mav;
	}
	
	
	@RequestMapping(value="/CareRctAdd_Save")
    public ModelAndView CareRctAdd_Save(HttpServletRequest request,
    		@RequestParam(value = "JYADD_ANICODE", defaultValue = "") String JYADD_ANICODE,
    		@RequestParam(value = "RCTDATE", defaultValue = "") String RCTDATE,
    		@RequestParam(value = "selectKind", defaultValue = "") String selectKind,
    		@RequestParam(value = "JJRCMNT", defaultValue = "") String JJRCMNT) {
    	
    	System.out.println("CareRctAdd_Save!! JYADD_ANICODE = " + JYADD_ANICODE + ", RCTDATE = " + RCTDATE + ", selectKind = " + selectKind + ", JJRCMNT = " + JJRCMNT);
    	ModelAndView mav = new ModelAndView();
		if(JYADD_ANICODE.equals("") || RCTDATE.equals("") || selectKind.equals("") || JJRCMNT.equals("")){
			mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
			mav.addObject("msg","요청정보를 모두 입력해주세요.");
			return mav;
		}
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        
        int Jinryo_Chk = treat0402sSvc.insertJinryoInfo(true, RCTDATE, selectKind, JJRCMNT, JYADD_ANICODE, USERID);
        if(Jinryo_Chk == -1){
			mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
			mav.addObject("msg","저장에 실패하였습니다.");
			return mav;
        }
        else{
			mav.setViewName("redirect:/treat/0402/JINRYO_RCT_INFO.do");
			return mav;
        }
    }
	
	@RequestMapping(value = "/searchAni")
	public ModelAndView searchAni(HttpServletRequest request,
    		@RequestParam(value = "ANI_NAME", defaultValue = "") String ANI_NAME,
    		@RequestParam(value = "ANI_CODE", defaultValue = "") String ANI_CODE,
    		@RequestParam(value = "SEXval", defaultValue = "") String SEXval,
    		@RequestParam(value = "VVRMval", defaultValue = "") String VVRMval,
    		@RequestParam(value = "Dethtype", defaultValue = "") String Dethtype,
    		@RequestParam(value = "page", defaultValue = "1") String page
			) {
		
		System.out.println("searchAni!! ANI_NAME = " + ANI_NAME + ", ANI_CODE = " + ANI_CODE
		+ ", SEXval = " + SEXval + ", VVRMval = " + VVRMval
		+ ", Dethtype = " + Dethtype + ", page = " + page);
		
        List<Map<String, Object>> AniList = treat0402sSvc.selectANISEQ(ANI_NAME, ANI_CODE, SEXval, VVRMval, Dethtype, page);
		
        int AniListCOUNT = treat0402sSvc.selectANISEQ_Count(ANI_NAME, ANI_CODE, SEXval, VVRMval, Dethtype);
		System.out.println("AniListCOUNT = " + AniListCOUNT);
    	Map<String, Object> Map_page = treat0402sSvc.pageSET(AniListCOUNT, page);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/treat/0402E_Ajax_Treat_AniSEQ");
		mav.addObject("AniList", AniList);
		mav.addObject("FirstPage", Map_page.get("FirstPage").toString());
		mav.addObject("LastPage", Map_page.get("LastPage").toString());
		mav.addObject("TotalPage", Map_page.get("TotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		return mav;
	}
	
}
