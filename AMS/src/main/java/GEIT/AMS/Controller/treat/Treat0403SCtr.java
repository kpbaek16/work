package GEIT.AMS.Controller.treat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import GEIT.AMS.Service.base.Base0102SSvc;
import GEIT.AMS.Service.sign.SIGN0701SSvc;
import GEIT.AMS.Service.treat.Treat0402SSvc;
import GEIT.AMS.Service.treat.Treat0403SSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.PmsUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/treat/0403", produces = "text/json; charset=EUC-KR")
public class Treat0403SCtr {

	@Autowired
	Treat0403SSvc treat0403sSvc;
	
	@Autowired
	Treat0402SSvc treat0402sSvc;
	
	@Autowired
	private Base0102SSvc base0102SSvc;
	
	@Autowired
	private SIGN0701SSvc sign0701SSvc;

	@RequestMapping(value = "/main")
	public ModelAndView System_Info(HttpServletRequest request,
			@RequestParam(value = "cal_1", defaultValue = "") String cal_1,
    		@RequestParam(value = "cal_2", defaultValue = "") String cal_2,
    		@RequestParam(value = "numKeyword", defaultValue = "") String numKeyword,
    		@RequestParam(value = "vvrmKeyword", defaultValue = "") String vvrmKeyword,
    		@RequestParam(value = "nameKeyword", defaultValue = "") String nameKeyword,
    		@RequestParam(value = "jinryoKind", defaultValue = "") String jinryoKind,
    		@RequestParam(value = "jinryoStatus", defaultValue = "") String jinryoStatus,
    		@RequestParam(value = "page", defaultValue = "1") String page,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {

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
		comm.put("MCC_M_CODE", "302");
		Statuslist = base0102SSvc.getCommonCodeListSection(comm);
	
		System.out.println("main!! cal_1 = " + param.get("cal_1") + ", cal_2 = " + param.get("cal_2") 
		+ ", numKeyword = " + param.get("numKeyword") + ", vvrmKeyword = " + param.get("vvrmKeyword") 
		+ ", nameKeyword = " + param.get("nameKeyword") + ", jinryoKind = " + param.get("jinryoKind") 
		+ ", jinryoStatus = " + param.get("jinryoStatus") + ", page = " + param.get("page") + ", msg = " + msg);
		
        List<Map<String, Object>> jinryolist = treat0403sSvc.selectAllList(param);
		
		System.out.println("jinryolist size = " + jinryolist.size());
    	Map<String, Object> Map_page = treat0403sSvc.pageSET(jinryolist, page);
    	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/treat/0403S_Treat_Jour_01");
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
		mav.addObject("PMS0403", PmsUtil.getPMSinfo("0403", request));
		return mav;
	}
	@RequestMapping(value = "/CareJnlAdd")
	public ModelAndView CareJnlAdd(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
    		@RequestParam(value = "msg", defaultValue = "") String msg) {
		
		System.out.println("main!! caDOCNOl_1 = " + DOCNO + ", JRNO = " + JRNO
		+ ", DTLDay = " + DTLDay + ", msg = " + msg);
		
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0403/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
		
		if(DTLDay.equals("")){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date nowYear = new Date();
			String dateString = formatter.format(nowYear);
			DTLDay = dateString;
		}
		Map<String, Object> comm = new HashMap<String, Object>();
		List<Map<String, Object>> DZZList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "300");
		comm.put("MCC_M_CODE", "303");
		DZZList = base0102SSvc.getCommonCodeListSection(comm);
		
		comm = new HashMap<String, Object>();
		List<Map<String, Object>> JRSTSList = new ArrayList<Map<String, Object>>();
		comm.put("MCC_L_CODE", "300");
		comm.put("MCC_M_CODE", "302");
		JRSTSList = base0102SSvc.getCommonCodeListSection(comm);
		
		boolean GESI_CHK = false;
		boolean JONGLYO_CHK = false;
		Map<String, Object> GESI_SIGN_INFO = null;
		List<Map<String, Object>> GESI_SIGN_USER = null;
		
		Map<String, Object> JONGLYO_SIGN_INFO = null;
		List<Map<String, Object>> JONGLYO_SIGN_USER = null;
		
		if(!sign0701SSvc.getSIGNCNT_Info(JRNO, "3", "Y").equals("0")){
			GESI_SIGN_INFO = sign0701SSvc.getSIGNInfo(JRNO, "3", "", "Y");
			if(GESI_SIGN_INFO != null){
				if(GESI_SIGN_INFO.get("BSL_PROCSTS").toString().equals("1")){
	    			Map<String, Object> USER_INFO = sign0701SSvc.getUSERInfo(GESI_SIGN_INFO.get("BSL_USER_ID").toString());
	    			if(USER_INFO != null){
	    				GESI_SIGN_INFO.put("BSL_USER_NAME", USER_INFO.get("MUI_NAME"));
	    				GESI_SIGN_INFO.put("BSL_TEAM_NO", USER_INFO.get("MTI_TEAMNO"));
	    				GESI_SIGN_INFO.put("BSL_TEAM_NAME", USER_INFO.get("MTI_TEAMNAME"));
	    				GESI_SIGN_INFO.put("BSL_DPT_NO", USER_INFO.get("MDI_LINKNO"));
	    				GESI_SIGN_INFO.put("BSL_DPT_NAME", USER_INFO.get("MDI_DPTNAME"));
	    				GESI_SIGN_INFO.put("BSL_JCCODE_NAME", USER_INFO.get("MUI_JCCODE_NAME"));
	    			}
	    		}
				GESI_SIGN_USER = sign0701SSvc.selectSIGN_USERList(JRNO, "3", GESI_SIGN_INFO.get("BSL_KJNO").toString(), GESI_SIGN_INFO.get("BSL_PROCSTS").toString());
				GESI_CHK = true;
			}
			if(!sign0701SSvc.getSIGNCNT_Info(JRNO, "4", "Y").equals("0")){
				JONGLYO_SIGN_INFO = sign0701SSvc.getSIGNInfo(JRNO, "4", "", "Y");
				if(JONGLYO_SIGN_INFO != null){
					if(JONGLYO_SIGN_INFO.get("BSL_PROCSTS").toString().equals("1")){
		    			Map<String, Object> USER_INFO = sign0701SSvc.getUSERInfo(JONGLYO_SIGN_INFO.get("BSL_USER_ID").toString());
		    			if(USER_INFO != null){
		    				JONGLYO_SIGN_INFO.put("BSL_USER_NAME", USER_INFO.get("MUI_NAME"));
		    				JONGLYO_SIGN_INFO.put("BSL_TEAM_NO", USER_INFO.get("MTI_TEAMNO"));
		    				JONGLYO_SIGN_INFO.put("BSL_TEAM_NAME", USER_INFO.get("MTI_TEAMNAME"));
		    				JONGLYO_SIGN_INFO.put("BSL_DPT_NO", USER_INFO.get("MDI_LINKNO"));
		    				JONGLYO_SIGN_INFO.put("BSL_DPT_NAME", USER_INFO.get("MDI_DPTNAME"));
		    				JONGLYO_SIGN_INFO.put("BSL_JCCODE_NAME", USER_INFO.get("MUI_JCCODE_NAME"));
		    			}
		    		}
					JONGLYO_SIGN_USER = sign0701SSvc.selectSIGN_USERList(JRNO, "4", JONGLYO_SIGN_INFO.get("BSL_KJNO").toString(), JONGLYO_SIGN_INFO.get("BSL_PROCSTS").toString());
					JONGLYO_CHK = true;
				}
			}
		}
		
		Map<String, Object> jinryoINFO = treat0403sSvc.getJnlInfo(DOCNO, JRNO);
		
		String ANICODE = jinryoINFO.get("BAA_ANICODE") != null ? jinryoINFO.get("BAA_ANICODE").toString() : "";
		Map<String, Object> m_AniTmp = treat0403sSvc.getAniINFO(ANICODE);
    	
		List<Map<String, Object>> m_JRDtl = treat0403sSvc.select_JRDateDtlList(JRNO);
		List<Map<String, Object>> m_CBData = treat0403sSvc.select_CBList(JRNO);
		List<Map<String, Object>> m_KYLst = treat0403sSvc.select_KYList(JRNO);
		List<Map<String, Object>> m_JRFileData = treat0403sSvc.select_FileList(JRNO);
		
		String J_CMNT = "";
		if(m_JRDtl != null && m_JRDtl.size() > 0){
			for(int i = 0;i < m_JRDtl.size();++i){
				if(m_JRDtl.get(i).get("JJD_JRDATE").toString().equals(DTLDay)){
					J_CMNT =  m_JRDtl.get(i).get("JJD_CMNT") == null ? "" : m_JRDtl.get(i).get("JJD_CMNT").toString();
				}
			}
		}
		String fileNAME = "";
		if(m_JRFileData != null && m_JRFileData.size() > 0){
			for(int i = 0;i < m_JRFileData.size();++i){
				if(m_JRFileData.get(i).get("BDA_BZDATE").equals(DTLDay)){
					fileNAME = m_JRFileData.get(i).get("BDA_CMNT")  == null ? "" : m_JRFileData.get(i).get("BDA_CMNT").toString();
				}
			}
		}
		mav.setViewName("/treat/0403E_Treat_Jour_02");
		mav.addObject("m_AniTmp", m_AniTmp);
		mav.addObject("DZZList", DZZList);
		mav.addObject("JRSTSList", JRSTSList);
		mav.addObject("jinryoINFO", jinryoINFO);
		mav.addObject("m_JRDtl", m_JRDtl);
		mav.addObject("m_CBData", m_CBData);
		mav.addObject("m_KYLst", m_KYLst);
		mav.addObject("m_JRDtl", m_JRDtl);
		mav.addObject("m_JRFileData", m_JRFileData);
		mav.addObject("m_JRDtlSize", m_JRDtl.size());
		mav.addObject("J_CMNT", J_CMNT);
		mav.addObject("DTLDay", DTLDay);
		mav.addObject("fileNAME", fileNAME);
		mav.addObject("msg", msg);
		mav.addObject("PMS0403", PmsUtil.getPMSinfo("0403", request));
		if(GESI_CHK){
			mav.addObject("GESI_SIGN_INFO", GESI_SIGN_INFO);
			mav.addObject("GESI_SIGN_USER", GESI_SIGN_USER);
		}
		if(JONGLYO_CHK){
			mav.addObject("JONGLYO_SIGN_INFO", JONGLYO_SIGN_INFO);
			mav.addObject("JONGLYO_SIGN_USER", JONGLYO_SIGN_USER);
		}
		mav.addObject("GESI_CHK", GESI_CHK);
		mav.addObject("JONGLYO_CHK", JONGLYO_CHK);
		return mav;
	}
	@RequestMapping(value = "/CareJnlAdd_Save")
	public ModelAndView CareJnlAdd_Save(HttpServletRequest request,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JRNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
			@RequestParam(value = "SDay", defaultValue = "1900-01-01") String SDay,
			@RequestParam(value = "EDay", defaultValue = "1900-01-01") String EDay,
			@RequestParam(value = "JJR_JRType", defaultValue = "") String JJR_JRType,
			@RequestParam(value = "JRDZZNAME", defaultValue = "") String JRDZZNAME,
			@RequestParam(value = "JRCMNT", defaultValue = "") String JRCMNT,
			@RequestParam(value = "DZZTYPE", defaultValue = "") String DZZTYPE,
			@RequestParam(value = "JRSTS", defaultValue = "") String JRSTS,
			@RequestParam(value = "INSU", defaultValue = "") String INSU,
			@RequestParam(value = "REQORGA", defaultValue = "") String REQORGA,
			@RequestParam(value = "RCDATE", defaultValue = "") String RCDATE,
			@RequestParam(value = "J_CMNT", defaultValue = "") String J_CMNT,
			@RequestParam(value = "PageType", defaultValue = "") String PageType,	
			@RequestParam(value = "CBDATE", defaultValue = "") String CBDATE,
			@RequestParam(value = "KSDATE", defaultValue = "") String KSDATE,	
			@RequestParam("biz_file") MultipartFile biz_file
			) {
		
		System.out.println("CareJnlAdd_Save!! DOCNO = " + DOCNO + ", JRNO = " + JRNO
		+ ", DTLDay = " + DTLDay + ", SDay = " + SDay
		+ ", EDay = " + EDay + ", JJR_JRType = " + JJR_JRType
		+ ", JRDZZNAME = " + JRDZZNAME + ", JRCMNT = " + JRCMNT + ", DZZTYPE = " + DZZTYPE
		+ ", JRSTS = " + JRSTS + ", INSU = " + INSU + ", REQORGA = " + REQORGA + ", RCDATE = " + RCDATE
		);
		
        HttpSession session = request.getSession(false);
        String USERID = session.getAttribute(SessionParam.ss_id).toString();
        
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0403/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
		boolean Setchk = false;
		String JJJ_DOCNO = JRNO;
		if(JJJ_DOCNO.equals("")){
	    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    	SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
	    	String res = "";
	    	try{
	    		Date res_Time = format.parse(RCDATE);
	    		res = format2.format(res_Time);
	    	}
	    	catch(ParseException e)
	    	{
				mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
				mav.addObject("DOCNO", DOCNO);
				mav.addObject("msg","진료일지 번호 생성 실패");
				return mav;
	    	}
	    	JJJ_DOCNO = treat0402sSvc.get_upd4DocNo("JR", "JN_JINRYO_JNL", "JJJ_DocNo", res);
			int chk = treat0403sSvc.insertJnlInfo(JJJ_DOCNO, SDay, EDay, JJR_JRType, DOCNO, JRDZZNAME, JRCMNT, DZZTYPE, JRSTS, INSU, REQORGA);
			if(chk != -1){
				Setchk = true;
			}
		}
		else{
			int chk = treat0403sSvc.updateJnlInfo(JJJ_DOCNO, SDay, EDay, JJR_JRType, DOCNO, JRDZZNAME, JRCMNT, DZZTYPE, JRSTS, INSU, REQORGA);
			if(chk != -1){
				Setchk = true;
			}
		}

		if(Setchk){
			if(treat0403sSvc.updateRctInfo(JJJ_DOCNO, JRSTS, DOCNO, USERID) >= 0){
				int JnlDateChk = treat0403sSvc.setJnlDateInfo(JJJ_DOCNO, DTLDay, J_CMNT, USERID);
				if(JnlDateChk == -1){
					mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
					mav.addObject("DOCNO", DOCNO);
					mav.addObject("JRNO", JJJ_DOCNO);
					mav.addObject("msg","처치 혹은 치료내용 저장 실패");
					return mav;
				}
				else{
					if(!biz_file.isEmpty()){
						try{
							if(treat0403sSvc.insfile(biz_file, DTLDay, JJJ_DOCNO, request) == -1){
								mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
								mav.addObject("DOCNO", DOCNO);
								mav.addObject("JRNO", JJJ_DOCNO);
				    			mav.addObject("msg","파일업로드에 성공하였으나 파일정보 저장에 실패하였습니다.");
				    			return mav;
							}
			    		}
			    		catch (Exception e) {
							mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
							mav.addObject("DOCNO", DOCNO);
							mav.addObject("JRNO", JJJ_DOCNO);
			    			mav.addObject("msg","파일저장에 실패하였습니다.");
			    			return mav;
			    		}
					}
					if(PageType.equals("KS")){
						mav.setViewName("redirect:/treat/0406/InspctMgrRes.do");
						mav.addObject("DOCNO", DOCNO);
						mav.addObject("JRNO", JJJ_DOCNO);
						mav.addObject("DTLDay", KSDATE);
						mav.addObject("MenuType", "J");
						return mav;
					}
					else if(PageType.equals("CB")){
						mav.setViewName("redirect:/treat/0404/PreScrptAdd.do");
						mav.addObject("DOCNO", DOCNO);
						mav.addObject("JRNO", JJJ_DOCNO);
						mav.addObject("DTLDay", CBDATE);
						return mav;
					}
					else {
						mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
						mav.addObject("DOCNO", DOCNO);
						mav.addObject("JRNO", JJJ_DOCNO);
						mav.addObject("DTLDay", DTLDay);
						return mav;
					}
				}
			}
			else{
				mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
				mav.addObject("DOCNO", DOCNO);
				mav.addObject("JRNO", JJJ_DOCNO);
				mav.addObject("msg","진료접수 업데이트 실패");
				return mav;
			}
		}
		else{
			mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("msg","진료일지 저장 실패");
			return mav;
		}
	}
	@RequestMapping(value = "/deleteFileInfo.do", method = RequestMethod.POST)
	public ModelAndView deleteFileInfo(
		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
		@RequestParam(value = "JRNO", defaultValue = "") String JJJ_DOCNO,
		@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay,
		HttpServletRequest request){
		
		System.out.println("deleteFileInfo!! DOCNO = " + DOCNO + ", JRNO = " + JJJ_DOCNO + ", DTLDay = " + DTLDay);
		
    	ModelAndView mav = new ModelAndView();
		if(DOCNO.equals("")){
			mav.setViewName("redirect:/treat/0403/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}
    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("JRNO", JJJ_DOCNO);
		if(JJJ_DOCNO.equals("")){
			mav.addObject("msg","진료번호를 가져오지 못했습니다.");
			return mav;
		}
        int deleteChk = treat0403sSvc.deleteFileList(JJJ_DOCNO, DTLDay, "JR001");
        if(deleteChk == -1){
			mav.addObject("msg","파일삭제에 실패하였습니다.");
			return mav;
        }
        else{
			mav.addObject("msg","파일삭제 완료");
			return mav;
        }
	}
	@RequestMapping(value = "/Filedownload.do")
	public ModelAndView Ajax_Filedownload(
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JJJ_DOCNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay){
		
		if(DOCNO.equals("")){
	    	ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/treat/0403/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}

		if(JJJ_DOCNO.equals("")){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","진료번호를 가져오지 못했습니다.");
			return mav;
		}
		
		List<Map<String, Object>> fileinfo = treat0403sSvc.SelectFileList(JJJ_DOCNO, DTLDay, "JR001");
		if(fileinfo != null && fileinfo.size() > 0){
			return new ModelAndView("fileDownloadUtil", "downloadFile",fileinfo.get(0));
		}
		else{
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","파일정보를 가져오지 못했습니다.");
			return mav;
		}
	}
	
	@RequestMapping(value = "/CareJnlAdd_Delete.do")
	public ModelAndView CareJnlAdd_Delete(
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JJJ_DOCNO){
		
		if(DOCNO.equals("")){
	    	ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/treat/0403/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}

		if(JJJ_DOCNO.equals("")){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","진료번호를 가져오지 못했습니다.");
			return mav;
		}
		
		List<Map<String, Object>> KYList = treat0403sSvc.selectJnlDateKYList(JJJ_DOCNO, "");
		if(KYList == null){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","검사예약 정보를 가져오지 못했습니다.");
			return mav;
		}
		for (Map<String, Object> map : KYList) {
	        int deleteChk = treat0403sSvc.deleteFileList(map.get("JJDKY_DOCNO").toString(), "", "");
	        if(deleteChk == -1){
		    	ModelAndView mav = new ModelAndView();
		    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
				mav.addObject("DOCNO", DOCNO);
				mav.addObject("JRNO", JJJ_DOCNO);
				mav.addObject("msg","일부 검사정보에 첨부 파일 삭제에 실패하였습니다.");
				return mav;
	        }
	        deleteChk = treat0403sSvc.deleteKSData(map.get("JJDKY_DOCNO").toString(), map.get("JJDKY_KSNO").toString()); 
	        if(deleteChk == -1){
		    	ModelAndView mav = new ModelAndView();
		    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
				mav.addObject("DOCNO", DOCNO);
				mav.addObject("JRNO", JJJ_DOCNO);
				mav.addObject("msg","일부 검사정보 삭제에 실패하였습니다.");
				return mav;
	        }
		}
        int Chk = treat0403sSvc.deleteKSInfo(JJJ_DOCNO, ""); 
        if(Chk == -1){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","검사예약 정보 삭제에 실패하였습니다.");
			return mav;
        }
        Chk = treat0403sSvc.deleteCBInfo(JJJ_DOCNO, ""); 
        if(Chk == -1){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","처방전 정보 삭제에 실패하였습니다.");
			return mav;
        }
        Chk = treat0403sSvc.deleteFileList(JJJ_DOCNO, "", "JR001");
        if(Chk == -1){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","진료일지에 첨부파일 삭제에 실패하였습니다.");
			return mav;
        }
        Chk = treat0403sSvc.deleteJnlDateInfo(JJJ_DOCNO, ""); 
        if(Chk == -1){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","진료내역 삭제에 실패하였습니다.");
			return mav;
        }
        Chk = treat0403sSvc.deleteJnlInfo(JJJ_DOCNO); 
        if(Chk == -1){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","진료일지 삭제에 실패하였습니다.");
			return mav;
        }
        Chk = treat0403sSvc.updateRctJnlDelete(JJJ_DOCNO); 
        if(Chk == -1){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","접수대장에 진료일지 정보를 삭제하지 못했습니다.");
			return mav;
        }
        ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/treat/0403/main.do");
		return mav;
	}
	@RequestMapping(value = "/CareJnlDate_Delete.do")
	public ModelAndView CareJnlDate_Delete(
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "JRNO", defaultValue = "") String JJJ_DOCNO,
			@RequestParam(value = "DTLDay", defaultValue = "") String DTLDay){
		
		if(DOCNO.equals("")){
	    	ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/treat/0403/main.do");
			mav.addObject("msg","접수번호가 없습니다.");
			return mav;
		}

		if(JJJ_DOCNO.equals("")){
	    	ModelAndView mav = new ModelAndView();
	    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
			mav.addObject("DOCNO", DOCNO);
			mav.addObject("JRNO", JJJ_DOCNO);
			mav.addObject("msg","진료번호를 가져오지 못했습니다.");
			return mav;
		}
        ModelAndView mav = new ModelAndView();
    	mav.setViewName("redirect:/treat/0403/CareJnlAdd.do");
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("JRNO", JJJ_DOCNO);
		List<Map<String, Object>> KYList = treat0403sSvc.selectJnlDateKYList(JJJ_DOCNO, "");
		if(KYList == null){
			mav.addObject("msg","검사예약 정보를 가져오지 못했습니다.");
			return mav;
		}
		for (Map<String, Object> map : KYList) {
	        int deleteChk = treat0403sSvc.deleteFileList(map.get("JJDKY_DOCNO").toString(), DTLDay, "");
	        if(deleteChk == -1){
				mav.addObject("msg","일부 검사정보에 첨부 파일 삭제에 실패하였습니다.");
				return mav;
	        }
	        deleteChk = treat0403sSvc.deleteKSData(map.get("JJDKY_DOCNO").toString(), map.get("JJDKY_KSNO").toString()); 
	        if(deleteChk == -1){
				mav.addObject("msg","일부 검사정보 삭제에 실패하였습니다.");
				return mav;
	        }
		}
        int Chk = treat0403sSvc.deleteKSInfo(JJJ_DOCNO, DTLDay); 
        if(Chk == -1){
			mav.addObject("msg","검사예약 정보 삭제에 실패하였습니다.");
			return mav;
        }
        Chk = treat0403sSvc.deleteCBInfo(JJJ_DOCNO, DTLDay); 
        if(Chk == -1){
			mav.addObject("msg","처방전 정보 삭제에 실패하였습니다.");
			return mav;
        }
        Chk = treat0403sSvc.deleteFileList(JJJ_DOCNO, DTLDay, "JR001");
        if(Chk == -1){
			mav.addObject("msg","진료내역에 첨부파일 삭제에 실패하였습니다.");
			return mav;
        }
        Chk = treat0403sSvc.deleteJnlDateInfo(JJJ_DOCNO, DTLDay); 
        if(Chk == -1){
			mav.addObject("msg","진료내역 삭제에 실패하였습니다.");
			return mav;
        }
        mav.addObject("msg","진료내역 삭제 완료");
		return mav;
	}

	
}
