package GEIT.AMS.Service.biz;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import GEIT.AMS.Controller.biz.Biz0202Ctr;
import GEIT.AMS.Dao.biz.Biz0202SDao;
import GEIT.AMS.Service.base.Base0101SSvc;
import GEIT.AMS.auth.SessionParam;

@Service
public class Biz0202SSvc {
	
	@Autowired
	private Biz0202SDao biz0202sDao;
	
	@Autowired
	private Base0101SSvc base0101sSvc;
	
	public List<Map<String, Object>> selectBizManualList(Map<String, Object> param) {
		return biz0202sDao.selectBizManualList(param);
	}
	public List<Map<String, Object>> selectBizArticleList(Map<String, Object> param) {
		return biz0202sDao.selectBizArticleList(param);
	}
	public Map<String, Object> pageSET(List<Map<String, Object>> param, String page){
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		List<Map<String, Object>> returnVal = new ArrayList<Map<String, Object>>();
		page = page == null || page.isEmpty() ? "1" : page;
		int ipage = Integer.valueOf(page);
		if(param == null || param.size() == 0){
			returnMap.put("BizFirstPage", 1);
			returnMap.put("BizLastPage", 1);
			returnMap.put("BizTotalPage", 1);
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
		returnMap.put("BizFirstPage", iFirstPage);
		returnMap.put("BizLastPage", iLastPage);
		returnMap.put("BizTotalPage", iTotalPage);
		returnMap.put("page", page);
		return returnMap;
	}
	public void insfile(Map<String, Object> param, String biz_DocNo, HttpServletRequest req) throws Exception{
	    HttpSession session = req.getSession(false);
		Map<String, Object> insMap;
		List<MultipartFile> fileList = new ArrayList<MultipartFile>();
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
		if(param.get("biz_file1") != null){
			fileList.add((MultipartFile)param.get("biz_file1"));
		}
		if(param.get("biz_file2") != null){
			fileList.add((MultipartFile)param.get("biz_file2"));
		}
		if(param.get("biz_file3") != null){
			fileList.add((MultipartFile)param.get("biz_file3"));
		}
		for(int i = 0; i<fileList.size();++i){
			MultipartFile file = fileList.get(i);
			if(!file.isEmpty()){
				insMap = uploadfile(file, uploadPath);
				if(insMap == null){
					throw new Exception("파일업로드 실패!");
				}
				else{
					insMap.put("BDA_DOCNO", biz_DocNo);
					if(param.get("BBSTYPE").equals("1"))
						insMap.put("BDA_BZCLS1", "BIZ_M");
					else
						insMap.put("BDA_BZCLS1", "BIZ_A");
					insMap.put("BDA_BZCLS2", "N");
					insMap.put("BDA_BZCLS3", "N");
					insMap.put("BDA_CNTNTTYPE", file.getContentType());
					insMap.put("BDA_BZSEQNO", getFileSeq(biz_DocNo, param.get("BBSTYPE").toString()));
					insMap.put("CMN_MAK_ID", session.getAttribute(SessionParam.ss_id));
					insMap.put("CMN_MAK_PROG", "biz0202");
					insMap.put("CMN_UPD_ID", session.getAttribute(SessionParam.ss_id));
					insMap.put("CMN_UPD_PROG", "biz0202");
					insertFileInfo(insMap);
				}
			}
			
		}
	}
	public String getFileSeq(String DOCNO, String BBSTYPE){
		List<Map<String, Object>> fileList = selectFileList(DOCNO, BBSTYPE);
		boolean chk = true;
		for(int i = 1; i < 4;++i){
			chk = true;
			for (Map<String, Object> map : fileList) {
				if(map.get("BDA_BZSEQNO").toString().equals(String.valueOf(i))){
					chk = false;
					continue;
				}
			}
			if(chk){
				return String.valueOf(i);
			}
		}
		return "1";
	}
	public Map<String, Object> uploadfile(MultipartFile file, String uploadPath){			
		Map<String, Object> fileInfo = new HashMap<String, Object>();
		InputStream inputStream = null;  
	    OutputStream outputStream = null;  
		DecimalFormat df = new DecimalFormat("00");
		Calendar cal = Calendar.getInstance();
		String Today = Integer.toString(cal.get(Calendar.YEAR)) + df.format(cal.get(Calendar.MONTH) + 1) + df.format(cal.get(Calendar.DATE));
		String sysFile = "";
		String fileName = file.getOriginalFilename();  
		sysFile = Today+String.valueOf(System.currentTimeMillis())+"_"+fileName;
		fileInfo.put("BDA_CMNT", fileName);
		fileInfo.put("BDA_ATCHFILE", sysFile);
		fileInfo.put("BDA_UPPATH", uploadPath);
		try {  
	        inputStream = file.getInputStream();
	        File newFile = new File(uploadPath, sysFile);
	        if (!newFile.exists()) {  
	            newFile.createNewFile();
	        }  
	        outputStream = new FileOutputStream(newFile);  
	        int read = 0;  
	        byte[] bytes = new byte[1024];  
	   
	        while ((read = inputStream.read(bytes)) != -1) {  
	            outputStream.write(bytes, 0, read);  
	        }  
	        return fileInfo;
	    } catch (IOException e) {  
	    	return null;
	    } finally {
	        try {
	        	if(outputStream != null)
	        	outputStream.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	}
	public int insertFileInfo(Map<String, Object> param){
		return biz0202sDao.insertFileInfo(param);
	}
	public int insertBizInfo(Map<String, Object> param, String biz_DocNo, HttpServletRequest req){

	    HttpSession session = req.getSession(false);
		Map<String, Object> insBBS = new HashMap<String, Object>();
		insBBS.put("BBI_DOCNO", biz_DocNo);
		insBBS.put("BBI_BBSTYPE", param.get("BBSTYPE"));
		insBBS.put("BBI_MANUALTYPE", param.get("select_Kind"));
		insBBS.put("BBI_TIT", param.get("Biz_title"));
		insBBS.put("BBI_OPEN_YN", param.get("OPENYN"));
		insBBS.put("BBI_CTNT", param.get("Biz_cmnt"));
		insBBS.put("CMN_MAK_ID", session.getAttribute(SessionParam.ss_id));
		insBBS.put("CMN_UPD_ID", session.getAttribute(SessionParam.ss_id));
		return biz0202sDao.insertBizInfo(insBBS);
	}
	public int insertCommentInfo(String DocNo, String USERID, String Cmnt){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BBC_DOCNO", DocNo);
		param.put("BBC_CTNT", Cmnt);
		param.put("CMN_MAK_ID", USERID);
		param.put("CMN_UPD_ID", USERID);
		return biz0202sDao.insertCommentInfo(param);
	}
	public int updateCommentInfo(String DocNo, String SEQ, String USERID, String Cmnt){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BBC_DOCNO", DocNo);
		param.put("BBC_SEQ", SEQ);
		param.put("BBC_CTNT", Cmnt);
		param.put("CMN_UPD_ID", USERID);
		return biz0202sDao.updateCommentInfo(param);
	}
	public int deleteCommentInfo(String DocNo, String SEQ){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BBC_DOCNO", DocNo);
		param.put("BBC_SEQ", SEQ);
		return biz0202sDao.deleteCommentInfo(param);
	}
	
	public String selectBiz_MaxDocno(){
		String returnVal = biz0202sDao.selectBiz_MaxDocno();
		return returnVal;
	}
	public Map<String, Object> getBizInfo(String DOCNO, String BBSTYPE) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BBSTYPE", BBSTYPE);
		param.put("BBI_DOCNO", DOCNO);
		return biz0202sDao.getBizInfo(param);
	}
	public List<Map<String, Object>> selectCommentList(String DOCNO) {
		return biz0202sDao.selectCommentList(DOCNO);
	}
	public List<Map<String, Object>> selectFileList(String DOCNO, String BBSTYPE) {
		String BDA_BZCLS1 = "";
		if(BBSTYPE.equals("1")){
			BDA_BZCLS1 = "BIZ_M";	
		}
		else{
			BDA_BZCLS1 = "BIZ_A";	
		}
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BDA_DOCNO", DOCNO);
		param.put("BDA_BZCLS1", BDA_BZCLS1);
		return biz0202sDao.selectFileList(param);
	}
	public List<Map<String, Object>> selectFileList2(String DOCNO, String cls) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BDA_DOCNO", DOCNO);
		param.put("BDA_BZCLS1", cls);
		return biz0202sDao.selectFileList(param);
	}
	public Map<String, Object> getFileInfo(String DOCNO, String SEQ, String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BDA_DOCNO", DOCNO);
		param.put("BDA_BZSEQNO", SEQ);
		param.put("type", type);
		return biz0202sDao.getFileInfo(param);
	}
	public boolean deleteFileList(String DOCNO, String BBSTYPE){
		boolean fileChk = true;
		List<Map<String, Object>> fileList = selectFileList(DOCNO, BBSTYPE);
		if(fileList.size() > 0){
			for (Map<String, Object> map : fileList) {
				boolean chk = true;
				String fileNameKey     = (String) map.get("BDA_ATCHFILE");    // 실제 저장된 파일 이름
				String filePath     = (String) map.get("BDA_UPPATH");    // 파일 경로
				File file = new File(filePath, fileNameKey);
				if(file.exists()){
					chk = file.delete();
				}
				if(chk){
					Map<String, Object> param = new HashMap<String, Object>();
					param.put("BDA_DOCNO", DOCNO);
					param.put("BDA_BZSEQNO", map.get("BDA_BZSEQNO"));
					biz0202sDao.deleteFileInfo(param);
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
	public boolean deleteFileInfo(String DOCNO, String BBSTYPE, String SEQ){
		boolean fileChk = true;
		List<Map<String, Object>> fileList = selectFileList(DOCNO, BBSTYPE);
		if(fileList.size() > 0){
			for (Map<String, Object> map : fileList) {
				if(map.get("BDA_BZSEQNO").toString().equals(SEQ)){
					boolean chk = true;
					String fileNameKey     = (String) map.get("BDA_ATCHFILE");    // 실제 저장된 파일 이름
					String filePath     = (String) map.get("BDA_UPPATH");    // 파일 경로
					File file = new File(filePath, fileNameKey);
					if(file.exists()){
						chk = file.delete();
					}
					if(chk){
						Map<String, Object> param = new HashMap<String, Object>();
						param.put("BDA_DOCNO", DOCNO);
						param.put("BDA_BZSEQNO", map.get("BDA_BZSEQNO"));
						biz0202sDao.deleteFileInfo(param);
					}
					else{
						if(fileChk){
							fileChk = false;
						}
					}
				}
			}
		}
		return fileChk;
	}
	public int deleteCommentList(String DocNo){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BBC_DOCNO", DocNo);
		return biz0202sDao.deleteCommentList(param);
	}
	public int deleteBizInfo(String DocNo){
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("BBI_DOCNO", DocNo);
		return biz0202sDao.deleteBizInfo(param);
	}
	public Map<String, Object> setCmnt(Map<String, Object> param){
		String cmnt = param.get("BBI_CTNT") == null ? "" : param.get("BBI_CTNT").toString();
		cmnt = cmnt.replaceAll("\r\n","<br/>"); // 줄바꿈처리
		cmnt = cmnt.replaceAll(" ","&nbsp;"); 
		cmnt = cmnt.replaceAll("\t","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"); 
		param.put("BBI_CTNT", cmnt);
		return param;
	}
	public int updateBizInfo(Map<String, Object> param, String biz_DocNo, HttpServletRequest req){
	    HttpSession session = req.getSession(false);
		Map<String, Object> insBBS = new HashMap<String, Object>();
		insBBS.put("BBI_DOCNO", biz_DocNo);
		insBBS.put("BBI_TIT", param.get("Biz_title"));
		insBBS.put("BBI_OPEN_YN", param.get("OPENYN"));
		insBBS.put("BBI_CTNT", param.get("Biz_cmnt"));
		insBBS.put("CMN_UPD_ID", session.getAttribute(SessionParam.ss_id));
		return biz0202sDao.updateBizInfo(insBBS);
	}
	
	public void updateFileSeqInfo(String DOCNO, String BBSTYPE){
		List<Map<String, Object>> fileList = selectFileList(DOCNO, BBSTYPE);
		int i = 1;
		for (Map<String, Object> map : fileList) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("BDA_DOCNO", DOCNO);
			param.put("BDA_ATCHFILE", map.get("BDA_ATCHFILE"));
			param.put("BDA_BZSEQNO", i);
			biz0202sDao.updateFileSeqInfo(param);
			i++;
		}
	}
	public void updateFileSeqInfo2(String DOCNO, String CLS1){
		List<Map<String, Object>> fileList = selectFileList2(DOCNO, CLS1);
		int i = 1;
		for (Map<String, Object> map : fileList) {
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("BDA_DOCNO", DOCNO);
			param.put("BDA_ATCHFILE", map.get("BDA_ATCHFILE"));
			param.put("BDA_BZSEQNO", i);
			biz0202sDao.updateFileSeqInfo(param);
			i++;
		}
	}
	public int updateBizSelectCntInfo(String DOCNO){
		return biz0202sDao.updateBizSelectCntInfo(DOCNO);
	}
}
