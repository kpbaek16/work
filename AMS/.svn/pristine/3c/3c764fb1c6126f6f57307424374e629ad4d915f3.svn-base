package GEIT.AMS.Controller.sign;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import GEIT.AMS.Service.base.Base0102SSvc;
import GEIT.AMS.Service.common.CmDocSvc;
import GEIT.AMS.Service.sign.SIGN0701SSvc;
import GEIT.AMS.auth.SessionParam;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/sign/0701")
public class SIGN0701Ctr {
		
	@Autowired
	private Base0102SSvc base0102SSvc;
	
	@Autowired
	private SIGN0701SSvc sign0701SSvc;
	
	@Autowired
	private CmDocSvc cmDocSvc;
	
    @RequestMapping(value="/SIGN_INFO")
    public ModelAndView SIGN_INFO(HttpServletRequest request,
    		@RequestParam Map<String, Object> param) {
    	
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> DocKindList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "100");
		comm.put("MCC_M_CODE", "114");
		DocKindList = base0102SSvc.getCommonCodeListSection(comm);
		
		comm = new HashMap<String, Object>();
		List<Map<String, Object>> StatusList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "100");
		comm.put("MCC_M_CODE", "117");
		StatusList = base0102SSvc.getCommonCodeListSection(comm);
		
    	String msg = param.get("msg") == null ? "" : param.get("msg").toString();
    	
		System.out.println("SIGN_INFO!! selectDocKind = " + param.get("selectDocKind") + ", selectKind = " + param.get("selectKind") 
		+ ", selectStatus = " + param.get("selectStatus") + ", msg = " + msg);
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        param.put("USERID", USERID);
        
        List<Map<String, Object>> SIGNlist = sign0701SSvc.selectSignList(param);
    	String page = param.get("page") == null ? "1" : param.get("page").toString();
    	
    	System.out.println("SIGNlist size = " + SIGNlist.size());
    	Map<String, Object> Map_page = sign0701SSvc.pageSET(SIGNlist, page);
    	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("/sign/0701S_SIGN_INFO_01");
		mav.addObject("DocKindList", DocKindList);
		mav.addObject("StatusList", StatusList);
		mav.addObject("SIGNlist", SIGNlist);
		mav.addObject("param", param);
		mav.addObject("FirstPage", Map_page.get("FirstPage").toString());
		mav.addObject("LastPage", Map_page.get("LastPage").toString());
		mav.addObject("TotalPage", Map_page.get("TotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		mav.addObject("msg", msg);
		return mav;
    }
    @RequestMapping(value="/CONN_SIGN_INFO")
    public ModelAndView CONN_SIGN_INFO(HttpServletRequest request,
    		@RequestParam Map<String, Object> param) {
    	
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> DocKindList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "100");
		comm.put("MCC_M_CODE", "115");
		DocKindList = base0102SSvc.getCommonCodeListSection(comm);
		
		comm = new HashMap<String, Object>();
		List<Map<String, Object>> StatusList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "100");
		comm.put("MCC_M_CODE", "116");
		StatusList = base0102SSvc.getCommonCodeListSection(comm);
		
    	String msg = param.get("msg") == null ? "" : param.get("msg").toString();

		System.out.println("CONN_SIGN_INFO!! selectDocKind = " + param.get("selectDocKind") + ", selectKind = " + param.get("selectKind") 
		+ ", selectStatus = " + param.get("selectStatus") + ", msg = " + msg);
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        param.put("USERID", USERID);
        
        List<Map<String, Object>> SIGNlist = sign0701SSvc.selectCONNSignList(param);
    	String page = param.get("page") == null ? "1" : param.get("page").toString();
    	
    	System.out.println("SIGNlist size = " + SIGNlist.size());
    	Map<String, Object> Map_page = sign0701SSvc.pageSET(SIGNlist, page);
    	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("/sign/0701S_CONN_SIGN_INFO_01");
		mav.addObject("DocKindList", DocKindList);
		mav.addObject("StatusList", StatusList);
		mav.addObject("SIGNlist", SIGNlist);
		mav.addObject("param", param);
		mav.addObject("FirstPage", Map_page.get("FirstPage").toString());
		mav.addObject("LastPage", Map_page.get("LastPage").toString());
		mav.addObject("TotalPage", Map_page.get("TotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		mav.addObject("msg", msg);
		return mav;
    }
    @RequestMapping(value="/insSIGN")
    public ModelAndView insSIGN(HttpServletRequest request,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
    	ModelAndView mav = new ModelAndView();
		if(DOCTYPE.equals("") || DOCNO.equals("")){
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","문서정보가 올바르지 않습니다.");
			return mav;
		}
		
    	System.out.println("insSIGN!! DOCNO = " + DOCNO + ", DOCTYPE = " + DOCTYPE);
		if(!sign0701SSvc.getSIGNCNT_Info(DOCNO, DOCTYPE, "Y").equals("0")){
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","이미 결재문서가 있습니다.");
			return mav;
		}
		
        HttpSession session = request.getSession(false);
        
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		session.removeAttribute("SignNO");
		int deleteChk = sign0701SSvc.deleteTEMPList(USERID);
        String MAX_TK3 = sign0701SSvc.getMAX_TK3(USERID);
        if(MAX_TK3.equals("0")){
        	MAX_TK3 = "1";
        }
        else{
        	MAX_TK3 = String.valueOf((Integer.parseInt(MAX_TK3) + 1));
        }
		System.out.println("insSIGN!! deleteChk = " + deleteChk + ", USERID = " + USERID + ", MAX_TK3 = " + MAX_TK3);
        int TEMP_CHK = sign0701SSvc.insertTEMP_KJPList(USERID, MAX_TK3);
        List<Map<String, Object>> KJP_LIST = sign0701SSvc.selectTEMPList(USERID, MAX_TK3, "");
        
        List<Map<String, Object>> KJP_RCVLIST = sign0701SSvc.selectTEMPList(USERID, MAX_TK3, "RCV");
    	Map<String, Object> RCVMap_page = sign0701SSvc.pageSET(KJP_RCVLIST, "1");
		
        List<Map<String, Object>> KJP_NOTILIST = sign0701SSvc.selectTEMPList(USERID, MAX_TK3, "NOTI");
    	Map<String, Object> NOTIMap_page = sign0701SSvc.pageSET(KJP_NOTILIST, "1");
    	
		if(TEMP_CHK == 0)
	    	session.setAttribute("SignNO", "0");
		else
			session.setAttribute("SignNO", MAX_TK3);
		
		Map<String, Object> UserInfo = sign0701SSvc.getUSERInfo(USERID);
		
		Map<String, Object> comm = base0102SSvc.getSectionInfo("100","114",DOCTYPE);
		mav.setViewName("/sign/0701E_SIGN_Ins_01");
		mav.addObject("DOCTYPE_VAL", comm.get("MCC_S_NAME"));
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("DOCTYPE", DOCTYPE);
		mav.addObject("KJP_LIST", KJP_LIST);
		mav.addObject("UserInfo", UserInfo);
		mav.addObject("KJP_RCVLIST", KJP_RCVLIST);
		mav.addObject("RCVFirstPage", RCVMap_page.get("FirstPage").toString());
		mav.addObject("RCVLastPage", RCVMap_page.get("LastPage").toString());
		mav.addObject("RCVTotalPage", RCVMap_page.get("TotalPage").toString());
		mav.addObject("RCVpage", RCVMap_page.get("page").toString());
		mav.addObject("KJP_NOTILIST", KJP_NOTILIST);
		mav.addObject("NOTIFirstPage", NOTIMap_page.get("FirstPage").toString());
		mav.addObject("NOTILastPage", NOTIMap_page.get("LastPage").toString());
		mav.addObject("NOTITotalPage", NOTIMap_page.get("TotalPage").toString());
		mav.addObject("NOTIpage", NOTIMap_page.get("page").toString());
		mav.addObject("msg", msg);
		mav.addObject("INSTYPE", "");
		mav.addObject("DOCCMNT", "");
		mav.addObject("KJNO","");
		return mav;
    }
    @RequestMapping(value="/CONN_insSIGN")
    public ModelAndView CONN_insSIGN(HttpServletRequest request,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
    	ModelAndView mav = new ModelAndView();
		if(DOCTYPE.equals("") || DOCNO.equals("")){
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","문서정보가 올바르지 않습니다.");
			return mav;
		}
    	System.out.println("CONN_insSIGN!! DOCNO = " + DOCNO + ", DOCTYPE = " + DOCTYPE);
		if(!sign0701SSvc.getSIGNCNT_Info(DOCNO, DOCTYPE, "N").equals("0")){
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","이미 결재문서가 있습니다.");
			return mav;
		}
		
		
        HttpSession session = request.getSession(false);
        
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
		
		Map<String, Object> UserInfo = sign0701SSvc.getUSERInfo(USERID);
		
		Map<String, Object> comm = base0102SSvc.getSectionInfo("100","115",DOCTYPE);
		mav.setViewName("/sign/0701E_CONN_SIGN_Ins_01");
		mav.addObject("DOCTYPE_VAL", comm.get("MCC_S_NAME"));
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("DOCTYPE", DOCTYPE);
		mav.addObject("UserInfo", UserInfo);
		mav.addObject("msg", msg);
		mav.addObject("INSTYPE", "");
		mav.addObject("DOCCMNT", "");
		mav.addObject("KJNO","");
		mav.addObject("CMNT","");
		mav.addObject("PROCHK",sign0701SSvc.getProcess());
		return mav;
    }
    @RequestMapping(value="/insSIGN_action")
    public ModelAndView insSIGN_action(HttpServletRequest request,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "PROCSTS", defaultValue = "") String PROCSTS,
    		@RequestParam(value = "DOCCMNT", defaultValue = "") String DOCCMNT) {
    	
    	System.out.println("insSIGN_action!! DOCTYPE = " + DOCTYPE + ", DOCNO = " + DOCNO + ", PROCSTS = " + PROCSTS + ", DOCCMNT = " + DOCCMNT);
    	ModelAndView mav = new ModelAndView();
		if(DOCTYPE.equals("") || DOCNO.equals("")){
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","문서정보가 올바르지 않습니다.");
			return mav;
		}
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        
        String KJNO = sign0701SSvc.getMAX_KJNOInfo(DOCNO, DOCTYPE);
        int SIGN_Chk = sign0701SSvc.insertSIGNInfo(DOCNO, DOCTYPE, KJNO, "Y", DOCCMNT, PROCSTS, " ","",USERID);
        if(SIGN_Chk == 0){
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","저장에 실패하였습니다.");
			session.removeAttribute("SignNO");
			sign0701SSvc.deleteTEMPList(USERID);
			return mav;
        }
        else{
        	String MAX_TK3 = session.getAttribute("SignNO").toString();
        	int SIGN_USER_CHK = sign0701SSvc.insertSIGN_USERList(DOCNO, DOCTYPE, KJNO, USERID, MAX_TK3);
        	if(SIGN_USER_CHK > 0){
    			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
    			mav.addObject("DOCNO",DOCNO);
    			mav.addObject("DOCTYPE",DOCTYPE);
    			mav.addObject("KJNO",KJNO);
    			mav.addObject("msg","저장성공!");
    			if(PROCSTS.equals("3")){
    				sign0701SSvc.updateUserInfo(DOCNO, DOCTYPE, KJNO);
    				sign0701SSvc.updateSignUser(DOCNO, DOCTYPE, KJNO);
    			}
    			session.removeAttribute("SignNO");
    			sign0701SSvc.deleteTEMPList(USERID);
    			return mav;
        	}
        	else{
        		sign0701SSvc.deleteSIGNInfo(DOCNO, DOCTYPE, KJNO);
    			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
    			mav.addObject("msg","저장에 실패하였습니다.");
    			session.removeAttribute("SignNO");
    			sign0701SSvc.deleteTEMPList(USERID);
    			return mav;
        	}
        }
    }
    @RequestMapping(value="/CONN_insSIGN_action")
    public ModelAndView CONN_insSIGN_action(HttpServletRequest request,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "PROCSTS", defaultValue = "") String PROCSTS,
    		@RequestParam(value = "DOCCMNT", defaultValue = "") String DOCCMNT,
    		@RequestParam(value = "SIGNCMNT", defaultValue = "") String SIGNCMNT) {
    	
    	System.out.println("CONN_insSIGN_action!! DOCTYPE = " + DOCTYPE + ", DOCNO = " + DOCNO + ", PROCSTS = " + PROCSTS + ", DOCCMNT = " + DOCCMNT);
    	ModelAndView mav = new ModelAndView();
		if(DOCTYPE.equals("") || DOCNO.equals("")){
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","문서정보가 올바르지 않습니다.");
			return mav;
		}
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        
        String KJNO = sign0701SSvc.getMAX_KJNOInfo(DOCNO, DOCTYPE);
        String RSLTSTS = "";
    	if(PROCSTS.equals("2")){
    		RSLTSTS = "Y";
    	}
    	else{
    		RSLTSTS = " ";
    	}
        int SIGN_Chk = sign0701SSvc.insertSIGNInfo(DOCNO, DOCTYPE, KJNO, "N", DOCCMNT, PROCSTS, RSLTSTS, SIGNCMNT, USERID);
        if(SIGN_Chk == 0){
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","저장에 실패하였습니다.");
			return mav;
        }
        else{
        	mav.setViewName("redirect:/sign/0701/CONN_detailSIGN.do");
        	mav.addObject("DOCNO",DOCNO);
        	mav.addObject("DOCTYPE",DOCTYPE);
        	mav.addObject("KJNO",KJNO);
        	mav.addObject("msg","저장성공!");
        	if(PROCSTS.equals("2")){
        		sign0701SSvc.updateUserInfo(DOCNO, DOCTYPE, KJNO);
        		sign0701SSvc.updateSignUser(DOCNO, DOCTYPE, KJNO);
				if(!sign0701SSvc.pdfDownload(DOCNO, DOCTYPE, KJNO, request)){
					sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, DOCCMNT,"1", " ", SIGNCMNT, USERID);
					mav.addObject("msg","PDF문서 저장에 실패하였습니다. 상신할 수 없습니다.");
				}
				else{
					if(!sign0701SSvc.XML_Writer(DOCNO, DOCTYPE, KJNO, USERID, request)){
						sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, DOCCMNT,"1", " ", SIGNCMNT, USERID);
						sign0701SSvc.deleteFileInfo(DOCNO, KJNO, sign0701SSvc.getFileType(DOCTYPE));
						mav.addObject("msg","연계문서 생성실패! 상신할 수 없습니다.");
					}
				}
        	}
        	return mav;
        }
    }
    @RequestMapping(value="/updateKJP")
    public ModelAndView updateKJP(HttpServletRequest request,
    		@RequestParam(value = "page", defaultValue = "") String page,
    		@RequestParam(value = "type", defaultValue = "") String type
    		) {
    	System.out.println("updateKJP!! page = " + page + ", type = " + type);
    	HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
    	
    	String MAX_TK3 = session.getAttribute("SignNO").toString();
        List<Map<String, Object>> KJP_LIST = sign0701SSvc.selectTEMPList(USERID, MAX_TK3, type);
        page = page.equals("") ? "1" : page;
    	Map<String, Object> Map_page = sign0701SSvc.pageSET(KJP_LIST, page);
	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("/sign/0701E_Ajax_SIGN_USERKJP");
		mav.addObject("KJP_LIST",KJP_LIST);
		mav.addObject("FirstPage", Map_page.get("FirstPage").toString());
		mav.addObject("LastPage", Map_page.get("LastPage").toString());
		mav.addObject("TotalPage", Map_page.get("TotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		mav.addObject("type", type);
		return mav;
    }
    @RequestMapping(value="/searchUSER")
    public ModelAndView searchUSER(HttpServletRequest request,
    		@RequestParam(value = "search_TYPE", defaultValue = "") String search_TYPE,
    		@RequestParam(value = "txt_SearchUSER", defaultValue = "") String txt_SearchUSER,
    		@RequestParam(value = "page", defaultValue = "") String page
    		) {
    	HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
    	
    	String MAX_TK3 = session.getAttribute("SignNO").toString();
    	System.out.println("searchUSER!! search_TYPE = " + search_TYPE + ", txt_SearchUSER = " + txt_SearchUSER + ", USERID = " + USERID + ", MAX_TK3 = " + MAX_TK3);
        List<Map<String, Object>> USER_LIST = sign0701SSvc.selectUSERList(search_TYPE, txt_SearchUSER, USERID, MAX_TK3);
        page = page.equals("") ? "1" : page;
    	Map<String, Object> Map_page = sign0701SSvc.pageSET(USER_LIST, page);
	
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("/sign/0701E_Ajax_SIGN_SeqUSER");
		mav.addObject("USER_LIST",USER_LIST);
		mav.addObject("FirstPage", Map_page.get("FirstPage").toString());
		mav.addObject("LastPage", Map_page.get("LastPage").toString());
		mav.addObject("TotalPage", Map_page.get("TotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		return mav;
    }
	@RequestMapping(value = "/AddUser")
	@ResponseBody
	public String AddUser(HttpServletRequest request,	
			@RequestParam(value = "KJPID", defaultValue = "") String KJPID,
    		@RequestParam(value = "KJPTYPE", defaultValue = "") String KJPTYPE) {
    	HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
    	
    	String MAX_TK3 = session.getAttribute("SignNO").toString();
    	if(MAX_TK3.equals("0")){
    		MAX_TK3 = "1";
    	}
    	System.out.println("AddUser!! KJPID = " + KJPID + ", KJPTYPE = " + KJPTYPE + ", USERID = " + USERID + ", MAX_TK3 = " + MAX_TK3);
    	String UserCHK = sign0701SSvc.getTEMPInfo(USERID, MAX_TK3, KJPID);
    	if(!UserCHK.equals("0")){
    		return "이미 수신 혹은 참조에 추가되어있는 직원입니다.";
    	}
    	int InsCHK = sign0701SSvc.insertTEMP_KJPInfo(USERID, MAX_TK3, KJPID, KJPTYPE);
    	if(InsCHK > 0){
    		session.setAttribute("SignNO", MAX_TK3);
    		return "";
    	}
    	else{
    		return "결재선 추가에 실패하였습니다.";
    	}
	}
	@RequestMapping(value = "/DelUser")
	@ResponseBody
	public String DelUser(HttpServletRequest request,	
			@RequestParam(value = "KJPID", defaultValue = "") String KJPID) {
    	HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
    	
    	String MAX_TK3 = session.getAttribute("SignNO").toString();
    	System.out.println("DelUser!! KJPID = " + KJPID + ", USERID = " + USERID + ", MAX_TK3 = " + MAX_TK3);
    	int Delete = sign0701SSvc.deleteTEMPInfo(USERID, MAX_TK3, KJPID);
    	if(Delete > 0){
    		MAX_TK3 = sign0701SSvc.getMAX_TK3(USERID);
    		if(MAX_TK3.equals("0"))
    			session.setAttribute("SignNO", "1");
    		return "";
    	}
    	else{
    		return "결재선 삭제에 실패하였습니다.";
    	}
	}
    @RequestMapping(value="/KJPList")
    public ModelAndView KJPList(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
        String MAX_TK3 = session.getAttribute("SignNO").toString();
        
        List<Map<String, Object>> KJP_LIST = sign0701SSvc.selectTEMPList(USERID, MAX_TK3, "");
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("/sign/0701E_Ajax_SIGN_KJP");
		mav.addObject("KJP_LIST", KJP_LIST);
		return mav;
    }
    @RequestMapping(value="/detailSIGN")
    public ModelAndView detailSIGN(HttpServletRequest request,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO,
    		@RequestParam(value = "msg", defaultValue = "") String msg){
    	
    	System.out.println("detailSIGN!! DOCNO = " + DOCNO + ", DOCTYPE = " + DOCTYPE + ", KJNO = " + KJNO);
    	Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "Y");
    	ModelAndView mav = new ModelAndView();
    	if(SIGN_INFO != null){
    		if(SIGN_INFO.get("BSL_PROCSTS").toString().equals("1")){
    			Map<String, Object> USER_INFO = sign0701SSvc.getUSERInfo(SIGN_INFO.get("BSL_USER_ID").toString());
    			if(USER_INFO != null){
    				SIGN_INFO.put("BSL_USER_NAME", USER_INFO.get("MUI_NAME"));
    				SIGN_INFO.put("BSL_TEAM_NO", USER_INFO.get("MTI_TEAMNO"));
    				SIGN_INFO.put("BSL_TEAM_NAME", USER_INFO.get("MTI_TEAMNAME"));
    				SIGN_INFO.put("BSL_DPT_NO", USER_INFO.get("MDI_LINKNO"));
    				SIGN_INFO.put("BSL_DPT_NAME", USER_INFO.get("MDI_DPTNAME"));
    				SIGN_INFO.put("BSL_JCCODE_NAME", USER_INFO.get("MUI_JCCODE_NAME"));
    			}
    		}
    		List<Map<String, Object>> SIGN_USERList = sign0701SSvc.selectSIGN_USERList(DOCNO, DOCTYPE, KJNO, SIGN_INFO.get("BSL_PROCSTS").toString());
    		Map<String, Object> comm = base0102SSvc.getSectionInfo("100","114",DOCTYPE);

            HttpSession session = request.getSession(false);
        	String USERID = session.getAttribute(SessionParam.ss_id).toString();
        	
    		sign0701SSvc.updateCNFMSTSUserInfo(DOCNO, DOCTYPE, KJNO, USERID);	
    		mav.setViewName("/sign/0701E_SIGN_Detail");
    		mav.addObject("USERID",USERID);
    		mav.addObject("DOCTYPE_VAL", comm.get("MCC_S_NAME"));
    		mav.addObject("SIGN_INFO",SIGN_INFO);
    		mav.addObject("SIGN_USERList",SIGN_USERList);
    		mav.addObject("DOCNO",DOCNO);
			mav.addObject("DOCTYPE",DOCTYPE);
			mav.addObject("KJNO",KJNO);
			mav.addObject("msg", msg);
			return mav;
    	}
    	else{
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
    }
    @RequestMapping(value="/CONN_detailSIGN")
    public ModelAndView CONN_detailSIGN(HttpServletRequest request,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO,
    		@RequestParam(value = "msg", defaultValue = "") String msg){
    	
    	System.out.println("CONN_detailSIGN!! DOCNO = " + DOCNO + ", DOCTYPE = " + DOCTYPE + ", KJNO = " + KJNO);
    	Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "N");
    	sign0701SSvc.setCmnt(SIGN_INFO);
    	ModelAndView mav = new ModelAndView();
    	HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
    	if(SIGN_INFO != null){
    		if(SIGN_INFO.get("BSL_PROCSTS").toString().equals("1")){
    			Map<String, Object> USER_INFO = sign0701SSvc.getUSERInfo(SIGN_INFO.get("BSL_USER_ID").toString());
    			if(USER_INFO != null){
    				SIGN_INFO.put("BSL_USER_NAME", USER_INFO.get("MUI_NAME"));
    				SIGN_INFO.put("BSL_TEAM_NO", USER_INFO.get("MTI_TEAMNO"));
    				SIGN_INFO.put("BSL_TEAM_NAME", USER_INFO.get("MTI_TEAMNAME"));
    				SIGN_INFO.put("BSL_DPT_NO", USER_INFO.get("MDI_LINKNO"));
    				SIGN_INFO.put("BSL_DPT_NAME", USER_INFO.get("MDI_DPTNAME"));
    				SIGN_INFO.put("BSL_JCCODE_NAME", USER_INFO.get("MUI_JCCODE_NAME"));
    			}
    			if(SIGN_INFO.get("BSL_USER_ID").toString().equals(USERID)){
    				mav.addObject("PROCHK",sign0701SSvc.getProcess());
    			}
    		}
  
    		Map<String, Object> comm = base0102SSvc.getSectionInfo("100","115",DOCTYPE);

           

        	
    		sign0701SSvc.updateCNFMSTSUserInfo(DOCNO, DOCTYPE, KJNO, USERID);	
    		mav.setViewName("/sign/0701E_CONN_SIGN_Detail");
    		mav.addObject("USERID",USERID);
    		mav.addObject("DOCTYPE_VAL", comm.get("MCC_S_NAME"));
    		mav.addObject("SIGN_INFO",SIGN_INFO);
    		mav.addObject("DOCNO",DOCNO);
			mav.addObject("DOCTYPE",DOCTYPE);
			mav.addObject("KJNO",KJNO);
			mav.addObject("msg", msg);
			return mav;
    	}
    	else{
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
    }
    @RequestMapping(value="/deleteSIGNInfo")
    public ModelAndView deleteSIGNInfo(HttpServletRequest request,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO){
    	
    	System.out.println("deleteSIGNInfo!! DOCNO = " + DOCNO + ", DOCTYPE = " + DOCTYPE + ", KJNO = " + KJNO);
        HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
    	Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "Y");
    	ModelAndView mav = new ModelAndView();
    	if(SIGN_INFO != null){
    		if(SIGN_INFO.get("BSL_USER_ID").toString().equals(USERID)){
    			int DelSignUserChk = sign0701SSvc.deleteSIGNUserList(DOCNO, DOCTYPE, KJNO);
    			if(DelSignUserChk != -1){
        			int DelSignChk = sign0701SSvc.deleteSIGNInfo(DOCNO, DOCTYPE, KJNO);
        			if(DelSignChk != -1){
        				mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
        				mav.addObject("msg","삭제에 성공하였습니다.");
        				return mav;
        			}
        			else{
            			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
            			mav.addObject("DOCNO",DOCNO);
            			mav.addObject("DOCTYPE",DOCTYPE);
            			mav.addObject("KJNO",KJNO);
            			mav.addObject("msg","삭제실패!");
            			return mav;
        			}
    			}
    			else{
        			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
        			mav.addObject("DOCNO",DOCNO);
        			mav.addObject("DOCTYPE",DOCTYPE);
        			mav.addObject("KJNO",KJNO);
        			mav.addObject("msg","삭제실패!");
        			return mav;
    			}
    		}
    		else{
    			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
    			mav.addObject("msg","삭제할 수 있는 권한이 없습니다.");
    			return mav;
    		}
    	}
    	else{
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
    }
    @RequestMapping(value="/CONN_deleteSIGNInfo")
    public ModelAndView CONN_deleteSIGNInfo(HttpServletRequest request,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO){
    	
    	System.out.println("CONN_deleteSIGNInfo!! DOCNO = " + DOCNO + ", DOCTYPE = " + DOCTYPE + ", KJNO = " + KJNO);
        HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
    	Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "N");
    	ModelAndView mav = new ModelAndView();
    	if(SIGN_INFO != null){
    		if(SIGN_INFO.get("BSL_USER_ID").toString().equals(USERID)){
        		int DelSignChk = sign0701SSvc.deleteSIGNInfo(DOCNO, DOCTYPE, KJNO);
        		if(DelSignChk != -1){
        			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
        			mav.addObject("msg","삭제에 성공하였습니다.");
        			return mav;
        		}
        		else{
            		mav.setViewName("redirect:/sign/0701/CONN_detailSIGN.do");
            		mav.addObject("DOCNO",DOCNO);
            		mav.addObject("DOCTYPE",DOCTYPE);
            		mav.addObject("KJNO",KJNO);
            		mav.addObject("msg","삭제실패!");
            		return mav;
        		}
    		}
    		else{
    			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
    			mav.addObject("msg","삭제할 수 있는 권한이 없습니다.");
    			return mav;
    		}
    	}
    	else{
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
    }
    @RequestMapping(value="/setSIGN_Action")
    public ModelAndView setSIGN_Action(HttpServletRequest request,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO,
    		@RequestParam(value = "TYPE", defaultValue = "") String TYPE
    		){
    	
    	System.out.println("setSIGN_Action!! DOCNO = " + DOCNO + ", DOCTYPE = " + DOCTYPE + ", KJNO = " + KJNO + ", TYPE = " + TYPE);
        HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
    	Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "Y");
    	ModelAndView mav = new ModelAndView();
    	if(SIGN_INFO == null){
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
    	if(SIGN_INFO.get("BSL_PROCSTS").toString().equals("1")){
			int update_chk = sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, SIGN_INFO.get("BSL_DOCCMNT").toString(),"3", " ","",USERID);
			if(update_chk != -1){
				sign0701SSvc.updateUserInfo(DOCNO, DOCTYPE, KJNO);
				sign0701SSvc.updateSignUser(DOCNO, DOCTYPE, KJNO);
    			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
    			mav.addObject("DOCNO",DOCNO);
    			mav.addObject("DOCTYPE",DOCTYPE);
    			mav.addObject("KJNO",KJNO);
    			mav.addObject("msg","상신이 완료되었습니다.");
    			return mav;
			}
    	}
    	Map<String, Object> SIGN_USER_INFO = sign0701SSvc.getSignUserInfo(DOCNO, DOCTYPE, KJNO);
    	if(SIGN_USER_INFO != null){
    		if(!SIGN_USER_INFO.get("BSU_KJ_USERID").toString().equals(USERID)){
    			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
    			mav.addObject("DOCNO",DOCNO);
    			mav.addObject("DOCTYPE",DOCTYPE);
    			mav.addObject("KJNO",KJNO);
    			mav.addObject("msg","결재할 수 있는 권한이 없습니다.");
    			return mav;
    		}
    		else{
    			int update_USER_chk = sign0701SSvc.updateSignUserInfo(DOCNO, DOCTYPE, KJNO, TYPE, "E", USERID);
    			if(update_USER_chk != -1){
    				String PROCSTS = "";
    				String RSLTSTS = "";
					if(TYPE.equals("Y")){
						if(SIGN_USER_INFO.get("LASTCHK").toString().equals("0")){
							PROCSTS = "4";
        					RSLTSTS = TYPE;
	    				}
	    				else{
	    					PROCSTS = "3";
    						RSLTSTS = " ";
	    				}
					}
					else{
    					PROCSTS = "5";
    					RSLTSTS = TYPE;
					}
    				int update_chk = sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, SIGN_INFO.get("BSL_DOCCMNT").toString(), PROCSTS, RSLTSTS, "",USERID);
    				if(update_chk != -1){
    					if(TYPE.equals("Y")){
    						Map<String, Object> NextSignInfo = sign0701SSvc.getNextSignUserInfo(DOCNO, DOCTYPE, KJNO, SIGN_USER_INFO.get("BSU_ORDER").toString());
    						if(NextSignInfo != null){
    							sign0701SSvc.updateNextSignUserInfo(DOCNO, DOCTYPE, KJNO, NextSignInfo.get("BSU_KJ_USERID").toString(), USERID);
    						}
    						mav.addObject("msg","결재완료");
    					}
    					else{
    						mav.addObject("msg","반려완료");
    					}
            			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
            			mav.addObject("DOCNO",DOCNO);
            			mav.addObject("DOCTYPE",DOCTYPE);
            			mav.addObject("KJNO",KJNO);

            			return mav;
    				}
    				else{
    	    			sign0701SSvc.updateSignUserInfo(DOCNO, DOCTYPE, KJNO, "X", SIGN_USER_INFO.get("BSU_KJPRCSTS").toString(), USERID);
            			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
            			mav.addObject("DOCNO",DOCNO);
            			mav.addObject("DOCTYPE",DOCTYPE);
            			mav.addObject("KJNO",KJNO);
            			mav.addObject("msg","결재실패!");
            			return mav;
    				}
    			}
    			else{
        			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
        			mav.addObject("DOCNO",DOCNO);
        			mav.addObject("DOCTYPE",DOCTYPE);
        			mav.addObject("KJNO",KJNO);
        			mav.addObject("msg","결재실패!");
        			return mav;
    			}
    		}
    	}
    	else{
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
    }
    @RequestMapping(value="/CONN_setSIGN_Action")
    public ModelAndView CONN_setSIGN_Action(HttpServletRequest request,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO
    		){
    	
    	System.out.println("CONN_setSIGN_Action!! DOCNO = " + DOCNO + ", DOCTYPE = " + DOCTYPE + ", KJNO = " + KJNO);
        HttpSession session = request.getSession(false);
    	String USERID = session.getAttribute(SessionParam.ss_id).toString();
    	Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "N");
    	ModelAndView mav = new ModelAndView();
    	if(SIGN_INFO == null){
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
		int update_chk = sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, SIGN_INFO.get("BSL_DOCCMNT").toString(),"2", "Y", SIGN_INFO.get("BSL_CMNT").toString(), USERID);
		if(update_chk != -1){
			sign0701SSvc.updateUserInfo(DOCNO, DOCTYPE, KJNO);
			sign0701SSvc.updateSignUser(DOCNO, DOCTYPE, KJNO);
    		mav.addObject("msg","상신이 완료되었습니다.");
			if(!sign0701SSvc.pdfDownload(DOCNO, DOCTYPE, KJNO, request)){
				sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, SIGN_INFO.get("BSL_DOCCMNT").toString(),"1", " ", SIGN_INFO.get("BSL_CMNT").toString(), USERID);
				mav.addObject("msg","PDF문서 저장에 실패하였습니다. 상신할 수 없습니다.");
			}
			else
			{
				if(!sign0701SSvc.XML_Writer(DOCNO, DOCTYPE, KJNO, USERID, request)){
					sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, SIGN_INFO.get("BSL_DOCCMNT").toString(),"1", " ", SIGN_INFO.get("BSL_CMNT").toString(), USERID);
					sign0701SSvc.deleteFileInfo(DOCNO, KJNO, sign0701SSvc.getFileType(DOCTYPE));
					mav.addObject("msg","연계문서 생성실패! 상신할 수 없습니다.");
				}
			}
		}
		else{
			mav.addObject("msg","상신에 실패하였습니다.");
		}
		mav.setViewName("redirect:/sign/0701/CONN_detailSIGN.do");
		mav.addObject("DOCNO",DOCNO);
		mav.addObject("DOCTYPE",DOCTYPE);
		mav.addObject("KJNO",KJNO);
		return mav;
    }
    @RequestMapping(value="/modifySIGN")
    public ModelAndView modifySIGN(HttpServletRequest request,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
    	ModelAndView mav = new ModelAndView();
		if(DOCTYPE.equals("") || DOCNO.equals("")){
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","문서정보가 올바르지 않습니다.");
			return mav;
		}
		
	    Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "Y");
    	if(SIGN_INFO != null){
    		HttpSession session = request.getSession(false);
            String USERID = session.getAttribute(SessionParam.ss_id).toString();
    		session.removeAttribute("SignNO");
    		int deleteChk = sign0701SSvc.deleteTEMPList(USERID);
            String MAX_TK3 = sign0701SSvc.getMAX_TK3(USERID);
            if(MAX_TK3.equals("0")){
            	MAX_TK3 = "1";
            }
            else{
            	MAX_TK3 = String.valueOf((Integer.parseInt(MAX_TK3) + 1));
            }
    		System.out.println("modifySIGN!! DOCNO = " + DOCNO + ", DOCTYPE = " + DOCTYPE + ", KJNO = " + KJNO);
    		System.out.println("modifySIGN!! deleteChk = " + deleteChk + ", USERID = " + USERID + ", MAX_TK3 = " + MAX_TK3);
            int TEMP_CHK = sign0701SSvc.insertTEMP_SIGNUSERList(DOCNO, DOCTYPE, KJNO, USERID, MAX_TK3);
            List<Map<String, Object>> KJP_LIST = sign0701SSvc.selectTEMPList(USERID, MAX_TK3, "");
            
            List<Map<String, Object>> KJP_RCVLIST = sign0701SSvc.selectTEMPList(USERID, MAX_TK3, "RCV");
        	Map<String, Object> RCVMap_page = sign0701SSvc.pageSET(KJP_RCVLIST, "1");
    		
            List<Map<String, Object>> KJP_NOTILIST = sign0701SSvc.selectTEMPList(USERID, MAX_TK3, "NOTI");
        	Map<String, Object> NOTIMap_page = sign0701SSvc.pageSET(KJP_NOTILIST, "1");
        	
    		if(TEMP_CHK == 0)
    	    	session.setAttribute("SignNO", "0");
    		else
    			session.setAttribute("SignNO", MAX_TK3);
    		
    		Map<String, Object> USER_INFO = sign0701SSvc.getUSERInfo(SIGN_INFO.get("BSL_USER_ID").toString());
    		Map<String, Object> comm = base0102SSvc.getSectionInfo("100","114",DOCTYPE);
    		mav.setViewName("/sign/0701E_SIGN_Ins_01");
    		mav.addObject("DOCTYPE_VAL", comm.get("MCC_S_NAME"));
    		mav.addObject("DOCNO", DOCNO);
    		mav.addObject("DOCTYPE", DOCTYPE);
    		mav.addObject("KJP_LIST", KJP_LIST);
    		mav.addObject("UserInfo", USER_INFO);
    		mav.addObject("KJP_RCVLIST", KJP_RCVLIST);
    		mav.addObject("RCVFirstPage", RCVMap_page.get("FirstPage").toString());
    		mav.addObject("RCVLastPage", RCVMap_page.get("LastPage").toString());
    		mav.addObject("RCVTotalPage", RCVMap_page.get("TotalPage").toString());
    		mav.addObject("RCVpage", RCVMap_page.get("page").toString());
    		mav.addObject("KJP_NOTILIST", KJP_NOTILIST);
    		mav.addObject("NOTIFirstPage", NOTIMap_page.get("FirstPage").toString());
    		mav.addObject("NOTILastPage", NOTIMap_page.get("LastPage").toString());
    		mav.addObject("NOTITotalPage", NOTIMap_page.get("TotalPage").toString());
    		mav.addObject("NOTIpage", NOTIMap_page.get("page").toString());
    		mav.addObject("msg", msg);
    		mav.addObject("INSTYPE", "M");
    		mav.addObject("DOCCMNT", SIGN_INFO.get("BSL_DOCCMNT").toString());
			mav.addObject("KJNO",KJNO);
    		return mav;
    	}
    	else{
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
    }
    @RequestMapping(value="/CONN_modifySIGN")
    public ModelAndView CONN_modifySIGN(HttpServletRequest request,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
    	ModelAndView mav = new ModelAndView();
		if(DOCTYPE.equals("") || DOCNO.equals("")){
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","문서정보가 올바르지 않습니다.");
			return mav;
		}
		
	    Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "N");
    	if(SIGN_INFO != null){
    		Map<String, Object> USER_INFO = sign0701SSvc.getUSERInfo(SIGN_INFO.get("BSL_USER_ID").toString());
    		Map<String, Object> comm = base0102SSvc.getSectionInfo("100","115",DOCTYPE);
    		mav.setViewName("/sign/0701E_CONN_SIGN_Ins_01");
    		mav.addObject("DOCTYPE_VAL", comm.get("MCC_S_NAME"));
    		mav.addObject("DOCNO", DOCNO);
    		mav.addObject("DOCTYPE", DOCTYPE);
    		mav.addObject("UserInfo", USER_INFO);
    		mav.addObject("msg", msg);
    		mav.addObject("INSTYPE", "M");
    		mav.addObject("DOCCMNT", SIGN_INFO.get("BSL_DOCCMNT").toString());
			mav.addObject("KJNO",KJNO);
			mav.addObject("CMNT",SIGN_INFO.get("BSL_CMNT").toString());
			mav.addObject("PROCHK",sign0701SSvc.getProcess());
    		return mav;
    	}
    	else{
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
    }
    @RequestMapping(value="/modifySIGN_action")
    public ModelAndView modifySIGN_action(HttpServletRequest request,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO,
    		@RequestParam(value = "PROCSTS", defaultValue = "") String PROCSTS,
    		@RequestParam(value = "DOCCMNT", defaultValue = "") String DOCCMNT) {
    	
    	System.out.println("modifySIGN_action!! DOCTYPE = " + DOCTYPE + ", DOCNO = " + DOCNO + ", KJNO = " + KJNO + ", PROCSTS = " + PROCSTS + ", DOCCMNT = " + DOCCMNT);
    	ModelAndView mav = new ModelAndView();
		if(DOCTYPE.equals("") || DOCNO.equals("")){
			mav.setViewName("redirect:/sign/0701/SIGN_INFO.do");
			mav.addObject("msg","문서정보가 올바르지 않습니다.");
			return mav;
		}
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	    Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "Y");
    	if(SIGN_INFO == null){
			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
			mav.addObject("DOCNO",DOCNO);
			mav.addObject("DOCTYPE",DOCTYPE);
			mav.addObject("KJNO",KJNO);
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
	    
        int update_chk = sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, DOCCMNT, PROCSTS, " ", "", USERID);
        if(update_chk == 0){
			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
			mav.addObject("DOCNO",DOCNO);
			mav.addObject("DOCTYPE",DOCTYPE);
			mav.addObject("KJNO",KJNO);
			mav.addObject("msg","수정에 실패하였습니다.");
			session.removeAttribute("SignNO");
			sign0701SSvc.deleteTEMPList(USERID);
			return mav;
        }
        else{
			int DelSignUserChk = sign0701SSvc.deleteSIGNUserList(DOCNO, DOCTYPE, KJNO);
	        if(DelSignUserChk == 0){
				mav.setViewName("redirect:/sign/0701/detailSIGN.do");
				mav.addObject("DOCNO",DOCNO);
				mav.addObject("DOCTYPE",DOCTYPE);
				mav.addObject("KJNO",KJNO);
				mav.addObject("msg","결재선 업데이트에 실패하였습니다.");
				session.removeAttribute("SignNO");
				sign0701SSvc.deleteTEMPList(USERID);
				return mav;
	        }
        	String MAX_TK3 = session.getAttribute("SignNO").toString();
        	int SIGN_USER_CHK = sign0701SSvc.insertSIGN_USERList(DOCNO, DOCTYPE, KJNO, USERID, MAX_TK3);
        	if(SIGN_USER_CHK > 0){
    			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
    			mav.addObject("DOCNO",DOCNO);
    			mav.addObject("DOCTYPE",DOCTYPE);
    			mav.addObject("KJNO",KJNO);
    			mav.addObject("msg","수정성공!");
    			if(PROCSTS.equals("3")){
    				sign0701SSvc.updateUserInfo(DOCNO, DOCTYPE, KJNO);
    				sign0701SSvc.updateSignUser(DOCNO, DOCTYPE, KJNO);
    			}
    			session.removeAttribute("SignNO");
    			sign0701SSvc.deleteTEMPList(USERID);
    			return mav;
        	}
        	else{
        		sign0701SSvc.deleteSIGNInfo(DOCNO, DOCTYPE, KJNO);
    			mav.setViewName("redirect:/sign/0701/detailSIGN.do");
    			mav.addObject("DOCNO",DOCNO);
    			mav.addObject("DOCTYPE",DOCTYPE);
    			mav.addObject("KJNO",KJNO);
    			mav.addObject("msg","수정에 실패하였습니다.");
    			session.removeAttribute("SignNO");
    			sign0701SSvc.deleteTEMPList(USERID);
    			return mav;
        	}
        }
    }
    @RequestMapping(value="/CONN_modifySIGN_action")
    public ModelAndView CONN_modifySIGN_action(HttpServletRequest request,
    		@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "KJNO", defaultValue = "") String KJNO,
    		@RequestParam(value = "PROCSTS", defaultValue = "") String PROCSTS,
    		@RequestParam(value = "DOCCMNT", defaultValue = "") String DOCCMNT,
    		@RequestParam(value = "SIGNCMNT", defaultValue = "") String SIGNCMNT
    		) {
    	
    	System.out.println("CONN_modifySIGN_action!! DOCTYPE = " + DOCTYPE + ", DOCNO = " + DOCNO + ", KJNO = " + KJNO + ", PROCSTS = " + PROCSTS + ", DOCCMNT = " + DOCCMNT);
    	ModelAndView mav = new ModelAndView();
		if(DOCTYPE.equals("") || DOCNO.equals("")){
			mav.setViewName("redirect:/sign/0701/CONN_SIGN_INFO.do");
			mav.addObject("msg","문서정보가 올바르지 않습니다.");
			return mav;
		}
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
	    Map<String, Object> SIGN_INFO = sign0701SSvc.getSIGNInfo(DOCNO, DOCTYPE, KJNO, "N");
    	if(SIGN_INFO == null){
			mav.setViewName("redirect:/sign/0701/CONN_detailSIGN.do");
			mav.addObject("DOCNO",DOCNO);
			mav.addObject("DOCTYPE",DOCTYPE);
			mav.addObject("KJNO",KJNO);
			mav.addObject("msg","결재정보를 불러오지 못하였습니다.");
			return mav;
    	}
	    String RSL = "";
    	if(PROCSTS.equals("1")) RSL = " ";
    	else  RSL = "Y";
        int update_chk = sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, DOCCMNT, PROCSTS, RSL, SIGNCMNT, USERID);
        if(update_chk == 0){
			mav.setViewName("redirect:/sign/0701/CONN_detailSIGN.do");
			mav.addObject("DOCNO",DOCNO);
			mav.addObject("DOCTYPE",DOCTYPE);
			mav.addObject("KJNO",KJNO);
			mav.addObject("msg","수정에 실패하였습니다.");
			return mav;
        }
        else{
        	mav.setViewName("redirect:/sign/0701/CONN_detailSIGN.do");
        	mav.addObject("DOCNO",DOCNO);
        	mav.addObject("DOCTYPE",DOCTYPE);
        	mav.addObject("KJNO",KJNO);
        	mav.addObject("msg","수정성공");
        	if(PROCSTS.equals("2")){
        		sign0701SSvc.updateUserInfo(DOCNO, DOCTYPE, KJNO);
        		sign0701SSvc.updateSignUser(DOCNO, DOCTYPE, KJNO);
				if(!sign0701SSvc.pdfDownload(DOCNO, DOCTYPE, KJNO, request)){
					sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, DOCCMNT,"1", " ", SIGNCMNT, USERID);
					mav.addObject("msg","PDF문서 저장에 실패하였습니다. 상신할 수 없습니다.");
				}
				else{
					if(!sign0701SSvc.XML_Writer(DOCNO, DOCTYPE, KJNO, USERID, request)){
						sign0701SSvc.updateSignInfo(DOCNO, DOCTYPE, KJNO, DOCCMNT,"1", " ", SIGNCMNT, USERID);
						sign0701SSvc.deleteFileInfo(DOCNO, KJNO, sign0701SSvc.getFileType(DOCTYPE));
						mav.addObject("msg","연계문서 생성실패! 상신할 수 없습니다.");
					}
				}
        	}
        	return mav;
        }
    }
	@RequestMapping(value = "/view0701E_DeadPDF")
	public ModelAndView view0304E(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("dethInfo", cmDocSvc.getDethInfo(param.get("docno").toString()));
		mav.setViewName("/sign/0701E_SIGN_Jour_Dead_02");
		return mav;
	}
	@RequestMapping(value = "/view0701E_BurnPDF")
	public ModelAndView view0701E_BurnPDF(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("burnInfo", cmDocSvc.getBurnInfo(param.get("docno").toString()));
		mav.setViewName("/sign/0701E_SIGN_Jour_Burn_02");
		return mav;
	}
	@RequestMapping(value = "/Filedownload.do")
	public ModelAndView Ajax_Filedownload(
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "DOCTYPE", defaultValue = "") String DOCTYPE,
			@RequestParam(value = "KJNO", defaultValue = "") String KJNO,
			HttpServletResponse response){
		String type = "";
    	if(DOCTYPE.equals("1"))
    	{
    		type = "BS";
    	}
    	else if(DOCTYPE.equals("2"))
    	{
    		type = "DETH";
    	}
    	else if(DOCTYPE.equals("3"))
    	{
    		type = "BL";
    	}
    	else if(DOCTYPE.equals("4"))
    	{
    		type = "BLOOD";
    	}
		Map<String, Object> fileinfo = sign0701SSvc.getFileInfo(DOCNO, KJNO, type);
		return new ModelAndView("fileDownloadUtil", "downloadFile", fileinfo);
	}
}
