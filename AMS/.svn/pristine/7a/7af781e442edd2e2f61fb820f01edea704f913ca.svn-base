package GEIT.AMS.Controller.biz;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.PmsUtil;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/biz/0202")
public class Biz0202Ctr {

	private static final Logger logger = LoggerFactory.getLogger(Biz0202Ctr.class);
	
	@Autowired
	private Biz0202SSvc biz0202sSvc;
	
	@Autowired
	private Base0102SSvc base0102SSvc;
		
    @RequestMapping(value="/main_Manual")
    public ModelAndView main_Manual(HttpServletRequest request, 
    		@RequestParam Map<String, Object> param) {
    	
    	String msg = param.get("msg") == null ? "" : param.get("msg").toString();
        HttpSession session = request.getSession(false);
        String User_id = session.getAttribute(SessionParam.ss_id).toString();
        param.put("USER_ID", User_id);
    	List<Map<String, Object>> bizlist = biz0202sSvc.selectBizManualList(param);
    	String page = param.get("page") == null ? "1" : param.get("page").toString();
    	Map<String, Object> Map_page = biz0202sSvc.pageSET(bizlist, page);
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("/biz/0202S_Biz_Manual_01");
		mav.addObject("Bizlist", bizlist);
		mav.addObject("BizFirstPage", Map_page.get("BizFirstPage").toString());
		mav.addObject("BizLastPage", Map_page.get("BizLastPage").toString());
		mav.addObject("BizTotalPage", Map_page.get("BizTotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		mav.addObject("USER_ID", User_id);
		mav.addObject("msg", msg);
		mav.addObject("PMS0201", PmsUtil.getPMSinfo("0201", request));
		return mav;
    }
    
    @RequestMapping(value="/main_Article")
    public ModelAndView main_Article(HttpServletRequest request, 
    		@RequestParam Map<String, Object> param) {
    	
    	String msg = param.get("msg") == null ? "" : param.get("msg").toString();
        HttpSession session = request.getSession(false);
        String User_id = session.getAttribute(SessionParam.ss_id).toString();
        param.put("USER_ID", User_id);
    	List<Map<String, Object>> bizlist = biz0202sSvc.selectBizArticleList(param);
    	String page = param.get("page") == null ? "1" : param.get("page").toString();
    	Map<String, Object> Map_page = biz0202sSvc.pageSET(bizlist, page);
    	ModelAndView mav = new ModelAndView();
		mav.setViewName("/biz/0202S_Biz_Article_01");
		mav.addObject("Bizlist", bizlist);
		mav.addObject("BizFirstPage", Map_page.get("BizFirstPage").toString());
		mav.addObject("BizLastPage", Map_page.get("BizLastPage").toString());
		mav.addObject("BizTotalPage", Map_page.get("BizTotalPage").toString());
		mav.addObject("page", Map_page.get("page").toString());
		mav.addObject("USER_ID", User_id);
		mav.addObject("msg", msg);
		mav.addObject("PMS0202", PmsUtil.getPMSinfo("0202", request));
		return mav;
    }
    @RequestMapping(value="/insBiz")
    public ModelAndView insBiz(HttpServletRequest request, 
    		@RequestParam(value = "BBSTYPE", defaultValue = "") String BBSTYPE,
    		@RequestParam(value = "msg", defaultValue = "") String msg){
		
    	ModelAndView mav = new ModelAndView();
    	String title = "";
    	String Subtitle = "";
		Map<String, Object> param = new HashMap<String, Object>();
		List<Map<String, Object>> KindList = new ArrayList<Map<String, Object>>();
    	if(BBSTYPE.equals("1")){
    		title = "업무별 메뉴얼";
    		Subtitle = "메뉴얼게시판";
    		param.put("MCC_L_CODE", "100");
    		param.put("MCC_M_CODE", "112");
    		KindList = base0102SSvc.getCommonCodeListSection(param);
    		if(!PmsUtil.getPMSinfo("0201", request).equals("Y")){
    			mav.setViewName("redirect:/biz/0202/main_Manual.do");
    			mav.addObject("msg", "권한이 없습니다.");
    			return mav;
    		}
    	}
    	else if(BBSTYPE.equals("2")){
    		title = "업무게시판";
    		Subtitle = "직원게시판";
    		param.put("MCC_L_CODE", "100");
    		param.put("MCC_M_CODE", "113");
    		KindList = base0102SSvc.getCommonCodeListSection(param);
    		if(!PmsUtil.getPMSinfo("0202", request).equals("Y")){
    			mav.setViewName("redirect:/biz/0202/main_Article.do");
    			mav.addObject("msg", "권한이 없습니다.");
    			return mav;
    		}
    	}
    	else{
			mav.setViewName("redirect:/main/L_Main_Admin.do");
			return mav;
    	}
		mav.setViewName("/biz/0202E_Biz_Ins_01");
		mav.addObject("BBSTYPE", BBSTYPE);
		mav.addObject("title", title);
		mav.addObject("Subtitle", Subtitle);
		mav.addObject("KindList", KindList);
		mav.addObject("msg", msg);
		return mav;
    }
    @RequestMapping(value="/insBiz_action")
    public ModelAndView insBiz_action(HttpServletRequest request, 
    		@RequestParam(value = "BBSTYPE", defaultValue = "") String BBSTYPE,
    		@RequestParam(value = "select_Kind", defaultValue = "") String select_Kind,
    		@RequestParam(value = "OPENYN", defaultValue = "N") String OPENYN,
    		@RequestParam(value = "Biz_title", defaultValue = "") String Biz_title,
    		@RequestParam(value = "Biz_cmnt", defaultValue = "") String Biz_cmnt,
    		@RequestParam("biz_file1") MultipartFile biz_file1,
    		@RequestParam("biz_file2") MultipartFile biz_file2,
    		@RequestParam("biz_file3") MultipartFile biz_file3){
    	Map<String, Object> param = new HashMap<String,Object>();
    	param.put("BBSTYPE", BBSTYPE);
    	param.put("select_Kind", select_Kind);
    	param.put("OPENYN", OPENYN);
    	param.put("Biz_title", Biz_title);
    	param.put("Biz_cmnt", Biz_cmnt);
    	param.put("biz_file1", biz_file1);
    	param.put("biz_file2", biz_file2);
    	param.put("biz_file3", biz_file3);
    	
    	ModelAndView mav = new ModelAndView();
    	String Max_DOCNO = biz0202sSvc.selectBiz_MaxDocno();
    	if(Max_DOCNO.isEmpty() || Max_DOCNO.equals("")){
			mav.setViewName("redirect:/biz/0202/insBiz.do");
			mav.addObject("BBSTYPE",param.get("BBSTYPE"));
			mav.addObject("msg","문서번호를 가져오지 못했습니다.");
			return mav;
    	}
    	else{
    		int DOCNO = Integer.valueOf(Max_DOCNO) + 1;
    		int BizChk = biz0202sSvc.insertBizInfo(param, Integer.toString(DOCNO), request);
    		if(BizChk != -1){
    			try{
    				biz0202sSvc.insfile(param, Integer.toString(DOCNO), request);
    			}
    			catch (Exception e) {
    				mav.setViewName("redirect:/biz/0202/detailBiz.do");
    				mav.addObject("BBSTYPE",param.get("BBSTYPE"));
    				mav.addObject("DOCNO",DOCNO);
    				mav.addObject("msg","파일저장에 실패하였습니다.");
        			return mav;
				}
    		}
    		else{
    			mav.setViewName("redirect:/biz/0202/insBiz.do");
				mav.addObject("BBSTYPE",param.get("BBSTYPE"));
				mav.addObject("msg","저장에 실패하였습니다 관리자에게 문의바랍니다.");
    			return mav;
    		}
    	}
    	if(BBSTYPE.equals("1")){
    		mav.setViewName("redirect:/biz/0202/main_Manual.do");
    	}
    	else if(BBSTYPE.equals("2")){
    		mav.setViewName("redirect:/biz/0202/main_Article.do");
    	}
    	else{
			mav.setViewName("redirect:/main/L_Main_Admin.do");
			return mav;
    	}
		return mav;
    }
    @RequestMapping(value="/detailBiz")
    public ModelAndView detailBiz(HttpServletRequest request, 
    		@RequestParam(value = "BBSTYPE", defaultValue = "") String BBSTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "msg", defaultValue = "") String msg
    		){
        HttpSession session = request.getSession(false);
        String User_id = session.getAttribute(SessionParam.ss_id).toString();
        String User_name = session.getAttribute(SessionParam.ss_gha_username).toString();
		biz0202sSvc.updateBizSelectCntInfo(DOCNO);
    	ModelAndView mav = new ModelAndView();
    	String title = "";
    	String Subtitle = "";
    	if(BBSTYPE.equals("1")){
    		title = "업무별 메뉴얼";
    		Subtitle = "메뉴얼게시판";
    	}
    	else if(BBSTYPE.equals("2")){
    		title = "업무게시판";
    		Subtitle = "직원게시판";
    	}
    	else{
			mav.setViewName("redirect:/main/L_Main_Admin.do");
			return mav;
    	}
		Map<String, Object> bizInfo = biz0202sSvc.getBizInfo(DOCNO, BBSTYPE);
    	bizInfo = biz0202sSvc.setCmnt(bizInfo);
    	List<Map<String, Object>> Commentlist = biz0202sSvc.selectCommentList(DOCNO);
    	Map<String, Object> Comment_page = biz0202sSvc.pageSET(Commentlist, "1");
    	List<Map<String, Object>> Filelist = biz0202sSvc.selectFileList(DOCNO, BBSTYPE);
		mav.setViewName("/biz/0202E_Biz_Detail_01");
		mav.addObject("BBSTYPE", BBSTYPE);
		mav.addObject("title", title);
		mav.addObject("Subtitle", Subtitle);
		mav.addObject("msg", msg);
		mav.addObject("BizInfo", bizInfo);
		mav.addObject("Commentlist", Commentlist);
		mav.addObject("Filelist", Filelist);
		mav.addObject("FilelistSize", Filelist.size());
		mav.addObject("BizFirstPage", Comment_page.get("BizFirstPage").toString());
		mav.addObject("BizLastPage", Comment_page.get("BizLastPage").toString());
		mav.addObject("BizTotalPage", Comment_page.get("BizTotalPage").toString());
		mav.addObject("page", Comment_page.get("page").toString());
		mav.addObject("USER_ID", User_id);
		mav.addObject("USER_NAME", User_name);
		mav.addObject("DOCNO", DOCNO);
		return mav;
    }
	@RequestMapping(value = "/CommentPage.do", method = RequestMethod.POST)
	public ModelAndView CommentPage(
		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
		@RequestParam(value = "page", defaultValue = "1") String page,
		HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String User_id = session.getAttribute(SessionParam.ss_id).toString();
        String User_name = session.getAttribute(SessionParam.ss_gha_username).toString();
        
    	List<Map<String, Object>> Commentlist = biz0202sSvc.selectCommentList(DOCNO);
    	Map<String, Object> Comment_page = biz0202sSvc.pageSET(Commentlist, page);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/biz/0202E_Ajax_Biz_Comment_01");
		mav.addObject("Commentlist", Commentlist);
		mav.addObject("BizFirstPage", Comment_page.get("BizFirstPage").toString());
		mav.addObject("BizLastPage", Comment_page.get("BizLastPage").toString());
		mav.addObject("BizTotalPage", Comment_page.get("BizTotalPage").toString());
		mav.addObject("page", Comment_page.get("page").toString());
		mav.addObject("USER_ID", User_id);
		mav.addObject("USER_NAME", User_name);
		mav.addObject("DOCNO", DOCNO);
		return mav;
	}
	@RequestMapping(value = "/insComment.do", method = RequestMethod.POST)
	@ResponseBody
	public String Ajax_insComment(
		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
		@RequestParam(value = "cmnt", defaultValue = "1") String cmnt,
		HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String User_id = session.getAttribute(SessionParam.ss_id).toString();
        byte[] cmntbyte = null;
		try {
			cmntbyte = cmnt.getBytes("UTF-8");
	        if(cmntbyte.length > 200){
	        	return "200byte를 초과하면 안됩니다.";
	        }
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(DOCNO.equals(""))
			return "문서번호를 가져오지 못했습니다.";
        int incChk = biz0202sSvc.insertCommentInfo(DOCNO, User_id, cmnt);
        if(incChk == -1){
        	return "false";
        }
        else{
        	return "true";
        }
	}
	@RequestMapping(value = "/updateComment.do", method = RequestMethod.POST)
	@ResponseBody
	public String Ajax_updateComment(
		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
		@RequestParam(value = "SEQ", defaultValue = "") String SEQ,
		@RequestParam(value = "cmnt", defaultValue = "") String cmnt,
		@RequestParam(value = "page", defaultValue = "1") String page,
		HttpServletRequest request){
        HttpSession session = request.getSession(false);
        String User_id = session.getAttribute(SessionParam.ss_id).toString();
        byte[] cmntbyte = null;
		try {
			cmntbyte = cmnt.getBytes("UTF-8");
	        if(cmntbyte.length > 200){
	        	return "200byte를 초과하면 안됩니다.";
	        }
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(DOCNO.equals(""))
			return "문서번호를 가져오지 못했습니다.";
		if(SEQ.equals(""))
			return "코멘트 정보를 가져오지 못했습니다.";
        int updateChk = biz0202sSvc.updateCommentInfo(DOCNO, SEQ, User_id, cmnt);
        if(updateChk == -1){
        	return "false";
        }
        else{
        	return "true";
        }
	}
	@RequestMapping(value = "/delComment.do", method = RequestMethod.POST)
	@ResponseBody
	public String Ajax_delComment(
		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
		@RequestParam(value = "SEQ", defaultValue = "") String SEQ,
		HttpServletRequest request){
		if(DOCNO.equals(""))
			return "문서번호를 가져오지 못했습니다.";
		if(SEQ.equals(""))
			return "코멘트 정보를 가져오지 못했습니다.";
        int delChk = biz0202sSvc.deleteCommentInfo(DOCNO, SEQ);
        if(delChk == -1){
        	return "false";
        }
        else{
        	return "true";
        }
	}
	@RequestMapping(value = "/Filedownload.do")
	public ModelAndView Ajax_Filedownload(
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
			@RequestParam(value = "SEQ", defaultValue = "") String SEQ,
			HttpServletResponse response){
		Map<String, Object> fileinfo = biz0202sSvc.getFileInfo(DOCNO,SEQ, "");
		return new ModelAndView("fileDownloadUtil", "downloadFile", fileinfo);
	}

	@RequestMapping(value="/delelteBizinfo")
	public ModelAndView delelteBizinfo(HttpServletRequest request, 
			@RequestParam(value = "BBSTYPE", defaultValue = "") String BBSTYPE,
			@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO
			){
		String msg = "";
		int bizChk = biz0202sSvc.deleteBizInfo(DOCNO);
		if(bizChk == -1){
			msg += "삭제에 실패하였습니다.";
		}
		else{
			boolean filechk = biz0202sSvc.deleteFileList(DOCNO, BBSTYPE);
			if(!filechk){
				msg += "일부 파일 삭제에 실패하였습니다.";
			}
			int commentChk = biz0202sSvc.deleteCommentList(DOCNO);
			if(commentChk == -1){
				msg += "코멘트 삭제에 실패하였습니다.";
			}
		}
		if(msg.equals("")){
			msg = "삭제완료";
		}
		ModelAndView mav = new ModelAndView();
		if(BBSTYPE.equals("1")){
			mav.setViewName("redirect:/biz/0202/main_Manual.do");
			mav.addObject("msg",msg);
			return mav;
		}
		else if(BBSTYPE.equals("2")){
			mav.setViewName("redirect:/biz/0202/main_Article.do");
			mav.addObject("msg",msg);
			return mav;
		}
		else{
			mav.setViewName("redirect:/main/L_Main_Admin.do");
			return mav;
		}
	}
    @RequestMapping(value="/updateBiz")
    public ModelAndView updateBiz(HttpServletRequest request, 
    		@RequestParam(value = "BBSTYPE", defaultValue = "") String BBSTYPE,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam(value = "msg", defaultValue = "") String msg
    		){
		
    	ModelAndView mav = new ModelAndView();
    	String title = "";
    	String Subtitle = "";
		List<Map<String, Object>> KindList = new ArrayList<Map<String, Object>>();
    	if(BBSTYPE.equals("1")){
    		title = "업무별 메뉴얼";
    		Subtitle = "메뉴얼게시판";
    		Map<String, Object> param = new HashMap<String, Object>();
    		param.put("MCC_L_CODE", "100");
    		param.put("MCC_M_CODE", "112");
    		KindList = base0102SSvc.getCommonCodeListSection(param);

    	}
    	else if(BBSTYPE.equals("2")){
    		title = "업무게시판";
    		Subtitle = "직원게시판";
    		Map<String, Object> param = new HashMap<String, Object>();
    		param.put("MCC_L_CODE", "100");
    		param.put("MCC_M_CODE", "113");
    		KindList = base0102SSvc.getCommonCodeListSection(param);
    	}
    	else{
			mav.setViewName("redirect:/main/L_Main_Admin.do");
			return mav;
    	}
    	Map<String, Object> bizInfo = biz0202sSvc.getBizInfo(DOCNO, BBSTYPE);
    	//bizInfo = biz0202sSvc.setCmnt(bizInfo);
    	List<Map<String, Object>> Filelist = biz0202sSvc.selectFileList(DOCNO, BBSTYPE);
    	for(int i = 0;i<Filelist.size();++i){
    		mav.addObject("fileNAME" + ( i + 1 ), Filelist.get(i).get("BDA_CMNT"));
    		mav.addObject("fileSEQ" + ( i + 1 ), Filelist.get(i).get("BDA_BZSEQNO"));
    	}
		mav.setViewName("/biz/0202E_Biz_Modify_01");
		mav.addObject("KindList", KindList);
		mav.addObject("BBSTYPE", BBSTYPE);
		mav.addObject("title", title);
		mav.addObject("Subtitle", Subtitle);
		mav.addObject("BizInfo", bizInfo);
		mav.addObject("DOCNO", DOCNO);
		mav.addObject("msg", msg);
		return mav;
    }
    @RequestMapping(value="/updateBiz_action")
    public ModelAndView updateBiz_action(HttpServletRequest request, 
    		@RequestParam(value = "BBSTYPE", defaultValue = "") String BBSTYPE,
    		@RequestParam(value = "select_Kind", defaultValue = "") String select_Kind,
    		@RequestParam(value = "OPENYN", defaultValue = "N") String OPENYN,
    		@RequestParam(value = "Biz_title", defaultValue = "") String Biz_title,
    		@RequestParam(value = "Biz_cmnt", defaultValue = "") String Biz_cmnt,
    		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
    		@RequestParam("biz_file1") MultipartFile biz_file1,
    		@RequestParam("biz_file2") MultipartFile biz_file2,
    		@RequestParam("biz_file3") MultipartFile biz_file3){
    	Map<String, Object> param = new HashMap<String,Object>();
    	param.put("BBSTYPE", BBSTYPE);
    	param.put("select_Kind", select_Kind);
    	param.put("OPENYN", OPENYN);
    	param.put("Biz_title", Biz_title);
    	param.put("Biz_cmnt", Biz_cmnt);
    	param.put("DOCNO", DOCNO);
    	param.put("biz_file1", biz_file1);
    	param.put("biz_file2", biz_file2);
    	param.put("biz_file3", biz_file3);
    	
    	ModelAndView mav = new ModelAndView();
    	int BizChk = biz0202sSvc.updateBizInfo(param, DOCNO, request);
    	if(BizChk != -1){
    		try{
    			biz0202sSvc.insfile(param, DOCNO, request);
    		}
    		catch (Exception e) {
    			mav.setViewName("redirect:/biz/0202/detailBiz.do");
    			mav.addObject("BBSTYPE",param.get("BBSTYPE"));
    			mav.addObject("DOCNO",DOCNO);
    			mav.addObject("msg","파일저장에 실패하였습니다.");
    			return mav;
    		}
    		biz0202sSvc.updateFileSeqInfo(DOCNO, BBSTYPE);
    	}
    	else{
    		mav.setViewName("redirect:/biz/0202/updateBiz.do");
			mav.addObject("BBSTYPE",param.get("BBSTYPE"));
			mav.addObject("DOCNO",DOCNO);
			mav.addObject("msg","저장에 실패하였습니다 관리자에게 문의바랍니다.");
    		return mav;
    	}
		mav.setViewName("redirect:/biz/0202/detailBiz.do");
		mav.addObject("BBSTYPE",param.get("BBSTYPE"));
		mav.addObject("DOCNO",DOCNO);
		return mav;
    }
	@RequestMapping(value = "/deleteFileInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public String Ajax_deleteFileInfo(
		@RequestParam(value = "DOCNO", defaultValue = "") String DOCNO,
		@RequestParam(value = "BBSTYPE", defaultValue = "") String BBSTYPE,
		@RequestParam(value = "SEQ", defaultValue = "") String SEQ,
		HttpServletRequest request){
		
		if(DOCNO.equals(""))
			return "문서번호를 가져오지 못했습니다.";
		if(SEQ.equals(""))
			return "파일 정보를 가져오지 못했습니다.";
		
        boolean deleteChk = biz0202sSvc.deleteFileInfo(DOCNO, BBSTYPE, SEQ);
        if(!deleteChk){
        	return "false";
        }
        else{
        	return "true";
        }
	}
}
