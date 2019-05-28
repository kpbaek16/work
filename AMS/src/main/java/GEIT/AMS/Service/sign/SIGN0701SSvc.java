package GEIT.AMS.Service.sign;

import org.apache.commons.codec.binary.Base64;
import java.awt.Image;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jdom2.CDATA;
import org.jdom2.DocType;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.text.Document;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.html.simpleparser.StyleSheet;
import com.itextpdf.text.pdf.ByteBuffer;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

import GEIT.AMS.Dao.sign.SIGN0701SDao;
import GEIT.AMS.Service.base.Base0101SSvc;
import GEIT.AMS.Service.biz.Biz0202SSvc;
import GEIT.AMS.auth.SessionParam;

import java.io.StringReader;

@Service
public class SIGN0701SSvc {
	
	@Autowired
	private SIGN0701SDao sign0701sDao;
	
	@Autowired
	private Base0101SSvc base0101sSvc;
	
	@Autowired
	private Biz0202SSvc biz0202sSvc;
	
	public List<Map<String, Object>> selectSignList(Map<String, Object> param) {
		return sign0701sDao.selectSignList(param);
	}
	public List<Map<String, Object>> selectCONNSignList(Map<String, Object> param) {
		return sign0701sDao.selectCONNSignList(param);
	}
	public List<Map<String, Object>> selectTEMPList(String USERID, String MAX_TK3, String RCVTYPE) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", USERID);
		param.put("MAX_TK3", MAX_TK3);
		param.put("RCVTYPE", RCVTYPE);
		List<Map<String, Object>> KJPLIST = sign0701sDao.selectTEMPList(param);
		int RCV_CNT = 0;
		int NOTI_CNT = 0;
		if(KJPLIST != null){
			for (Map<String, Object> map : KJPLIST) {
				if(map.get("T_DT").toString().equals("RCV")){
					RCV_CNT++;
				}
				if(map.get("T_DT").toString().equals("NOTI")){
					NOTI_CNT++;
				}
			}
			for (Map<String, Object> map : KJPLIST) {
				if(map.get("T_DT").toString().equals("RCV")){
					map.put("T_DT1", RCV_CNT);
					RCV_CNT--;
				}
				if(map.get("T_DT").toString().equals("NOTI")){
					map.put("T_DT1", NOTI_CNT);
					NOTI_CNT--;
				}
			}
		}
		return KJPLIST;
	}
	public Map<String, Object> getUSERInfo(String USERID){
		return sign0701sDao.getUSERInfo(USERID);
	}
	public String getMAX_TK3(String USERID){
		return sign0701sDao.getMAX_TK3(USERID);
	}
	public String getTEMPInfo(String USERID, String MAX_TK3, String KJPID){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", USERID);
		param.put("MAX_TK3", MAX_TK3);
		param.put("KJPID", KJPID);
		return sign0701sDao.getTEMPInfo(param);
	}
	public String getSIGNCNT_Info(String DOCNO, String DOCTYPE, String KIND){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("DOCTYPE", DOCTYPE);
		param.put("KIND", KIND);
		return sign0701sDao.getSIGNCNT_Info(param);
	}
	
	public Map<String, Object> getSIGNInfo(String DOCNO, String SignType, String KJNO, String KIND){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("KIND", KIND);
		return sign0701sDao.getSIGNInfo(param);
	}
	public Map<String, Object> setCmnt(Map<String, Object> param){
		String cmnt = param.get("BSL_CMNT") == null ? "" : param.get("BSL_CMNT").toString();
		cmnt = cmnt.replaceAll("\r\n","<br/>"); // 줄바꿈처리
		cmnt = cmnt.replaceAll(" ","&nbsp;"); 
		cmnt = cmnt.replaceAll("\t","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); 
		param.put("BSL_CMNT", cmnt);
		return param;
	}
	public List<Map<String, Object>> selectSIGN_USERList(String DOCNO, String SignType, String KJNO, String PROCSTS) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("PROCSTS", PROCSTS);
		
		List<Map<String, Object>> KJPLIST = sign0701sDao.selectSIGN_USERList(param);
		int RCV_CNT = 0;
		int NOTI_CNT = 0;
		if(KJPLIST != null){
			for (Map<String, Object> map : KJPLIST) {
				if(map.get("BSU_RCVTYPE").toString().equals("RCV")){
					RCV_CNT++;
				}
				if(map.get("BSU_RCVTYPE").toString().equals("NOTI")){
					NOTI_CNT++;
				}
			}
			for (Map<String, Object> map : KJPLIST) {
				if(map.get("BSU_RCVTYPE").toString().equals("RCV")){
					map.put("BSU_ORDER", RCV_CNT);
					RCV_CNT--;
				}
				if(map.get("BSU_RCVTYPE").toString().equals("NOTI")){
					map.put("BSU_ORDER", NOTI_CNT);
					NOTI_CNT--;
				}
			}
		}
		return KJPLIST;
	}
	
	public String getMAX_KJNOInfo(String DOCNO, String SignType){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		return sign0701sDao.getMAX_KJNOInfo(param);
	}
	public String getMAX_SIGN_NOInfo(String DOCNO, String SignType, String KJNO, String USERID){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("USERID", USERID);
		return sign0701sDao.getMAX_SIGN_NOInfo(param);
	}
	
	public Map<String, Object> getSignUserInfo(String DOCNO, String SignType, String KJNO){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		return sign0701sDao.getSignUserInfo(param);
	}
	public Map<String, Object> getNextSignUserInfo(String DOCNO, String SignType, String KJNO, String ORDER){
    	System.out.println("getNextSignUserInfo!! DOCNO = " + DOCNO + ", SignType = " + SignType + ", KJNO = " + KJNO + ", ORDER = " + ORDER);
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("ORDER", ORDER);
		return sign0701sDao.getNextSignUserInfo(param);
	}
	
	public int insertSIGNInfo(String DOCNO, String SignType, String KJNO, String KIND, String DOCCMNT, String PROCSTS, String RSLTSTS, String SIGNCMNT, String USERID){
		//String KJNO = getMAX_KJNOInfo(DOCNO, SignType);
		Map<String, Object> UserInfo = getUSERInfo(USERID);
		String USERNAME = "", TEAMNO = "", TEAMNAME = "", DPTNO = "", DPTNAME = "", JCNAME = "";
		if(UserInfo != null){
			USERNAME = UserInfo.get("MUI_NAME").toString();
			TEAMNO = UserInfo.get("MTI_TEAMNO").toString();
			TEAMNAME = UserInfo.get("MTI_TEAMNAME").toString();
			DPTNO = UserInfo.get("MDI_LINKNO").toString();
			DPTNAME = UserInfo.get("MDI_DPTNAME").toString();
			JCNAME = UserInfo.get("MUI_JCCODE_NAME").toString();
		}
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("KIND", KIND);
		param.put("DOCCMNT", DOCCMNT);
		param.put("PROCSTS", PROCSTS);
		param.put("RSLTSTS", RSLTSTS);
		param.put("USERID", USERID);
		param.put("USERNAME", USERNAME);
		param.put("TEAMNO", TEAMNO);
		param.put("TEAMNAME", TEAMNAME);
		param.put("DPTNO", DPTNO);
		param.put("DPTNAME", DPTNAME);
		param.put("JCNAME", JCNAME);
		param.put("SIGNCMNT", SIGNCMNT);
		return sign0701sDao.insertSIGNInfo(param);
	}
	
	public int insertSIGN_USERList(String DOCNO, String SignType, String KJNO, String USERID, String MAX_TK3){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("USERID", USERID);
		param.put("MAX_TK3", MAX_TK3);
		return sign0701sDao.insertSIGN_USERList(param);
	}
	
	public int updateSignInfo(String DOCNO, String SignType, String KJNO, String CMNT, String PROCSTS, String RSLTSTS, String SIGNCMNT, String USERID){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("DOCCMNT", CMNT);
		param.put("PROCSTS", PROCSTS);
		param.put("RSLTSTS", RSLTSTS);
		param.put("USERID", USERID);
		param.put("SIGNCMNT", SIGNCMNT);
		return sign0701sDao.updateSignInfo(param);
	}
	
	public int updateUserInfo(String DOCNO, String SignType, String KJNO){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		return sign0701sDao.updateUserInfo(param);
	}
	
	public int updateSignUser(String DOCNO, String SignType, String KJNO){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		return sign0701sDao.updateSignUser(param);
	}
	
	public int updateSignUserInfo(String DOCNO, String SignType, String KJNO, String KJSTS, String KJPRCSTS, String USERID){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("USERID", USERID);
		param.put("KJSTS", KJSTS);
		param.put("KJPRCSTS",KJPRCSTS);
		
		return sign0701sDao.updateSignUserInfo(param);
	}
	
	public int updateNextSignUserInfo(String DOCNO, String SignType, String KJNO, String KJ_USERID, String USERID){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("KJ_USERID", KJ_USERID);
		param.put("USERID", USERID);
		return sign0701sDao.updateNextSignUserInfo(param);
	}
	
	public int updateCNFMSTSUserInfo(String DOCNO, String SignType, String KJNO, String USERID){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("USERID", USERID);
		return sign0701sDao.updateCNFMSTSUserInfo(param);
	}
	
	public int updateCONN_SIGNInfo(String DOCNO, String SignType, String KJNO, String SUSINID, String BSLNO){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		param.put("SUSINID", SUSINID);
		param.put("BSLNO", BSLNO);
		return sign0701sDao.updateCONN_SIGNInfo(param);
	}
	
	public int insertTEMP_KJPList(String USERID, String MAX_TK3){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", USERID);
		param.put("MAX_TK3", MAX_TK3);
		return sign0701sDao.insertTEMP_KJPList(param);
	}
	
	public int insertTEMP_SIGNUSERList(String DOCNO, String DOCTYPE, String KJNO, String USERID, String MAX_TK3){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("DOCTYPE", DOCTYPE);
		param.put("KJNO", KJNO);
		param.put("USERID", USERID);
		param.put("MAX_TK3", MAX_TK3);
		return sign0701sDao.insertTEMP_SIGNUSERList(param);
	}
	
	public int insertTEMP_KJPInfo(String USERID, String MAX_TK3, String KJPID, String KJPTYPE){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", USERID);
		param.put("MAX_TK3", MAX_TK3);
		param.put("KJPID", KJPID);
		param.put("KJPTYPE", KJPTYPE);
		return sign0701sDao.insertTEMP_KJPInfo(param);
	}
	
	
	public int deleteSIGNUserList(String DOCNO, String SignType, String KJNO){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		return sign0701sDao.deleteSIGNUserList(param);
	}
	
	public int deleteSIGNInfo(String DOCNO, String SignType, String KJNO){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("DOCNO", DOCNO);
		param.put("SignType", SignType);
		param.put("KJNO", KJNO);
		return sign0701sDao.deleteSIGNInfo(param);
	}
	
	public int deleteTEMPList(String USERID){
		return sign0701sDao.deleteTEMPList(USERID);
	}
	public int deleteTEMPInfo(String USERID, String MAX_TK3, String KJPID){
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", USERID);
		param.put("MAX_TK3", MAX_TK3);
		param.put("KJPID", KJPID);
		return sign0701sDao.deleteTEMPInfo(param);
	}
	
	public List<Map<String, Object>> selectUSER_KJPList(String USER_ID, String RCV) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("USERID", USER_ID);
		param.put("RCVTYPE", RCV);
		return sign0701sDao.selectUSER_KJPList(param);
	}
	
	public List<Map<String, Object>> selectUSERList(String search_TYPE, String txt_SearchUSER,  String USERID, String MAX_TK3) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("search_TYPE", search_TYPE);
		param.put("txt_SearchUSER", txt_SearchUSER);
		param.put("USERID", USERID);
		param.put("MAX_TK3", MAX_TK3);
		return sign0701sDao.selectUSERList(param);
	}
	
	public Map<String, Object> pageSET(List<Map<String, Object>> param, String page){
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		List<Map<String, Object>> returnVal = new ArrayList<Map<String, Object>>();
		page = page == null || page.isEmpty() ? "1" : page;
		int ipage = Integer.valueOf(page);
		if(param == null || param.size() == 0){
			returnMap.put("FirstPage", 1);
			returnMap.put("LastPage", 1);
			returnMap.put("TotalPage", 1);
			returnMap.put("page", 1);
			return returnMap;
		}
		int firstIndex = ((ipage - 1) * 10);

		if(firstIndex < param.size()){
			int Last = 0;
			if((firstIndex + 10) < param.size()){
				Last = firstIndex + 10;
			}
			else{
				Last = param.size();
			}
			for(int i = firstIndex; i< Last; ++i){
				Map<String, Object> bar = new HashMap<String, Object>();
				bar.putAll(param.get(i));
				returnVal.add(bar); 
			}
		}
		
		int iFirstPage = ipage - ((ipage - 1) % 10);
		int iLastPage = iFirstPage + (10 - 1);
		int iCount = param.size();
		int iTotalPage = 0;
		if (iCount > 0) {
			iTotalPage = iCount / 10 + (iCount % 10 == 0 ? 0 : 1);
		}
		if (iLastPage > iTotalPage)
			iLastPage = iTotalPage;
		param.clear();
		param.addAll(returnVal);
		returnMap.put("FirstPage", iFirstPage);
		returnMap.put("LastPage", iLastPage);
		returnMap.put("TotalPage", iTotalPage);
		returnMap.put("page", page);
		return returnMap;
	}
	public boolean pdfDownload(String DOCNO, String DOCTYPE, String KJPTYPE, HttpServletRequest request){
	    boolean chk = true;
		HttpSession session = request.getSession(false);
		String Url = "";
		String sUrl = request.getRequestURL().toString();
		String fileNAME = "";
		String typeVal = "";
    	if(DOCTYPE.equals("1"))
    	{
    		Url = sUrl.substring(0, sUrl.lastIndexOf("/")) + "/view0701E_BurnPDF.do?docno=" + DOCNO;
    		fileNAME = "번식보고서";
    		typeVal = "BS";
    	}
    	else if(DOCTYPE.equals("2"))
    	{
    		Url = sUrl.substring(0, sUrl.lastIndexOf("/")) + "/view0701E_DeadPDF.do?docno=" + DOCNO;
    		fileNAME = "폐사보고서";
    		typeVal = "DETH";
    	}
    	else if(DOCTYPE.equals("3"))
    	{
    		Url = sUrl.substring(0, sUrl.lastIndexOf("/")) + "/view0701E_DeadPDF.do?docno=" + DOCNO;
    		fileNAME = "병리검사결과서";
    		typeVal = "BL";
    	}
    	else if(DOCTYPE.equals("4"))
    	{
    		Url = sUrl.substring(0, sUrl.lastIndexOf("/")) + "/view0701E_DeadPDF.do?docno=" + DOCNO;
    		fileNAME = "혈액검사서";
    		typeVal = "BLOOD";
    	}
    	
		String uploadPath = base0101sSvc.getSystemInfo().get("MSC_UPLOADPATH") == null ? "" : base0101sSvc.getSystemInfo().get("MSC_UPLOADPATH").toString();

		if(uploadPath.isEmpty()){
			uploadPath = request.getSession().getServletContext().getRealPath("/upload/");
			File dir = new File(uploadPath);
			if(!dir.isDirectory()){
			  dir.mkdirs();
			}
		}
		if(!uploadPath.substring(uploadPath.length()-1).equals("/") && !uploadPath.substring(uploadPath.length()-1).equals("\\") ){
			uploadPath += "/";
		}
		
		BufferedReader br = null;
		InputStreamReader isr = null;
		Document document = null;
		PdfWriter writer = null;
		try {
			// Document 생성
			document = new Document(PageSize.A4, 25, 25, 25, 25); // 용지 및 여백 설정
			DecimalFormat df = new DecimalFormat("00");
			Calendar cal = Calendar.getInstance();
			String Today = Integer.toString(cal.get(Calendar.YEAR)) + df.format(cal.get(Calendar.MONTH) + 1) + df.format(cal.get(Calendar.DATE));
			String sysFile = Today+String.valueOf(System.currentTimeMillis())+"_"+DOCNO + ".pdf";
			String filename = uploadPath + sysFile;
			writer = PdfWriter.getInstance(document, new FileOutputStream(filename)); //
			//writer = PdfWriter.getInstance(document, response.getOutputStream());
			writer.setInitialLeading(12.5f);

			// Document 오픈
			document.open();
			XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
			
			// CSS
			CSSResolver cssResolver = new StyleAttrCSSResolver();
			CssFile cssFile = helper.getCSS(new FileInputStream(request.getSession().getServletContext().getRealPath("/css/ui/") + "/pdf.css"));
			cssResolver.addCss(cssFile);
			
			// HTML, 폰트 설정
			XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
			fontProvider.register(request.getSession().getServletContext().getRealPath("/font/") + "/malgun.ttf", "MalgunGothic"); // MalgunGothic은 alias, 
			CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
			
			HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
			htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
			
			// Pipelines
			PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
			HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
			CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);

			XMLWorker worker = new XMLWorker(css, true);
			XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
			//URLConnection을 이용한 스트림 생성
			URL url = new URL(Url);
			URLConnection conn = (URLConnection) url.openConnection(); 
			InputStream is = conn.getInputStream(); 
			isr = new InputStreamReader(is,"UTF-8");
			
			br = new BufferedReader(isr); 
			String line = null;
			StringBuilder sb = new StringBuilder(1024); 
            
			while ((line=br.readLine()) != null){ // 라인단위 읽기
				sb.append(line+"\n"); 
			}
			String sContent = "";
			sContent = sb.toString();
			StringReader stringReader = new StringReader(sContent);//sb.toString());
			xmlParser.parse(stringReader);
			Map<String, Object> fileInfo = new HashMap<String, Object>();
			fileInfo.put("BDA_DOCNO", DOCNO);
			fileInfo.put("BDA_BZCLS1", typeVal);
			fileInfo.put("BDA_BZCLS2", "N");
			fileInfo.put("BDA_BZCLS3", "N");
			fileInfo.put("BDA_CMNT", fileNAME + DOCNO + ".pdf");
			fileInfo.put("BDA_ATCHFILE", sysFile);
			fileInfo.put("BDA_UPPATH", uploadPath);
			fileInfo.put("BDA_CNTNTTYPE", "application/pdf");
			fileInfo.put("BDA_BZSEQNO", KJPTYPE);
			fileInfo.put("CMN_MAK_ID", session.getAttribute(SessionParam.ss_id));
			fileInfo.put("CMN_MAK_PROG", "biz0701");
			fileInfo.put("CMN_UPD_ID", session.getAttribute(SessionParam.ss_id));
			fileInfo.put("CMN_UPD_PROG", "biz0701");
			biz0202sSvc.insertFileInfo(fileInfo);
		}
		catch (Exception e) {
			System.out.println("ERR message = " + e.getMessage());
    		chk = false;
		}finally{
			try{
				if(br != null) br.close();
				if(isr != null) isr.close();
				if(document != null) document.close();
				if(writer != null) writer.close();
			}catch(Exception e){
			}
		}
		return chk;
    }
	public String getFileType(String DOCTYPE){
		String filetype = "";
    	if(DOCTYPE.equals("1"))
    	{
    		filetype = "BS";
    	}
    	else if(DOCTYPE.equals("2"))
    	{
    		filetype = "DETH";
    	}
    	else if(DOCTYPE.equals("3"))
    	{
    		filetype = "BL";
    	}
    	else if(DOCTYPE.equals("4"))
    	{
    		filetype = "BLOOD";
    	}
    	return filetype;
	}
	public boolean XML_Writer(String DOCNO, String DOCTYPE, String KJNO, String USERID,  HttpServletRequest request){
		HttpSession session = request.getSession(false);
		boolean chk = true;
		String filetype = getFileType(DOCTYPE);
    	FileInputStream input = null;
    	try{
    	Map<String, Object> SIGN_INFO = getSIGNInfo(DOCNO, DOCTYPE, KJNO, "N");
    	if(SIGN_INFO == null) return false;
		Element pack = new Element("pack");
		DocType dtype = new DocType("pack", "pack.dtd"); 
		org.jdom2.Document doc = new org.jdom2.Document(pack, dtype);
		String fileDATE = getHHmm(SIGN_INFO.get("CMN_UPD_DATE").toString(),"yyyyMMddHHmmss");
		String MAX_NO = getMAX_SIGN_NOInfo(DOCNO, DOCTYPE, KJNO, USERID);
		String MAX = MAX_NO.equals("") ? "00001" : StringUtils.leftPad(MAX_NO, 5, '0');
		pack.setAttribute("filename", session.getAttribute(SessionParam.ss_id) + "ADM611000098DOC611000002" + fileDATE + MAX + ".xml");
		Element header = new Element("header");
		pack.addContent(header);
		
		Element type = new Element("type");
		type.setAttribute("doc-type", "send");
		header.addContent(type);
		
		Element date = new Element("date");
		date.setText(SIGN_INFO.get("CMN_UPD_DATE").toString());
		header.addContent(date);
		
		Element sender = new Element("sender");
		sender.setText("ADM611000098");
		header.addContent(sender);
		
		Element receiver = new Element("receiver");
		receiver.setText("DOC611000002");
		header.addContent(receiver);
		
		Element sender_userid = new Element("sender_userid");
		sender_userid.setText(session.getAttribute(SessionParam.ss_id).toString());
		header.addContent(sender_userid);
		
		Element receiver_userid = new Element("receiver_userid");
		receiver_userid.setText(session.getAttribute(SessionParam.ss_id).toString());
		header.addContent(receiver_userid);
		
		Element sender_orgname = new Element("sender_orgname");
		String orgname = "서울대공원";
		sender_orgname.setText(encrypt(orgname));
		header.addContent(sender_orgname);
		
		Element sender_systemname = new Element("sender_systemname");
		String orgsysname = "동물관리시스템";
		sender_systemname.setText(encrypt(orgsysname));
		header.addContent(sender_systemname);
		
		String numDATE = getHHmm(SIGN_INFO.get("CMN_UPD_DATE").toString(),"yyyy-MM-dd-HHmmss");
		Element administrative_num = new Element("administrative_num");
		String admin_num = "GCC-" + numDATE + "-" + StringUtils.leftPad(MAX_NO, 3, '0');
		administrative_num.setText(admin_num);
		header.addContent(administrative_num);
		
		Element contents = new Element("contents");
		pack.addContent(contents);
		
		Map<String, Object> fileinfo = getFileInfo(DOCNO, KJNO, filetype);
		boolean fileCHk = false;
		String filename = "";
		if(fileinfo != null){
			String orgPath = fileinfo.get("BDA_UPPATH").toString();
			if(!orgPath.substring(orgPath.length()-1).equals("/") && !orgPath.substring(orgPath.length()-1).equals("\\")){
				orgPath += "/";
			}
			String orgfile = orgPath + fileinfo.get("BDA_ATCHFILE").toString();
			System.out.println("!!!orgfile = " + orgfile);
			File file = new File(orgfile);
			if(file.exists()){
				filename = fileinfo.get("BDA_CMNT") == null ? "폐사" + DOCNO + ".pdf" : fileinfo.get("BDA_CMNT").toString();
				byte[] bytes;
					Element content = new Element("content");
					content.setAttribute("content-role", "attach");
					content.setAttribute("content-transfer-encoding", "base64");
					content.setAttribute("filename", encrypt(filename));
					Path path = Paths.get(orgfile);
					bytes = Files.readAllBytes(path);
					content.setText(encrypt(bytes));
					contents.addContent(content);
					fileCHk = true;
			}
		}
		String xml = "";
			File xmlaout = new File(request.getSession().getServletContext().getRealPath("/layout/") + "/exchange.xml");
			input = new FileInputStream(xmlaout);
			SAXBuilder builer = new SAXBuilder();
			org.jdom2.Document layoutdoc = builer.build(input);
			DocType layoutdtype = new DocType("EXCHANGE", "exchange.dtd"); 
			layoutdoc.setDocType(layoutdtype);
			Element EXCHANGE = layoutdoc.getRootElement();
			System.out.println("EXCHANGE = " + EXCHANGE.getName());
			Element HEADER = EXCHANGE.getChild("HEADER");
			System.out.println("HEADER = " + HEADER.getName());
			Element COMMON = HEADER.getChild("COMMON");
			Element SENDER = COMMON.getChild("SENDER");
			Element SENDER_USERID = SENDER.getChild("USERID");
			SENDER_USERID.setText(session.getAttribute(SessionParam.ss_id).toString());
			Element RECEIVER = COMMON.getChild("RECEIVER");
			Element RECEIVER_USERID = RECEIVER.getChild("USERID");
			RECEIVER_USERID.setText(session.getAttribute(SessionParam.ss_id).toString());
			Element TITLE = COMMON.getChild("TITLE");
			String DOCCMNT = SIGN_INFO.get("BSL_DOCCMNT").toString();
			TITLE.addContent(new CDATA(DOCCMNT));
			Element CREATED_DATE = COMMON.getChild("CREATED_DATE");
			CREATED_DATE.setText(SIGN_INFO.get("CMN_UPD_DATE").toString());
			if(fileCHk){
				Element ATTACHNUM = COMMON.getChild("ATTACHNUM");
				ATTACHNUM.setText("1");
			}
			Element ADMINISTRATIVE_NUM = COMMON.getChild("ADMINISTRATIVE_NUM");
			ADMINISTRATIVE_NUM.setText("GCC-" + numDATE + "-" + StringUtils.leftPad(MAX_NO, 3, '0'));
			Element BODY = EXCHANGE.getChild("BODY");
			if(SIGN_INFO.get("BSL_CMNT") != null && !SIGN_INFO.get("BSL_CMNT").toString().equals("")){
				String cmnt = SIGN_INFO.get("BSL_CMNT").toString();
				BODY.addContent(new CDATA(cmnt));
			}
			if(fileCHk){
				Element ATTACHMENTS = new Element("ATTACHMENTS");
				EXCHANGE.addContent(ATTACHMENTS);
				Element ATTACHMENT = new Element("ATTACHMENT");
				ATTACHMENT.setAttribute("filename",filename);
				ATTACHMENTS.addContent(ATTACHMENT);
			}
			XMLOutputter xout = new XMLOutputter();
			Format f = Format.getRawFormat();
			f.setEncoding("euc-kr");                                                        
            xout.setFormat(f);                                         
			xml = xout.outputString(layoutdoc);
			System.out.println("xml = " + xml);
		if(!xml.equals("")){
			Element content = new Element("content");
			content.setAttribute("content-role", "exchange");
			content.setAttribute("content-transfer-encoding", "base64");
			content.setAttribute("filename", encrypt("exchange.xml"));
			content.setText(encrypt(xml));
			contents.addContent(content);
		}
		XMLOutputter pack_xout = new XMLOutputter();
		Format pack_f = Format.getPrettyFormat();
		pack_f.setEncoding("euc-kr");                                                        
		pack_xout.setFormat(pack_f); 
		pack_xout.output(doc, new FileWriter("C:\\exchange\\data\\sendtemp\\" + session.getAttribute(SessionParam.ss_id) + "ADM611000098DOC611000002" + fileDATE + MAX + ".xml"));
		updateCONN_SIGNInfo(DOCNO, DOCTYPE, KJNO, admin_num, MAX_NO);
    	}catch(Exception exe){
			System.out.println("ERR message = " + exe.getMessage());
    		chk = false;
    	}
    	finally {
				try {
					if(input != null) input.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
    	return chk;
    }
	public String getHHmm(String str, String format) {
	    SimpleDateFormat iFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
	    SimpleDateFormat oFormatter = new SimpleDateFormat(format, Locale.KOREA);
	    Date date = null;
	    long lDate = 0;
	    try {
	        date = iFormatter.parse(str);
	        lDate = date.getTime();
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
	    return oFormatter.format(lDate);
	}
	public String encrypt(String value)  throws Exception {
		return Base64.encodeBase64String(value.getBytes("KSC5601"));
        //결과값을 돌려줌
    }
	public String encrypt(byte[] value) {
        //외부에서 인코딩할 평문을 받아옴
        
        String result = "";
 
        try {
        //예외처리
 
            result += Base64.encodeBase64String(value);
            //외부에서 받아온 값을 byte로 변환시키고 인코딩한 뒤 String형태로 돌려받음
 
        } catch (Exception e) {
        }
 
        return result;
        //결과값을 돌려줌
    }
	public Map<String, Object> getFileInfo(String DOCNO, String SEQ, String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BDA_DOCNO", DOCNO);
		param.put("BDA_BZSEQNO", SEQ);
		param.put("type", type);
		return sign0701sDao.getFileInfo(param);
	}
	public boolean deleteFileInfo(String DOCNO, String SEQ, String TYPE){
		boolean fileChk = true;
		Map<String, Object> fileInfo = getFileInfo(DOCNO, SEQ, TYPE);
		if(fileInfo != null){
			if(fileInfo.get("BDA_BZSEQNO").toString().equals(SEQ)){
				boolean chk = true;
				String fileNameKey     = (String) fileInfo.get("BDA_ATCHFILE");    // 실제 저장된 파일 이름
				String filePath     = (String) fileInfo.get("BDA_UPPATH");    // 파일 경로
				File file = new File(filePath, fileNameKey);
				if(file.exists()){
					chk = file.delete();
				}
				if(chk){
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("BDA_DOCNO", DOCNO);
					param.put("BDA_BZSEQNO", SEQ);
					param.put("type", TYPE);
					sign0701sDao.deleteFileInfo(param);
				}
				else{
					if(fileChk){
						fileChk = false;
					}
				}
			}
		}
		return fileChk;
	}
	public boolean getProcess(){
		boolean chk = false;
		Process ps;
		try {
			ps = Runtime.getRuntime().exec("tasklist /fi \"imagename eq SIGN_READ.exe\"");
	        BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
	        String line;
	        while ((line = br.readLine()) != null) {
	        	if (!line.trim().equals("") && line.trim().contains("SIGN_READ.exe")) {
	        		chk = true;
	        	}
	        }
		} catch (Exception e) {
			return false;
		}
		return chk;
	}
}
