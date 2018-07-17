package GEIT.AMS.Service.treat;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sun.xml.internal.ws.encoding.DataSourceStreamingDataHandler;

import GEIT.AMS.Dao.treat.Treat0402SDao;

@Service
public class Treat0402SSvc {

	@Autowired
	private Treat0402SDao treat0402sDao;

	public List<Map<String, Object>> selectAllList(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("numKeyword", param.get("numKeyword"));
		map.put("vvrmKeyword", param.get("vvrmKeyword"));
		map.put("nameKeyword", param.get("nameKeyword"));
		map.put("jinryoKind", param.get("jinryoKind"));
		map.put("jinryoStatus", param.get("jinryoStatus"));
		return treat0402sDao.selectJnlReq(map);
	}
	
	public List<Map<String, Object>> selectANISEQ(String ANI_NAME, String ANI_CODE, String SEXval, String VVRMval, String Dethtype, String page) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("ANI_NAME", ANI_NAME);
		map.put("ANI_CODE", ANI_CODE);
		map.put("SEXval", SEXval);
		map.put("VVRMval", VVRMval);
		map.put("Dethtype", Dethtype);
		map.put("page", page);
		return treat0402sDao.selectANISEQ(map);
	}
	
	public int selectANISEQ_Count(String ANI_NAME, String ANI_CODE, String SEXval, String VVRMval, String Dethtype) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("ANI_NAME", ANI_NAME);
		map.put("ANI_CODE", ANI_CODE);
		map.put("SEXval", SEXval);
		map.put("VVRMval", VVRMval);
		map.put("Dethtype", Dethtype);
		return treat0402sDao.selectANISEQ_Count(map);
	}
	
	public String selectMac_Docno(String ag_TableName, String ag_ColName, String wk_xxYYYYMMDD) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("ag_TableName", ag_TableName);
		map.put("ag_ColName", ag_ColName);
		map.put("wk_xxYYYYMMDD", wk_xxYYYYMMDD);
		String returnVal = treat0402sDao.selectMac_Docno(map);
		return returnVal == null ? "" : returnVal;
	}
	
	public Map<String, Object> getRctDetail(String DOCNO){
		return treat0402sDao.getRctDetail(DOCNO);
	}
	
	public Map<String, Object> getAniINFO(String ANIINFO){
		return treat0402sDao.getAniINFO(ANIINFO);
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
	public List<Map<String, Object>> getVVRMdata() {
		return treat0402sDao.getVVRMdata();
	}
    //==문서번호 취득=============================================================
    // string ag_YYYYMMDD : 과거 일자에 대해 문서번호를 발번할때 날짜를 지정함 (포맷:YYYYMMDD")
    //                      미지정시는 현재일자에 대해 발번함.
    public String get_upd4DocNo(String ag_BizType, String ag_TableName, String ag_ColName, String ag_YYYYMMDD)
    {
    	String wk_strRet = "";
    	String wk_readMaxNo = "";
        String wk_xxYYYYMMDD = "";
        long wk_SeqNo = 0;

        //
        if (ag_YYYYMMDD.equals(""))
        {
        	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date nowYear = new Date();
			String dateString = formatter.format(nowYear);
            wk_xxYYYYMMDD = ag_BizType + dateString;
        }
        else
        {
            wk_xxYYYYMMDD = ag_BizType + ag_YYYYMMDD;
        }
        wk_readMaxNo = selectMac_Docno(ag_TableName, ag_ColName, wk_xxYYYYMMDD);

        //
        if (wk_readMaxNo.length() > 10)
        {
            // 현존하는 번호에서 최대 문서번호 취득
        	String wk_Rd_xxYYYYMMDD = wk_readMaxNo.substring(0, 10);
            if (wk_Rd_xxYYYYMMDD.equals(wk_xxYYYYMMDD))
            {
                // 동일일자에 문서번호 취득.
                wk_SeqNo = Integer.valueOf(wk_readMaxNo.substring(11));
            }
        }
        //
        wk_strRet = String.format("%s-%05d", wk_xxYYYYMMDD, wk_SeqNo + 1);

        //
        return wk_strRet;
    }
    public int insertJinryoInfo(boolean Pagecheck, String PageNumber, String JJR_Type, String JJR_CMNT, String ANICODE, String USERID){
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
    	String res = "";
    	try{
    		Date res_Time = format.parse(PageNumber);
    		
    		res = format2.format(res_Time);
    	}
    	catch(ParseException e)
    	{
    		System.out.println(e.getMessage());
    		return -1;
    	}
    	String wk_DocNo = "";
    	if (Pagecheck)
        {  
            wk_DocNo = get_upd4DocNo("JY", "JN_JINRYO_RC", "JJR_DocNo", res);
        }
        else
        {
            wk_DocNo = get_upd4DocNo("JY", "JN_JINRYO_RC", "JJR_DocNo", "");
        }
    	System.out.println("DOCNO = " + wk_DocNo + ", RCDate = " + PageNumber + ", USERID = " + USERID + ", JJR_Type = " + JJR_Type + ", JJR_CMNT = " + JJR_CMNT);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("DOCNO", wk_DocNo);
		map.put("RCDate", PageNumber);
		map.put("USERID", USERID);
		map.put("JRType", JJR_Type);
		map.put("CMNT", JJR_CMNT);
		if(treat0402sDao.insertJinryoInfo(map) >= 0){
			return insertANI_ATCHInfo(wk_DocNo, ANICODE, USERID);
		}
		else{
			return -1;
		}
    }
    public int insertANI_ATCHInfo(String DOCNO, String ANICODE, String USERID){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("DOCNO", DOCNO);
		map.put("ANICODE", ANICODE);
		map.put("USERID", USERID);
		return treat0402sDao.insertANI_ATCHInfo(map);
    }
    
    public int updateRCT_HosptlCnfm(String DOCNO, String USERID){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("DOCNO", DOCNO);
		map.put("USERID", USERID);
		return treat0402sDao.updateRCT_HosptlCnfm(map);
    }
    
    public int updateJinryoRCTInfo(String DOCNO, String JRTYPE, String CMNT, String USERID){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("DOCNO", DOCNO);
		map.put("USERID", USERID);
		map.put("JRTYPE", JRTYPE);
		map.put("CMNT", CMNT);
		return treat0402sDao.updateJinryoRCTInfo(map);
    }
    
    public int deleteJinryoRCTInfo(String DOCNO){
    	return treat0402sDao.deleteJinryoRCTInfo(DOCNO);
    }
    
    public int deleteANI_ATCHInfo(String DOCNO){
    	return treat0402sDao.deleteANI_ATCHInfo(DOCNO);
    }
}