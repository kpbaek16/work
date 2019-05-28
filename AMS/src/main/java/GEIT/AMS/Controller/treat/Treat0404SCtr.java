package GEIT.AMS.Controller.treat;

import java.text.DecimalFormat;
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

import GEIT.AMS.Service.treat.Treat0403SSvc;
import GEIT.AMS.Service.treat.Treat0404SSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/treat/0404", produces = "text/json; charset=EUC-KR")
public class Treat0404SCtr {

	@Autowired
	Treat0404SSvc treat0404sSvc;
	
	@Autowired
	Treat0403SSvc treat0403sSvc;

	private static final Logger logger = LoggerFactory.getLogger(Treat0404SCtr.class);

	@RequestMapping(value = "/main")
	public ModelAndView System_Info(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");
		String cal_2 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		cal.add(Calendar.DAY_OF_YEAR, -365); 
		String cal_1 = cal.get(Calendar.YEAR) + "-" + df.format(cal.get(Calendar.MONTH) + 1) + "-" + df.format(cal.get(Calendar.DATE));

		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		mav.addObject("calInfo", JsonUtil.getJsonStringFromMap(map));
		mav.setViewName("/treat/0404S_Treat_Pres_01");
		return mav;
	}
	
	@RequestMapping(value = "/selectPreslist")
	@ResponseBody
	public String selectPreslist(HttpServletRequest request, @RequestParam Map<String, Object> param) {

		logger.info("selectPreslist:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("drugKeyword", param.get("drugKeyword"));
		map.put("vvrmKeyword", param.get("vvrmKeyword"));
		map.put("nameKeyword", param.get("nameKeyword"));
		String ret = JsonUtil.getJsonStringFromList(treat0404sSvc.selectPreslist(map));
		return ret;
	}
	
	@RequestMapping(value = "/PreScrptAdd.do")
	public ModelAndView PreScrptAdd(
			HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JJJ_DOCNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
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
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		int TmpDelete = treat0404sSvc.deleteTmpInfo(USERID, "CB", "", "");
		if(TmpDelete == -1){
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","처방전을 가져오지 못했습니다.");
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
		int wk_nRet = 0;
		List<Map<String, Object>> CBLIST = treat0404sSvc.selectCBDataList(JJJ_DOCNO, DTLDay);
		Map<String, Object> CBINFO  = new HashMap<String, Object>();
		if(CBLIST != null && CBLIST.size() > 0){
			CBINFO = CBLIST.get(0);
			for (Map<String, Object> map : CBLIST) {
				int chk = treat0404sSvc.insertTmpInfo(USERID, "CB", "SelDrug", wk_nRet, map.get("JJDCB_DRUGCODE").toString());
				if(chk == -1){
					treat0404sSvc.deleteTmpInfo(USERID, "CB", "", "");
			    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
					mav.addObject("DOCNO", DOCNO);
					mav.addObject("JRNO", JJJ_DOCNO);
					mav.addObject("msg","처방전을 가져오지 못했습니다.");
					return mav;
				}
				wk_nRet++;
			}
		}
		String ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
		
		mav.setViewName("/treat/0404E_Treat_Pres_02");
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("CBLIST", CBLIST);
		mav.addObject("CBINFO", CBINFO);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("msg",msg);
		return mav;
	}

	@RequestMapping(value = "/searchDRUG")
	public ModelAndView searchDRUG(HttpServletRequest request,
    		@RequestParam(value = "SRCHNAME", defaultValue = "") String SRCHNAME,
    		@RequestParam(value = "SRCHNO", defaultValue = "") String SRCHNO,
    		@RequestParam(value = "page", defaultValue = "1") String page
			) {
		
		System.out.println("searchDRUG!! SRCHNAME = " + SRCHNAME + ", SRCHNO = " + SRCHNO);
		
        List<Map<String, Object>> DRUGList = treat0404sSvc.selectDrugList(SRCHNAME, SRCHNO);
        
		System.out.println("DRUGListCOUNT = " + DRUGList.size());
    	Map<String, Object> Map_page = treat0403sSvc.pageSET(DRUGList, page);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/treat/0404E_Ajax_Treat_DRUGSEQ");
		mav.addObject("DRUGList", DRUGList);
		mav.addObject("FirstPage", Map_page.get("FirstPage").toString());
		mav.addObject("LastPage", Map_page.get("LastPage").toString());
		mav.addObject("TotalPage", Map_page.get("TotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		return mav;
	}
	@RequestMapping(value = "/DRUGChk")
	@ResponseBody
	public String DRUGChk(HttpServletRequest request,
    		@RequestParam(value = "DRUGCODE", defaultValue = "") String DRUGCODE
			) {
		System.out.println("DRUGChk!! DRUGCODE = " + DRUGCODE);
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		String ret = treat0404sSvc.upd_DrugData(USERID, "CB", "SelDrug", DRUGCODE);
		if(ret.equals("")){
			Map<String, Object> DRUGINFO = treat0404sSvc.getDrugInfo(DRUGCODE);
			if(DRUGINFO != null)
			{
				ret = JsonUtil.getJsonStringFromMap(DRUGINFO).toString();
			}
			else{
				ret = "-3";
			}
		}
		System.out.println("DRUGChk!! ret = " + ret);
		return ret;
	}
	@RequestMapping(value = "/DRUG_Delete")
	@ResponseBody
	public String DRUG_Delete(HttpServletRequest request,
    		@RequestParam(value = "DRUGCODE", defaultValue = "") String DRUGCODE
			) {
		System.out.println("DRUG_Delete!! DRUGCODE = " + DRUGCODE);
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		int chk = treat0404sSvc.deleteTmpInfo(USERID, "CB", "SelDrug", DRUGCODE);
		return String.valueOf(chk);
	}
	
	@RequestMapping(value = "/PreScrptAdd_Save")
	public ModelAndView PreScrptAdd_Save(HttpServletRequest request, @RequestParam Map<String, Object> param) 
	{
		System.out.println("PreScrptAdd_Save!! DOCNO = " + param.get("DOCNO") + ", JJJ_DOCNO = " + param.get("JRNO") + ", DTLDay = " + param.get("DTLDay") + ", CBDOCNO = " + param.get("CBDOCNO"));
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
        if(param.get("CBDOCNO") != null && !param.get("CBDOCNO").toString().equals("")){
        	int deleteChk = treat0404sSvc.deleteCBInfo(param.get("CBDOCNO").toString());
        	if(deleteChk == -1){
        		mav.setViewName("redirect:/treat/0404/PreScrptAdd.do");
        		mav.addObject("DOCNO", param.get("DOCNO"));
        		mav.addObject("JRNO", param.get("JRNO"));
        		mav.addObject("DTLDay", param.get("DTLDay"));
        		mav.addObject("msg","처방전 저장에 실패하였습니다.");
        		return mav;
        	}
        }
        
        int insertChk = treat0404sSvc.insertCBInfo(param, USERID);
    	if(insertChk == -1){
    		mav.setViewName("redirect:/treat/0404/PreScrptAdd.do");
    		mav.addObject("DOCNO", param.get("DOCNO"));
    		mav.addObject("JRNO", param.get("JRNO"));
    		mav.addObject("DTLDay", param.get("DTLDay"));
    		mav.addObject("msg","일부 처방전 저장에 실패하였습니다.");
    		return mav;
    	}
    	else{
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", param.get("DOCNO"));
			mav.addObject("JRNO", param.get("JRNO"));
			return mav;
    	}
	}
	
	@RequestMapping(value = "/PreScrptAdd_Delete")
	public ModelAndView PreScrptAdd_Delete(HttpServletRequest request, @RequestParam Map<String, Object> param) 
	{
		System.out.println("PreScrptAdd_Delete!! DOCNO = " + param.get("DOCNO") + ", JJJ_DOCNO = " + param.get("JRNO") + ", DTLDay = " + param.get("DTLDay") + ", CBDOCNO = " + param.get("CBDOCNO"));
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
		
		if(param.get("CBDOCNO") == null || param.get("CBDOCNO").toString().equals("")){
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", param.get("DOCNO"));
			mav.addObject("JRNO", param.get("JRNO"));
			mav.addObject("msg","처방전 문서번호를 가져오지 못했습니다.");
			return mav;
		}
        int deleteChk = treat0404sSvc.deleteCBInfo(param.get("CBDOCNO").toString());
        if(deleteChk == -1){
        	mav.setViewName("redirect:/treat/0404/PreScrptAdd.do");
        	mav.addObject("DOCNO", param.get("DOCNO"));
        	mav.addObject("JRNO", param.get("JRNO"));
        	mav.addObject("DTLDay", param.get("DTLDay"));
        	mav.addObject("msg","처방전 삭제에 실패하였습니다.");
        	return mav;
        }
        else{
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", param.get("DOCNO"));
			mav.addObject("JRNO", param.get("JRNO"));
			return mav;
        }
	}
}
