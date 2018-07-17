package GEIT.AMS.Controller.jour;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletRequest;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import GEIT.AMS.Controller.common.CmKjpCtr;
import GEIT.AMS.Service.common.CmKjpSvc;
import GEIT.AMS.Service.jour.Jour0301ESvc;
import GEIT.AMS.auth.SessionParam;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/jour/0301", produces = "text/json; charset=EUC-KR")
public class Jour0301ECtr{

	@Autowired
	Jour0301ESvc jour0301eSvc;

	@Autowired
	CmKjpSvc cmKjpSvc;
	
	private static final Logger logger = LoggerFactory.getLogger(Jour0301ECtr.class);

	@RequestMapping(value = "/selectUserKjpList")
	@ResponseBody
	public String selectUserKjpList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		CmKjpCtr cmKjpCtr = new CmKjpCtr(cmKjpSvc);
		return cmKjpCtr.selectUserKjpList(request, param);
		
	}
	
	@RequestMapping(value = "/selectUserRcvTypeList")
	@ResponseBody
	public String selectUserRcvTypeList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		CmKjpCtr cmKjpCtr = new CmKjpCtr(cmKjpSvc);
		return cmKjpCtr.selectUserRcvTypeList(request, param);
	}
	
	@RequestMapping(value = "/deleteUserRcvType")
	@ResponseBody
	public int deleteUserRcvType(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		CmKjpCtr cmKjpCtr = new CmKjpCtr(cmKjpSvc);
		return cmKjpCtr.deleteUserRcvType(request, param);
	}
	
	/*문서정보*/
	@RequestMapping(value = "/updateSDJ_DocInfo", method = {RequestMethod.POST})
    public ModelAndView updateSDJ_DocInfo(HttpServletRequest request, @RequestParam Map<String, Object> param,
    		@RequestParam(value = "sdj_docno", defaultValue = "") String sdj_docno,
    		@RequestParam(value = "SDJ_USERINFO", defaultValue = "") String SDJ_USERINFO,
    		@RequestParam(value = "SDJ_WTHENO", defaultValue = "") String SDJ_WTHENO,
    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate
    		
    		) throws IOException {
    	logger.info("updateSDJ_DocInfo:" + request.toString());
	ModelAndView mav = new ModelAndView();
	
	HttpSession session = request.getSession(false);
	String USERID = session.getAttribute(SessionParam.ss_id).toString();
	
	mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
	int result = jour0301eSvc.updateSDJ_DocInfo(sdj_docno,SDJ_USERINFO,SDJ_WTHENO, USERID, mai_vvrmno,sdj_jnldate );
	return mav;
    }
	
	@RequestMapping(value = "/updateSDJ_Dicmnt")
    public ModelAndView updateSDJ_Dicmnt(HttpServletRequest request, @RequestParam Map<String, Object> param,
    		@RequestParam(value = "mai_vvrmno", defaultValue = "") String mai_vvrmno,
    		@RequestParam(value = "DAIO_CMNT", defaultValue = "") String DAIO_CMNT,
    		@RequestParam(value = "sdj_jnldate", defaultValue = "") String sdj_jnldate,
    		@RequestParam(value = "sdj_docno") String sdj_docno
    		) throws IOException {
    	logger.info("updateSDJ_Dicmnt:" + request.toString());
	ModelAndView mav = new ModelAndView();
	
	HttpSession session = request.getSession(false);
	String USERID = session.getAttribute(SessionParam.ss_id).toString();
	
	mav.setViewName("redirect:/jour/0301/main.do");
	int result = jour0301eSvc.updateSDJ_Dicmnt(mai_vvrmno, sdj_jnldate, DAIO_CMNT, USERID, sdj_docno);
	return mav;
    }
	
	/*지시사항*/
	@RequestMapping(value = "/updateSDJ05_Msg")
    public ModelAndView updateSDJ05_Msg(HttpServletRequest request, @RequestParam Map<String, Object> param,
    		@RequestParam(value = "SDJ05_CMNTETC", defaultValue = "") String SDJ05_CMNTETC,
    		@RequestParam(value = "SDJ05_RSLTETC", defaultValue = "") String SDJ05_RSLTETC,
    		@RequestParam(value = "SDJ05_ETCETC", defaultValue = "") String SDJ05_ETCETC,
    		@RequestParam(value = "sdj_docno") String sdj_docno,
    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate
    		) throws IOException {
    	logger.info("updateSDJ05_Msg:" + request.toString());
	ModelAndView mav = new ModelAndView();
	
	HttpSession session = request.getSession(false);
	String USERID = session.getAttribute(SessionParam.ss_id).toString();
	
	mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
	int result = jour0301eSvc.updateSDJ05_Msg(sdj_docno, SDJ05_CMNTETC, SDJ05_RSLTETC, SDJ05_ETCETC, USERID, mai_vvrmno, sdj_jnldate);
	return mav;
    }
	
	
	/*동물현황 특이사항*/
	@RequestMapping(value = "/updateSDJ01_Cmnt",method = {RequestMethod.POST})
    public ModelAndView updateSDJ01_Cmnt(HttpServletRequest request, @RequestParam Map<String, Object> param,
    		@RequestParam(value = "SDJ01_CMNT") String SDJ01_CMNT,
    		@RequestParam(value = "sdj_docno") String sdj_docno, 
    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate

    		) throws IOException {
    	logger.info("updateSDJ01_Cmnt:" + request.toString());
	ModelAndView mav = new ModelAndView();
	
	HttpSession session = request.getSession(false);
	String USERID = session.getAttribute(SessionParam.ss_id).toString();
	/*redirectAttributes.addAttribute(param);*/
	
	mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
	int result = jour0301eSvc.updateSDJ01_Cmnt(sdj_docno, SDJ01_CMNT, USERID, mai_vvrmno, sdj_jnldate);
	return mav;
    }
	
	// 동물사육관리 수정
	@RequestMapping(value = "/updateSDJ02_AniCmnt")
    public ModelAndView updateSDJ02_ANICMNT(HttpServletRequest request, @RequestParam Map<String, Object> param,
    		@RequestParam(value = "SDJ02_ANICMNT") String SDJ02_ANICMNT,
    		@RequestParam(value = "sdj_docno") String sdj_docno,
    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate
    		) throws IOException {
    	logger.info("updateSDJ02_AniCmnt:" + request.toString());
	ModelAndView mav = new ModelAndView();
	
	HttpSession session = request.getSession(false);
	String USERID = session.getAttribute(SessionParam.ss_id).toString();
	
	mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
	int result = jour0301eSvc.updateSDJ02_AniCmnt(sdj_docno, SDJ02_ANICMNT, USERID, mai_vvrmno, sdj_jnldate);
	return mav;
    }
	
	// 안전교육 등 관리 수정
	@RequestMapping(value = "/updateSDJ_SafeEdu")
    public ModelAndView updateSDJ_SafeEdu(HttpServletRequest request, @RequestParam Map<String, Object> param,
    		@RequestParam(value = "SDJ_SAFE_EDU") String SDJ_SAFE_EDU,
    		@RequestParam(value = "sdj_docno") String sdj_docno,
    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate) throws IOException {
    	logger.info("updateSDJ_SafeEdu:" + request.toString());
	ModelAndView mav = new ModelAndView();
	
	HttpSession session = request.getSession(false);
	String USERID = session.getAttribute(SessionParam.ss_id).toString();
	
	mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
	int result = jour0301eSvc.updateSDJ_SafeEdu(sdj_docno, SDJ_SAFE_EDU, USERID,mai_vvrmno, sdj_jnldate );
	return mav;
    }
	
	// 기타 수정
	@RequestMapping(value = "/updateSDJ_Etc")
    public ModelAndView updateSDJ_Etc(HttpServletRequest request, @RequestParam Map<String, Object> param,
    		@RequestParam(value = "SDJ_SAFE_ETC") String SDJ_SAFE_ETC,
    		@RequestParam(value = "sdj_docno") String sdj_docno,
    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate
    		) throws IOException {
    	logger.info("updateSDJ_Etc:" + request.toString());
	ModelAndView mav = new ModelAndView();
	
	HttpSession session = request.getSession(false);
	String USERID = session.getAttribute(SessionParam.ss_id).toString();
	
	mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
	int result = jour0301eSvc.updateSDJ_Etc(sdj_docno, SDJ_SAFE_ETC, USERID, mai_vvrmno,sdj_jnldate );
	return mav;
    }
	
	// 위생 및 방역관리 수정
		@RequestMapping(value = "/updateSDJ02_PrvCmnt")
	    public ModelAndView updateSDJ02_PrvCmnt(HttpServletRequest request, @RequestParam Map<String, Object> param,
	    		@RequestParam(value = "SDJ02_PRVCMNT") String SDJ02_PRVCMNT,
	    		@RequestParam(value = "sdj_docno") String sdj_docno,
	    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
	    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate
	    		) throws IOException {
	    	logger.info("updateSDJ02_PrvCmnt:" + request.toString());
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(false);
		String USERID = session.getAttribute(SessionParam.ss_id).toString();
		
		mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
		int result = jour0301eSvc.updateSDJ02_PrvCmnt(sdj_docno, SDJ02_PRVCMNT, USERID, mai_vvrmno,sdj_jnldate );
		return mav;
	    }
	
	// 동물사 온도
		@RequestMapping(value = "/updateSVG_Temp")
	    public ModelAndView updateSVG_Temp(HttpServletRequest request, 
	    		@RequestParam Map<String, Object> param,
	    		@RequestParam(value = "sdj_docno") String sdj_docno,
	    		@RequestParam(value = "SVG_IN_HTMPT") String SVG_IN_HTMPT,
	    		@RequestParam(value = "SVG_IN_LTMPT") String SVG_IN_LTMPT,
	    		@RequestParam(value = "SVG_OUT_HTMPT") String SVG_OUT_HTMPT,
	    		@RequestParam(value = "SVG_OUT_LTMPT") String SVG_OUT_LTMPT,
	    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
	    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate) throws IOException {
	    	logger.info("updateSVG_Temp:" + param.toString());
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(false);
		String USERID = session.getAttribute(SessionParam.ss_id).toString();
		
		mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
		int result = jour0301eSvc.updateSVG_Temp(sdj_docno, SVG_IN_HTMPT, SVG_IN_LTMPT, SVG_OUT_HTMPT, SVG_OUT_LTMPT, USERID,mai_vvrmno, sdj_jnldate);
		return mav;
	    }
		
		// 내외 순찰실적 수정
				@RequestMapping(value = "/updateSDJ_Sj")
			    public ModelAndView updateSDJ_Sj(HttpServletRequest request, 
			    		@RequestParam Map<String, Object> param,
			    		@RequestParam(value = "sdj_docno") String sdj_docno,
			    		@RequestParam(value = "SDJS_IN_TM") String SDJS_IN_TM,
			    		@RequestParam(value = "SDJS_IN_S") String SDJS_IN_S,
			    		@RequestParam(value = "SDJS_IN_WL_YN") String SDJS_IN_WL_YN,
			    		@RequestParam(value = "SDJS_IN_CMNT") String SDJS_IN_CMNT,
			    		@RequestParam(value = "SDJS_OUT_TM") String SDJS_OUT_TM,
			    		@RequestParam(value = "SDJS_OUT_S") String SDJS_OUT_S,
			    		@RequestParam(value = "SDJS_OUT_WL_YN") String SDJS_OUT_WL_YN,
			    		@RequestParam(value = "SDJS_OUT_CMNT") String SDJS_OUT_CMNT,
			    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
			    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate) throws IOException {
			    	logger.info("updateSDJ_Sj:" + param.toString());
				ModelAndView mav = new ModelAndView();
				
				HttpSession session = request.getSession(false);
				String USERID = session.getAttribute(SessionParam.ss_id).toString();
				
				mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
				int result = jour0301eSvc.updateSDJ_Sj(sdj_docno, SDJS_IN_TM, SDJS_IN_S, SDJS_IN_WL_YN, SDJS_IN_CMNT, SDJS_OUT_TM, SDJS_OUT_S, SDJS_OUT_WL_YN, 
						SDJS_OUT_CMNT, USERID,mai_vvrmno, sdj_jnldate);
				return mav;
			    }
	
	// 시설점검 특이사항
		@RequestMapping(value = "/updateSDJS_Ss_Cmnt")
	    public ModelAndView updateSDJS_Ss_Cmnt(HttpServletRequest request, 
	    		@RequestParam Map<String, Object> param,
	    		@RequestParam(value = "sdj_docno") String sdj_docno,
	    		@RequestParam(value = "SDJS_SS_CMNT") String SDJS_SS_CMNT,
	    		@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
	    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate) throws IOException {
	    	logger.info("updateSDJS_Ss_Cmnt:" + request.toString());
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession(false);
		String USERID = session.getAttribute(SessionParam.ss_id).toString();
		
		mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
		int result = jour0301eSvc.updateSDJS_Ss_Cmnt(sdj_docno, USERID, SDJS_SS_CMNT,mai_vvrmno,sdj_jnldate);
		return mav;
	    }
		
	// 시설점검 개선사항
		@RequestMapping(value = "/updateSDJS_Sc_Cmnt")
		public ModelAndView updateSDJS_Sc_Cmnt(HttpServletRequest request, 
				@RequestParam Map<String, Object> param,
				@RequestParam(value = "sdj_docno") String sdj_docno,
				@RequestParam(value = "SDJS_SC_CMNT") String SDJS_SC_CMNT,
				@RequestParam(value = "mai_vvrmno") String mai_vvrmno,
	    		@RequestParam(value = "sdj_jnldate") String sdj_jnldate) throws IOException {
			logger.info("updateSDJS_Sc_Cmnt:" + request.toString());
		ModelAndView mav = new ModelAndView();
				
		HttpSession session = request.getSession(false);
		String USERID = session.getAttribute(SessionParam.ss_id).toString();
				
		mav.setViewName("redirect:/jour/0301/view0301E.do?docno="+sdj_docno+"&vvrmno="+mai_vvrmno+"&date="+sdj_jnldate);
		int result = jour0301eSvc.updateSDJS_Sc_Cmnt(sdj_docno, USERID, SDJS_SC_CMNT, mai_vvrmno, sdj_jnldate);
		return mav;
		}
}
