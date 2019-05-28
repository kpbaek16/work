package GEIT.AMS.Service.treat;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import GEIT.AMS.Dao.treat.Treat0406SDao;
import GEIT.AMS.Service.base.Base0101SSvc;
import GEIT.AMS.Service.biz.Biz0202SSvc;
import GEIT.AMS.auth.SessionParam;

@Service
public class Treat0406SSvc {

	@Autowired
	private Treat0406SDao treat0406sDao;

	@Autowired
	private Treat0402SSvc treat0402sSvc;
	
	@Autowired
	private Base0101SSvc base0101sSvc;
	
	@Autowired
	private Biz0202SSvc biz0202sSvc;
	
	public List<Map<String, Object>> selectInspctMgr(String cal_1, String cal_2, String jinryoNum, String aniName, String aniNum, String KS_DIVISION, String KSTYPE, String KS_STATUS, String page) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		map.put("jinryoNum", jinryoNum);
		map.put("aniName", aniName);
		map.put("aniNum", aniNum);
		map.put("KS_DIVISION", KS_DIVISION);
		map.put("KSTYPE", KSTYPE);
		map.put("KS_STATUS", KS_STATUS);
		map.put("page", page);
		return treat0406sDao.selectInspctMgr(map);
	}
	
	public int selectInspctMgrCount(String cal_1, String cal_2, String jinryoNum, String aniName, String aniNum, String KS_DIVISION, String KSTYPE, String KS_STATUS) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", cal_1);
		map.put("cal_2", cal_2);
		map.put("jinryoNum", jinryoNum);
		map.put("aniName", aniName);
		map.put("aniNum", aniNum);
		map.put("KS_DIVISION", KS_DIVISION);
		map.put("KSTYPE", KSTYPE);
		map.put("KS_STATUS", KS_STATUS);
		return treat0406sDao.selectInspctMgrCount(map);
	}
	
	public Map<String, Object> pageSET(int iCount, String page){
		HashMap<String, Object> returnMap = new HashMap<String, Object>();
		page = page == null || page.isEmpty() ? "1" : page;
		int ipage = Integer.valueOf(page);
		if(iCount == 0){
			returnMap.put("FirstPage", 1);
			returnMap.put("LastPage", 1);
			returnMap.put("TotalPage", 1);
			returnMap.put("page", 1);
			return returnMap;
		}
		
		int iFirstPage = ipage - ((ipage - 1) % 10);
		int iLastPage = iFirstPage + (10 - 1);
		int iTotalPage = 0;
		if (iCount > 0) {
			iTotalPage = iCount / 10 + (iCount % 10 == 0 ? 0 : 1);
		}
		if (iLastPage > iTotalPage)
			iLastPage = iTotalPage;
		
		returnMap.put("FirstPage", iFirstPage);
		returnMap.put("LastPage", iLastPage);
		returnMap.put("TotalPage", iTotalPage);
		returnMap.put("page", page);
		return returnMap;
	}
	
	public List<Map<String, Object>> selectInspctMgrJinryo(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("jinryoNum", param.get("jinryoNum"));
		map.put("aniName", param.get("aniName"));
		map.put("aniNum", param.get("aniNum"));
		map.put("schType", "jinryo");
		map.put("schType2", param.get("schType2"));
		return treat0406sDao.selectInspctMgr(map);
	}
	
	public List<Map<String, Object>> selectInspctMgrBukum(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("jinryoNum", param.get("jinryoNum"));
		map.put("aniName", param.get("aniName"));
		map.put("aniNum", param.get("aniNum"));
		map.put("schType", "bukum");
		map.put("schType2", param.get("schType2"));
		return treat0406sDao.selectInspctMgr(map);
	}
	
	public List<Map<String, Object>> selectSts(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		return treat0406sDao.selectInspctMgr(map);
	}
	
	public Map<String, Object> getKSDataInfo(String KSDOCNO, String KSNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("KSNO", KSNO);
		return treat0406sDao.getKSDataInfo(map);
	}
	
	public List<Map<String, Object>> getKS01List(String DTLDay, String menuType, String KSDOCNO, String ANICLS) {
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		map.put("KSDOCNO", KSDOCNO);
		map.put("ANICLS", ANICLS);
		return treat0406sDao.getKS01List(map);
	}
	
	public List<Map<String, Object>> selectKSDataList(List<Map<String, Object>> KSNOlist, String JJJ_DOCNO, String DTLDay) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("DTLDay", DTLDay);
		List<Map<String, Object>> KSDATAlist = treat0406sDao.selectKSDataList(map);
		List<Map<String, Object>> returnlist = new ArrayList<Map<String, Object>>();
		if(KSDATAlist != null && KSNOlist != null){
            String wk_KSNo = "";
			for (Map<String, Object> commMAP : KSNOlist) {
				boolean chk = false;
				for (Map<String, Object> KSMAP : KSDATAlist) {
					wk_KSNo = KSMAP.get("JJDKY_KSNO").toString();
					if(commMAP.get("MCC_S_CODE").toString().equals(wk_KSNo))
					{
						Map<String, Object> returnMap = new HashMap<String, Object>();
						returnMap.put("JJDKY_DOCNO", KSMAP.get("JJDKY_DOCNO"));
						returnMap.put("JJDKY_KSDATE", KSMAP.get("JJDKY_KSDATE"));
						returnMap.put("JJDKY_KSNO", KSMAP.get("JJDKY_KSNO"));
						returnMap.put("KSNONAME", KSMAP.get("KSNONAME"));
						returnMap.put("JJDKY_KSSTS", KSMAP.get("JJDKY_KSSTS"));
						returnMap.put("JJDKY_CMNT", KSMAP.get("JJDKY_CMNT"));
						returnMap.put("JJDKY_KSDATEYY", KSMAP.get("JJDKY_KSDATEYY"));
						returnMap.put("JJJ_JRTYPE", KSMAP.get("JJJ_JRTYPE")); 
						returnMap.put("JJJ_RCNO", KSMAP.get("JJJ_RCNO"));
						returnMap.put("KSSELSTS", "true");
						returnlist.add(returnMap);
						chk = true;
					}
				}
				if(!chk)
				{
					Map<String, Object> returnMap = new HashMap<String, Object>();
					returnMap.put("JJDKY_DOCNO", "");
					returnMap.put("JJDKY_KSDATE", "1900-01-01");
					returnMap.put("JJDKY_KSNO", commMAP.get("MCC_S_CODE"));
					returnMap.put("KSNONAME", commMAP.get("MCC_S_NAME"));
					returnMap.put("JJDKY_KSSTS", "X");
					returnMap.put("JJDKY_CMNT", "");
					returnMap.put("JJDKY_KSDATEYY", "");
					returnMap.put("JJJ_JRTYPE", ""); 
					returnMap.put("JJJ_RCNO", "");
					returnMap.put("KSSELSTS", "false");
					returnlist.add(returnMap);
				}
			}
			return returnlist;
		}
		else{
			return null;
		}
	}
	public int setKSInfo(Map<String, Object> param, List<Map<String, Object>> KSNOlist, String USERID){
		if(KSNOlist != null){
			String KSDOCNO = "";
			if(param.get("KSDOCNO") == null || param.get("KSDOCNO").toString().equals(""))
			{
				KSDOCNO = treat0402sSvc.get_upd4DocNo("KS", "JN_JINRYO_DATE_KY", "JJDKY_DocNo", "");
			}
			else
			{
				KSDOCNO = param.get("KSDOCNO").toString();
			}
			for (Map<String, Object> commMAP : KSNOlist) {
				String KSVAL = "KS_" + commMAP.get("MCC_S_CODE").toString();
				System.out.println("KS Chk!! " + param.get(KSVAL));
				if(param.get(KSVAL) != null){
					String CMNTVAL = "CMNT_" + commMAP.get("MCC_S_CODE").toString();
					Map<String, Object> KSINFO = getKSDataInfo(KSDOCNO, commMAP.get("MCC_S_CODE").toString());
					
					if(KSINFO == null || KSINFO.size() == 0){
						Map<String, Object> map = new LinkedHashMap<String, Object>();
						map.put("KSDOCNO", KSDOCNO);
						map.put("JJJ_DOCNO", param.get("JRNO").toString());
						map.put("DTLDay", param.get("DTLDay").toString());
						map.put("KSNO", commMAP.get("MCC_S_CODE").toString());
						map.put("CMNT", param.get(CMNTVAL).toString());
						map.put("USERID", USERID);
						System.out.println("KS InsertChk!! KSDOCNO = " + KSDOCNO + ", JJJ_DOCNO = " + param.get("JRNO").toString()
								+ ", DTLDay = " + param.get("DTLDay").toString() + ", KSNO = " + commMAP.get("MCC_S_CODE").toString()
								+ ", CMNT = " + param.get(CMNTVAL).toString() + ", USERID = " + USERID);
						int chk = treat0406sDao.insertKSInfo(map);
						if(chk == -1){
							return chk;
						}
					}
					else{
						Map<String, Object> map = new LinkedHashMap<String, Object>();
						map.put("KSDOCNO", KSDOCNO);
						map.put("KSNO", commMAP.get("MCC_S_CODE").toString());
						map.put("CMNT", param.get(CMNTVAL).toString());
						map.put("USERID", USERID);
						System.out.println("KS UpdateChk!! KSDOCNO = " + KSDOCNO + ", KSNO = " + commMAP.get("MCC_S_CODE").toString());
						int chk = treat0406sDao.updateKSInfo(map);
						if(chk == -1){
							return chk;
						}
					}
				}
				else{
					if(param.get("KSDOCNO") != null && !param.get("KSDOCNO").toString().equals(""))
					{
						Map<String, Object> map = new LinkedHashMap<String, Object>();
						map.put("KSDOCNO", param.get("KSDOCNO").toString());
						map.put("KSNO", commMAP.get("MCC_S_CODE").toString());
						System.out.println("KS DeleteChk!! KSDOCNO = " + param.get("KSDOCNO").toString() + ", KSNO = " + commMAP.get("MCC_S_CODE").toString());
						int chk = treat0406sDao.deleteKSInfo(map);
						if(chk == -1){
							return chk;
						}
					}
				}
			}
		}
		else{
			return -1;
		}
		return 0;
	}
	public List<Map<String, Object>> getK01DataInfo(String KSDOCNO, String DTLDay, String ITEM){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("ITEM", ITEM);
		return treat0406sDao.getK01DataInfo(map);
	}
	
	public List<Map<String, Object>> getKS02List(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.getKS02List(map);
	}
	
	public List<Map<String, Object>> getKS03List(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.getKS03List(map);
	}
	
	public List<Map<String, Object>> getKS04List(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.getKS04List(map);
	}
	
	public List<Map<String, Object>> getKS05List(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.getKS05List(map);
	}
	
	public List<Map<String, Object>> getKS06List(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.getKS06List(map);
	}
	
	public Map<String, Object> getKS07List(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.getKS07List(map);
	}
	
	public List<Map<String, Object>> getKS08List(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.getKS08List(map);
	}
	
	public Map<String, Object> getKS09List(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.getKS09List(map);
	}
	
	public Map<String, Object> getKS10List(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.getKS10List(map);
	}
	
	public int updateKSStatusInfo(String KSDOCNO, String menuType, String KSNO, String KSDATE, String KSSTS, String USERID){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		if(KSDATE.equals("")){
			Calendar calender = Calendar.getInstance();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			KSDATE = dateFormat.format(calender.getTime());
		}
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("KSTYPE", KSTYPE);
		map.put("KSNO", KSNO);
		map.put("KSDATE", KSDATE);
		map.put("KSSTS", KSSTS);
		map.put("USERID", USERID);
		return treat0406sDao.updateKSStatusInfo(map);
	}
	public boolean setK01DataInfo(Map<String, Object> param, List<Map<String, Object>> KSK01list, String USERID){
		boolean chk = true;
		for (Map<String, Object> map : KSK01list) {
			String RSLT = param.get(map.get("MCC_S_CODE").toString() + "_Rslt") == null ? "0.0" : param.get(map.get("MCC_S_CODE").toString() + "_Rslt").toString();
			String CMNT = param.get(map.get("MCC_S_CODE").toString() + "_Cmnt") == null ? "" : param.get(map.get("MCC_S_CODE").toString() + "_Cmnt").toString();
			List<Map<String, Object>> K01INFO = getK01DataInfo(param.get("KSDOCNO").toString(), param.get("DTLDay").toString(), map.get("MCC_S_CODE").toString());
			if(K01INFO == null){
				return false;
			}
			Map<String, Object> SetMap = new LinkedHashMap<String, Object>();
			SetMap.put("KSDOCNO", param.get("KSDOCNO").toString());
			SetMap.put("DTLDay", param.get("DTLDay").toString());
			SetMap.put("ITEM", map.get("MCC_S_CODE").toString());
			SetMap.put("RSLT", RSLT);
			SetMap.put("CMNT", CMNT);
			SetMap.put("USERID", USERID);
			if(K01INFO.size() > 0){
				int setChk = treat0406sDao.updateK01Info(SetMap);
				if(setChk == -1 && chk){
					chk = false;
				}
			}
			else{
				String KSTYPE = param.get("MenuType").toString().equals("J") ? "1" : "2";
				SetMap.put("KSTYPE", KSTYPE);
				int setChk = treat0406sDao.insertK01Info(SetMap);
				if(setChk == -1 && chk){
					chk = false;
				}
			}
		}
		String Cal1 = param.get("cal_1") == null ? "" : param.get("cal_1").toString();
		int setKSChk = updateKSStatusInfo(param.get("KSDOCNO").toString(), param.get("MenuType").toString(), "K01", Cal1, "2", USERID);
		if(setKSChk == -1 && chk){
			chk = false;
		}
		return chk;
	}
	public boolean setK02DataInfo(String KSDOCNO, String DTLDay, String menuType, List<String> JJDKSK_WAY, List<String> JJDKSK_PART, List<String> JJDKSK_RSLT, String USERID, String cal_1){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		if(JJDKSK_WAY.size() == JJDKSK_PART.size() && JJDKSK_PART.size() == JJDKSK_RSLT.size()){
			if(JJDKSK_WAY.size() == 0){
				return true;
			}
			int deleteChk = deleteK02Info(KSDOCNO, DTLDay, menuType);
			if(deleteChk == -1){
				return false;
			}
			for(int i = 0; i < JJDKSK_WAY.size(); ++i){
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("KSDOCNO", KSDOCNO);
				map.put("DTLDay", DTLDay);
				map.put("KSTYPE", KSTYPE);
				map.put("WAYNO", (i + 1));
				map.put("WAY", JJDKSK_WAY.get(i));
				map.put("PART", JJDKSK_PART.get(i));
				map.put("RSLT", JJDKSK_RSLT.get(i));
				map.put("USERID", USERID);
				System.out.println("setK02DataInfo!! KSDOCNO = " + KSDOCNO + ", DTLDay = " + DTLDay + ", KSTYPE = " + KSTYPE + ", WAYNO = " + (i + 1)
						+ ", WAY = " + JJDKSK_WAY.get(i) + ", PART = " + JJDKSK_PART.get(i) + ", RSLT = " + JJDKSK_RSLT.get(i));
				int insertChk = treat0406sDao.insertK02Info(map);
				if(insertChk == -1){
					return false;
				}
			}
			int setKSChk = updateKSStatusInfo(KSDOCNO, menuType, "K02", cal_1, "2", USERID);
			if(setKSChk == -1){
				return false;
			}
		}
		else{
			return false;
		}
		return true;
	}
	public boolean setK03DataInfo(String KSDOCNO, String DTLDay, String menuType, List<String> JJDKJK_WAY, List<String> JJDKJK_PART, List<String> JJDKJK_RSLT, String USERID, String cal_1){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		if(JJDKJK_WAY.size() == JJDKJK_PART.size() && JJDKJK_PART.size() == JJDKJK_RSLT.size()){
			if(JJDKJK_WAY.size() == 0){
				return true;
			}
			int deleteChk = deleteK03Info(KSDOCNO, DTLDay, menuType);
			if(deleteChk == -1){
				return false;
			}
			for(int i = 0; i < JJDKJK_WAY.size(); ++i){
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("KSDOCNO", KSDOCNO);
				map.put("DTLDay", DTLDay);
				map.put("KSTYPE", KSTYPE);
				map.put("WAYNO", (i + 1));
				map.put("WAY", JJDKJK_WAY.get(i));
				map.put("PART", JJDKJK_PART.get(i));
				map.put("RSLT", JJDKJK_RSLT.get(i));
				map.put("USERID", USERID);
				System.out.println("setK03DataInfo!! KSDOCNO = " + KSDOCNO + ", DTLDay = " + DTLDay + ", KSTYPE = " + KSTYPE + ", WAYNO = " + (i + 1)
						+ ", WAY = " + JJDKJK_WAY.get(i) + ", PART = " + JJDKJK_PART.get(i) + ", RSLT = " + JJDKJK_RSLT.get(i));
				int insertChk = treat0406sDao.insertK03Info(map);
				if(insertChk == -1){
					return false;
				}
			}
			int setKSChk = updateKSStatusInfo(KSDOCNO, menuType, "K03", cal_1, "2", USERID);
			if(setKSChk == -1){
				return false;
			}
		}
		else{
			return false;
		}
		return true;
	}
	public boolean setK04DataInfo(String KSDOCNO, String DTLDay, String menuType, List<String> JJDKHS_PART, List<String> JJDKHS_DSKYUN, List<String> JJDKHS_RSLT, String USERID, String cal_1){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		if(JJDKHS_PART.size() == JJDKHS_DSKYUN.size() && JJDKHS_DSKYUN.size() == JJDKHS_RSLT.size()){
			if(JJDKHS_PART.size() == 0){
				return true;
			}
			
			int deleteChk = deleteK04Info(KSDOCNO, DTLDay, menuType);
			if(deleteChk == -1){
				return false;
			}
			
			for(int i = 0; i < JJDKHS_PART.size(); ++i){
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("KSDOCNO", KSDOCNO);
				map.put("DTLDay", DTLDay);
				map.put("KSTYPE", KSTYPE);
				map.put("PARTNO", (i + 1));
				map.put("PART", JJDKHS_PART.get(i));
				map.put("DSKYUN", JJDKHS_DSKYUN.get(i));
				map.put("RSLT", JJDKHS_RSLT.get(i));
				map.put("USERID", USERID);
				System.out.println("setK04DataInfo!! KSDOCNO = " + KSDOCNO + ", DTLDay = " + DTLDay + ", KSTYPE = " + KSTYPE + ", PARTNO = " + (i + 1)
						+ ", PART = " + JJDKHS_PART.get(i) + ", DSKYUN = " + JJDKHS_DSKYUN.get(i) + ", RSLT = " + JJDKHS_RSLT.get(i));
				
				int insertChk = treat0406sDao.insertK04Info(map);
				if(insertChk == -1){
					return false;
				}
				
			}
			
			int setKSChk = updateKSStatusInfo(KSDOCNO, menuType, "K04", cal_1, "2", USERID);
			if(setKSChk == -1){
				return false;
			}
			
		}
		else{
			return false;
		}
		return true;
	}
	public boolean setK05DataInfo(String KSDOCNO, String DTLDay, String menuType, List<String> JJDKKS_WAY, List<String> JJDKKS_PART, List<String> JJDKKS_RSLT, List<String> JJDKKS_RSLTDC, String USERID, String cal_1){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		if(JJDKKS_WAY.size() == JJDKKS_PART.size() && JJDKKS_PART.size() == JJDKKS_RSLT.size() && JJDKKS_RSLT.size() == JJDKKS_RSLTDC.size()){
			if(JJDKKS_WAY.size() == 0){
				return true;
			}
			
			int deleteChk = deleteK05Info(KSDOCNO, DTLDay, menuType);
			if(deleteChk == -1){
				return false;
			}
			
			for(int i = 0; i < JJDKKS_WAY.size(); ++i){
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("KSDOCNO", KSDOCNO);
				map.put("DTLDay", DTLDay);
				map.put("KSTYPE", KSTYPE);
				map.put("WAYNO", (i + 1));
				map.put("WAY", JJDKKS_WAY.get(i));
				map.put("PART", JJDKKS_PART.get(i));
				map.put("RSLT", JJDKKS_RSLT.get(i));
				map.put("RSLTDC", JJDKKS_RSLTDC.get(i));
				map.put("USERID", USERID);
				System.out.println("setK05DataInfo!! KSDOCNO = " + KSDOCNO + ", DTLDay = " + DTLDay + ", KSTYPE = " + KSTYPE + ", WAYNO = " + (i + 1)
						+ ", WAY = " + JJDKKS_WAY.get(i) + ", PART = " + JJDKKS_PART.get(i) + ", RSLT = " + JJDKKS_RSLT.get(i) + ", RSLTDC = " + JJDKKS_RSLTDC.get(i));
				
				
				int insertChk = treat0406sDao.insertK05Info(map);
				if(insertChk == -1){
					return false;
				}
			}
			
			int setKSChk = updateKSStatusInfo(KSDOCNO, menuType, "K05", cal_1, "2", USERID);
			if(setKSChk == -1){
				return false;
			}
			
		}
		else{
			return false;
		}
		return true;
	}
	public boolean setK06DataInfo(String KSDOCNO, String DTLDay, String menuType, List<String> JJDKJH_WAY, List<String> JJDKJH_PART, List<String> JJDKJH_RSLT, List<String> JJDKJH_RSLTDC, String USERID, String cal_1){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		if(JJDKJH_WAY.size() == JJDKJH_PART.size() && JJDKJH_PART.size() == JJDKJH_RSLT.size() && JJDKJH_RSLT.size() == JJDKJH_RSLTDC.size()){
			if(JJDKJH_WAY.size() == 0){
				return true;
			}
			
			int deleteChk = deleteK06Info(KSDOCNO, DTLDay, menuType);
			if(deleteChk == -1){
				return false;
			}
			
			for(int i = 0; i < JJDKJH_WAY.size(); ++i){
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("KSDOCNO", KSDOCNO);
				map.put("DTLDay", DTLDay);
				map.put("KSTYPE", KSTYPE);
				map.put("WAYNO", (i + 1));
				map.put("WAY", JJDKJH_WAY.get(i));
				map.put("PART", JJDKJH_PART.get(i));
				map.put("RSLT", JJDKJH_RSLT.get(i));
				map.put("RSLTDC", JJDKJH_RSLTDC.get(i));
				map.put("USERID", USERID);
				System.out.println("setK06DataInfo!! KSDOCNO = " + KSDOCNO + ", DTLDay = " + DTLDay + ", KSTYPE = " + KSTYPE + ", WAYNO = " + (i + 1)
						+ ", WAY = " + JJDKJH_WAY.get(i) + ", PART = " + JJDKJH_PART.get(i) + ", RSLT = " + JJDKJH_RSLT.get(i) + ", RSLTDC = " + JJDKJH_RSLTDC.get(i));
				
				
				int insertChk = treat0406sDao.insertK06Info(map);
				if(insertChk == -1){
					return false;
				}
			}
			
			int setKSChk = updateKSStatusInfo(KSDOCNO, menuType, "K06", cal_1, "2", USERID);
			if(setKSChk == -1){
				return false;
			}
			
		}
		else{
			return false;
		}
		return true;
	}
	public boolean setK07DataInfo(String KSDOCNO, String DTLDay, String menuType, String JJDKPC_ITEM, String JJDKPC_SIRYO, String JJDKPC_RSLT, String USERID, String cal_1){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		
		int deleteChk = deleteK07Info(KSDOCNO, DTLDay, menuType);
		if(deleteChk == -1){
			return false;
		}
		
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		map.put("ITEM", JJDKPC_ITEM);
		map.put("SIRYO", JJDKPC_SIRYO);
		map.put("RSLT", JJDKPC_RSLT);
		map.put("USERID", USERID);
		System.out.println("setK07DataInfo!! KSDOCNO = " + KSDOCNO + ", DTLDay = " + DTLDay + ", KSTYPE = " + KSTYPE
				+ ", ITEM = " + JJDKPC_ITEM + ", SIRYO = " + JJDKPC_SIRYO + ", RSLT = " + JJDKPC_RSLT);
		int insertChk = treat0406sDao.insertK07Info(map);
		if(insertChk == -1){
			return false;
		}
		int setKSChk = updateKSStatusInfo(KSDOCNO, menuType, "K07", cal_1, "2", USERID);
		if(setKSChk == -1){
			return false;
		}
		return true;
	}
	public int insfile(MultipartFile biz_file, String KSDOCNO, HttpServletRequest req) throws Exception{
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
			insMap.put("BDA_DOCNO", KSDOCNO);
			insMap.put("BDA_BZCLS1", "PCR");
			insMap.put("BDA_BZCLS2", "N");
			insMap.put("BDA_BZCLS3", "N");
			insMap.put("BDA_CNTNTTYPE", file.getContentType());
			insMap.put("BDA_BZSEQNO", 1);
			insMap.put("CMN_MAK_ID", session.getAttribute(SessionParam.ss_id));
			insMap.put("CMN_MAK_PROG", "TREAT0406");
			insMap.put("CMN_UPD_ID", session.getAttribute(SessionParam.ss_id));
			insMap.put("CMN_UPD_PROG", "TREAT0406");
			return insertFileInfo(insMap);
		}
	}
	public int insfile(MultipartFile biz_file1, MultipartFile biz_file2, MultipartFile biz_file3, String CLS1, String KSDOCNO, HttpServletRequest req) throws Exception{
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
		if(biz_file1 != null){
			fileList.add(biz_file1);
		}
		if(biz_file2 != null){
			fileList.add(biz_file2);
		}
		if(biz_file3 != null){
			fileList.add(biz_file3);
		}
		for(int i = 0; i<fileList.size();++i){
			MultipartFile file = fileList.get(i);
			if(!file.isEmpty()){
				insMap = biz0202sSvc.uploadfile(file, uploadPath);
				if(insMap == null){
					throw new Exception("파일업로드 실패!");
				}
				else{
					insMap.put("BDA_DOCNO", KSDOCNO);
					insMap.put("BDA_BZCLS1", CLS1);
					insMap.put("BDA_BZCLS2", "N");
					insMap.put("BDA_BZCLS3", "N");
					insMap.put("BDA_CNTNTTYPE", file.getContentType());
					insMap.put("BDA_BZSEQNO", getFileSeq(KSDOCNO, CLS1));
					insMap.put("CMN_MAK_ID", session.getAttribute(SessionParam.ss_id));
					insMap.put("CMN_MAK_PROG", "TREAT0406");
					insMap.put("CMN_UPD_ID", session.getAttribute(SessionParam.ss_id));
					insMap.put("CMN_UPD_PROG", "TREAT0406");
					int insertChk = insertFileInfo(insMap);
					if(insertChk == -1){
						return insertChk;
					}
				}
			}
		}
		return 0;
	}
	public boolean deleteFileList(String DOCNO, String CLS1){
		boolean fileChk = true;
		List<Map<String, Object>> fileList = biz0202sSvc.selectFileList2(DOCNO, CLS1);
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
					param.put("KSDOCNO", DOCNO);
					param.put("CLS1", CLS1);
					param.put("SEQNO", map.get("BDA_BZSEQNO"));
					treat0406sDao.deleteFileInfo(param);
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
	public boolean deleteFileInfo(String DOCNO, String CLS1, String SEQ){
		boolean fileChk = true;
		List<Map<String, Object>> fileList = biz0202sSvc.selectFileList2(DOCNO, CLS1);
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
						param.put("KSDOCNO", DOCNO);
						param.put("CLS1", CLS1);
						param.put("SEQNO", map.get("BDA_BZSEQNO"));
						treat0406sDao.deleteFileInfo(param);
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
	public String getFileSeq(String DOCNO, String CLS1){
		List<Map<String, Object>> fileList = biz0202sSvc.selectFileList2(DOCNO, CLS1);
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
	public boolean setK08DataInfo(String KSDOCNO, String DTLDay, String menuType, List<String> S_CODE, List<String> JJDKSB_RSLTDC, List<String> JJDKSB_RSLT, String USERID, String cal_1){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		if(S_CODE.size() == JJDKSB_RSLTDC.size() && JJDKSB_RSLTDC.size() == JJDKSB_RSLT.size()){
			if(S_CODE.size() == 0){
				return true;
			}
			
			int deleteChk = deleteK08Info(KSDOCNO, DTLDay, menuType);
			if(deleteChk == -1){
				return false;
			}
			
			for(int i = 0; i < S_CODE.size(); ++i){
				Map<String, Object> map = new LinkedHashMap<String, Object>();
				map.put("KSDOCNO", KSDOCNO);
				map.put("DTLDay", DTLDay);
				map.put("KSTYPE", KSTYPE);
				map.put("ITEM", S_CODE.get(i));
				map.put("RSLTDC", JJDKSB_RSLTDC.get(i));
				map.put("RSLT", JJDKSB_RSLT.get(i));
				map.put("USERID", USERID);
				System.out.println("setK08DataInfo!! KSDOCNO = " + KSDOCNO + ", DTLDay = " + DTLDay + ", KSTYPE = " + KSTYPE
						+ ", ITEM = " + S_CODE.get(i) + ", RSLTDC = " + JJDKSB_RSLTDC.get(i) + ", RSLT = " + JJDKSB_RSLT.get(i));
			
				int insertChk = treat0406sDao.insertK08Info(map);
				if(insertChk == -1){
					return false;
				}
			}
			
			int setKSChk = updateKSStatusInfo(KSDOCNO, menuType, "K08", cal_1, "2", USERID);
			if(setKSChk == -1){
				return false;
			}
			
		}
		else{
			return false;
		}
		return true;
	}
	public boolean setK09DataInfo(String KSDOCNO, String DTLDay, String menuType, String JJDKXR_RSLT, String USERID, String cal_1){
		String KSTYPE = menuType.equals("J") ? "1" : "2";

		int deleteChk = deleteK09Info(KSDOCNO, DTLDay, menuType);
		if(deleteChk == -1){
			return false;
		}

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		map.put("RSLT", JJDKXR_RSLT);
		map.put("USERID", USERID);
		System.out.println("setK09DataInfo!! KSDOCNO = " + KSDOCNO + ", DTLDay = " + DTLDay + ", KSTYPE = " + KSTYPE + ", RSLT = " + JJDKXR_RSLT);

		int insertChk = treat0406sDao.insertK09Info(map);
		if(insertChk == -1){
			return false;
		}

		int setKSChk = updateKSStatusInfo(KSDOCNO, menuType, "K09", cal_1, "2", USERID);
		if(setKSChk == -1){
			return false;
		}
		return true;
	}
	public boolean setK10DataInfo(String KSDOCNO, String DTLDay, String menuType, String JJDKEP_RSLT, String USERID, String cal_1){
		String KSTYPE = menuType.equals("J") ? "1" : "2";

		int deleteChk = deleteK10Info(KSDOCNO, DTLDay, menuType);
		if(deleteChk == -1){
			return false;
		}

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		map.put("RSLT", JJDKEP_RSLT);
		map.put("USERID", USERID);
		System.out.println("setK10DataInfo!! KSDOCNO = " + KSDOCNO + ", DTLDay = " + DTLDay + ", KSTYPE = " + KSTYPE + ", RSLT = " + JJDKEP_RSLT);

		int insertChk = treat0406sDao.insertK10Info(map);
		if(insertChk == -1){
			return false;
		}

		int setKSChk = updateKSStatusInfo(KSDOCNO, menuType, "K10", cal_1, "2", USERID);
		if(setKSChk == -1){
			return false;
		}
		return true;
	}
	public int insertFileInfo(Map<String, Object> param){
		return treat0406sDao.insertFileInfo(param);
	}
	
	public int deleteK01Info(String KSDOCNO, String DTLDay){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		return treat0406sDao.deleteK01Info(map);
	}
	public int deleteK02Info(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.deleteK02Info(map);
	}
	public int deleteK03Info(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.deleteK03Info(map);
	}
	public int deleteK04Info(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.deleteK04Info(map);
	}
	public int deleteK05Info(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.deleteK05Info(map);
	}
	public int deleteK06Info(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.deleteK06Info(map);
	}
	public int deleteK07Info(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.deleteK07Info(map);
	}
	public int deleteK08Info(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.deleteK08Info(map);
	}
	public int deleteK09Info(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.deleteK09Info(map);
	}
	public int deleteK10Info(String KSDOCNO, String DTLDay, String menuType){
		String KSTYPE = menuType.equals("J") ? "1" : "2";
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("KSDOCNO", KSDOCNO);
		map.put("DTLDay", DTLDay);
		map.put("KSTYPE", KSTYPE);
		return treat0406sDao.deleteK10Info(map);
	}
}