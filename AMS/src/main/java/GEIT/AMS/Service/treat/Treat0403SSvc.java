package GEIT.AMS.Service.treat;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import GEIT.AMS.Dao.treat.Treat0403SDao;
import GEIT.AMS.Service.base.Base0101SSvc;
import GEIT.AMS.Service.biz.Biz0202SSvc;
import GEIT.AMS.auth.SessionParam;

@Service
public class Treat0403SSvc {

	@Autowired
	private Treat0403SDao treat0403sDao;
	
	@Autowired
	private Base0101SSvc base0101sSvc;
	
	@Autowired
	private Biz0202SSvc biz0202sSvc;

	public List<Map<String, Object>> selectAllList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("numKeyword", param.get("numKeyword"));
		map.put("vvrmKeyword", param.get("vvrmKeyword"));
		map.put("nameKeyword", param.get("nameKeyword"));
		map.put("jinryoKind", param.get("jinryoKind"));
		map.put("jinryoStatus", param.get("jinryoStatus"));
		return treat0403sDao.selectJnlList(map);
	}
	
	public List<Map<String, Object>> select_JRDateDtlList(String JJJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		return treat0403sDao.select_JRDateDtlList(map);
	}
	
	public List<Map<String, Object>> select_KYList(String JJJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		return treat0403sDao.select_KYList(map);
	}
	
	public List<Map<String, Object>> select_CBList(String JJJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		return treat0403sDao.select_CBList(map);
	}
	
	public List<Map<String, Object>> select_FileList(String JJJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		return treat0403sDao.select_FileList(map);
	}
	
	public List<Map<String, Object>> selectJnlDateKYList(String JJJ_DOCNO, String DTLDay) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("DTLDay", DTLDay);
		return treat0403sDao.selectJnlDateKYList(map);
	}
	
	public Map<String, Object> getAniINFO(String ANICODE) {
		return treat0403sDao.getAniINFO(ANICODE);
	}
	
	public List<Map<String, Object>> SelectFileList(String DOCNO, String DTLDay, String ClsType) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("DOCNO", DOCNO);
		map.put("DTLDay", DTLDay);
		map.put("ClsType", ClsType);
		return treat0403sDao.SelectFileList(map);
	}
	
	public Map<String, Object> getJnlInfo(String DOCNO, String JJJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("DOCNO", DOCNO);
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		return treat0403sDao.getJnlInfo(map);
	}
	
	public Map<String, Object> getBuPSInfo(String JJJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		return treat0403sDao.getBuPSInfo(map);
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
	public int insfile(MultipartFile biz_file, String DTLDay, String JJJ_DOCNO, HttpServletRequest req) throws Exception{
		HttpSession session = req.getSession(false);
		Map<String, Object> insMap;
		String uploadPath = base0101sSvc.getSystemInfo().get("MSC_UPLOADPATH") == null ? "" : base0101sSvc.getSystemInfo().get("MSC_UPLOADPATH").toString();

		if(uploadPath.isEmpty()){
			uploadPath = req.getSession().getServletContext().getRealPath("/upload/");
			File dir = new File(uploadPath);
			if(!dir.isDirectory()){
				dir.mkdirs();
			}
		}
		if(!uploadPath.substring(uploadPath.length()-1).equals("/") && !uploadPath.substring(uploadPath.length()-1).equals("\\") ){
			uploadPath += "/";
		}
		uploadPath += "AddDoc/";
		File dir = new File(uploadPath);
		if(!dir.isDirectory()){
			dir.mkdirs();
		}
		MultipartFile file = biz_file;
		insMap = biz0202sSvc.uploadfile(file, uploadPath);
		if(insMap == null){
			throw new Exception("파일업로드 실패!");
		}
		else{
			insMap.put("BDA_DOCNO", JJJ_DOCNO);
			insMap.put("BDA_BZCLS1", "JR001");
			insMap.put("BDA_BZCLS2", "N");
			insMap.put("BDA_BZCLS3", "N");
			insMap.put("BDA_CNTNTTYPE", file.getContentType());
			insMap.put("BDA_BZSEQNO", treat0403sDao.getFileSeq(JJJ_DOCNO));
			insMap.put("DTLDay", DTLDay);
			insMap.put("CMN_MAK_ID", session.getAttribute(SessionParam.ss_id));
			insMap.put("CMN_MAK_PROG", "TREAT0403");
			insMap.put("CMN_UPD_ID", session.getAttribute(SessionParam.ss_id));
			insMap.put("CMN_UPD_PROG", "TREAT0403");
			return insertFileInfo(insMap);
		}
	}
	public int insertFileInfo(Map<String, Object> param){
		return treat0403sDao.insertFileInfo(param);
	}
	
	public int insertJnlInfo(String JJJ_DOCNO, String SDATE,String EDATE,String JRTYPE,String DOCNO,String JRDZZNAME, String JRCMNT, String JRDZZTYPE, String JRSTS,String INSU,String REQORGA){
    	System.out.println("JJJ_DOCNO = " + JJJ_DOCNO + ", SDATE = " + SDATE + ", EDATE = " + EDATE + ", JRTYPE = " + JRTYPE);
    	System.out.println("DOCNO = " + DOCNO + ", JRDZZNAME = " + JRDZZNAME + ", JRCMNT = " + JRCMNT + ", JRDZZTYPE = " + JRDZZTYPE + ", JRSTS = " + JRSTS);
    	System.out.println("INSU = " + INSU + ", REQORGA = " + REQORGA);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("SDATE", SDATE);
		map.put("EDATE", EDATE);
		map.put("JRTYPE", JRTYPE);
		map.put("DOCNO", DOCNO);
		map.put("JRDZZNAME", JRDZZNAME);
		map.put("JRCMNT", JRCMNT);
		map.put("JRDZZTYPE", JRDZZTYPE);
		map.put("JRSTS", JRSTS);
		map.put("INSU", INSU);
		map.put("REQORGA", REQORGA);
		return treat0403sDao.insertJnlInfo(map);
	}
	
	public int updateJnlInfo(String JJJ_DOCNO, String SDATE,String EDATE,String JRTYPE,String DOCNO,String JRDZZNAME, String JRCMNT, String JRDZZTYPE, String JRSTS,String INSU,String REQORGA){
    	System.out.println("JJJ_DOCNO = " + JJJ_DOCNO + ", SDATE = " + SDATE + ", EDATE = " + EDATE + ", JRTYPE = " + JRTYPE);
    	System.out.println("DOCNO = " + DOCNO + ", JRDZZNAME = " + JRDZZNAME + ", JRCMNT = " + JRCMNT + ", JRDZZTYPE = " + JRDZZTYPE + ", JRSTS = " + JRSTS);
    	System.out.println("INSU = " + INSU + ", REQORGA = " + REQORGA);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("SDATE", SDATE);
		map.put("EDATE", EDATE);
		map.put("JRTYPE", JRTYPE);
		map.put("DOCNO", DOCNO);
		map.put("JRDZZNAME", JRDZZNAME);
		map.put("JRCMNT", JRCMNT);
		map.put("JRDZZTYPE", JRDZZTYPE);
		map.put("JRSTS", JRSTS);
		map.put("INSU", INSU);
		map.put("REQORGA", REQORGA);
		return treat0403sDao.updateJnlInfo(map);
	}
	
	
	public int setJnlDateInfo(String JJJ_DOCNO,String DTLDay,String J_CMNT,String USERID){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("DTLDay", DTLDay);
		int chk = treat0403sDao.get_JnlDateCHK(map);
		if(chk == 0){
			map = new LinkedHashMap<String, Object>();
			map.put("JJJ_DOCNO", JJJ_DOCNO);
			map.put("DTLDay", DTLDay);
			map.put("USERID", USERID);
			map.put("J_CMNT", J_CMNT);
			return treat0403sDao.insertJnlDateInfo(map);
		}
		else if(chk > 0){
			map = new LinkedHashMap<String, Object>();
			map.put("JJJ_DOCNO", JJJ_DOCNO);
			map.put("DTLDay", DTLDay);
			map.put("USERID", USERID);
			map.put("J_CMNT", J_CMNT);
			return treat0403sDao.updateJnlDateInfo(map);
		}
		else{
			return -1;
		}
	}
	public int updateRctInfo(String JJJ_DOCNO, String RCSTS, String DOCNO, String USERID){
		String wk_RCSts = (RCSTS.equals("1")) ? "2" : "3";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("RCSTS", wk_RCSts);
		map.put("DOCNO", DOCNO);
		map.put("USERID", USERID);
		return treat0403sDao.updateRctInfo(map);
	}
	public int deleteFileList(String JJJ_DOCNO, String DTLDay, String ClsType){
		int returnInt = 0;
		List<Map<String, Object>> SelectFile = SelectFileList(JJJ_DOCNO, DTLDay, ClsType);
		for (Map<String, Object> map : SelectFile) {
			boolean chk = true;
			String fileNameKey     = (String) map.get("BDA_ATCHFILE");    // 실제 저장된 파일 이름
			String filePath     = (String) map.get("BDA_UPPATH");    // 파일 경로
			File file = new File(filePath, fileNameKey);
			if(file.exists()){
				chk = file.delete();
			}
			if(chk){
				Map<String, Object> param = new LinkedHashMap<String, Object>();
				param.put("JJJ_DOCNO", JJJ_DOCNO);
				param.put("DTLDay", DTLDay);
				param.put("ClsType", ClsType);
				if(deleteFileInfo(param) == -1 ){
					returnInt = -1;
				}
			}
			else{
				returnInt = -1;
			}
		}
		return returnInt;
	}
	public int deleteFileInfo(Map<String, Object> param){
		return treat0403sDao.deleteFileInfo(param);
	}
	public int deleteKSData(String JJDKY_DocNo, String JJDKY_KSNo){
    	System.out.println("deleteKSData!! JJDKY_DocNo = " + JJDKY_DocNo + ", JJDKY_KSNo = " + JJDKY_KSNo);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("DOCNO", JJDKY_DocNo);
		switch (JJDKY_KSNo) {
		case "K01":
			map.put("TableNAME", "JN_JINRYO_DATE_KBL");
			map.put("ColumnNAME", "JJDKBL_DocNo");
			break;
		case "K02":
			map.put("TableNAME", "JN_JINRYO_DATE_KSK");
			map.put("ColumnNAME", "JJDKSK_DocNo");
			break;
		case "K03":
			map.put("TableNAME", "JN_JINRYO_DATE_KJK");
			map.put("ColumnNAME", "JJDKJK_DocNo");
			break;
		case "K04":
			map.put("TableNAME", "JN_JINRYO_DATE_KHS");
			map.put("ColumnNAME", "JJDKHS_DocNo");
			break;
		case "K05":
			map.put("TableNAME", "JN_JINRYO_DATE_KKS");
			map.put("ColumnNAME", "JJDKKS_DocNo");
			break;
		case "K06":
			map.put("TableNAME", "JN_JINRYO_DATE_KJH");
			map.put("ColumnNAME", "JJDKJH_DocNo");
			break;
		case "K07":
			map.put("TableNAME", "JN_JINRYO_DATE_KPC");
			map.put("ColumnNAME", "JJDKPC_DocNo");
			break;
		case "K08":
			map.put("TableNAME", "JN_JINRYO_DATE_KSB");
			map.put("ColumnNAME", "JJDKSB_DocNo");
			break;
		case "K09":
			map.put("TableNAME", "JN_JINRYO_DATE_KXR");
			map.put("ColumnNAME", "JJDKXR_DocNo");
			break;
		case "K10":
			map.put("TableNAME", "JN_JINRYO_DATE_KEP");
			map.put("ColumnNAME", "JJDKEP_DocNo");
			break;
		default:
			return -1;
		}
		return treat0403sDao.deleteKSDataInfo(map);
	}
	public int deleteKSInfo(String JJJ_DOCNO, String DTLDay){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("DTLDay", DTLDay);
		return treat0403sDao.deleteKSInfo(map);
	}
	
	public int deleteCBInfo(String JJJ_DOCNO, String DTLDay){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("DTLDay", DTLDay);
		return treat0403sDao.deleteCBInfo(map);
	}
	
	public int deleteJnlDateInfo(String JJJ_DOCNO, String DTLDay){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("DTLDay", DTLDay);
		return treat0403sDao.deleteJnlDateInfo(map);
	}
	
	public int deleteJnlInfo(String JJJ_DOCNO){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		return treat0403sDao.deleteJnlInfo(map);
	}
	
	public int updateRctJnlDelete(String JJJ_DOCNO){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		return treat0403sDao.updateRctJnlDelete(map);
	}
}