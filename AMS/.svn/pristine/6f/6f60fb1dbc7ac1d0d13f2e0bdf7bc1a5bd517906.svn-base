package GEIT.AMS.Service.treat;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import GEIT.AMS.Dao.treat.Treat0404SDao;

@Service
public class Treat0404SSvc {

	@Autowired
	private Treat0404SDao treat0404sDao;
	
	@Autowired
	private Treat0402SSvc treat0402sSvc;

	public List<Map<String, Object>> selectPreslist(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("cal_1", param.get("cal_1"));
		map.put("cal_2", param.get("cal_2"));
		map.put("drugKeyword", param.get("drugKeyword"));
		map.put("vvrmKeyword", param.get("vvrmKeyword"));
		map.put("nameKeyword", param.get("nameKeyword"));
		return treat0404sDao.selectPreslist(map);
	}
	
	
	public List<Map<String, Object>> selectDrugList(String SRCHNAME, String SRCHNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("SRCHNAME", SRCHNAME);
		map.put("SRCHNO", SRCHNO);
		return treat0404sDao.selectDrugList(map);
	}
	
	
	public List<Map<String, Object>> selectTmpList(String USERID, String K1, String K2) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("USERID", USERID);
		map.put("K1", K1);
		map.put("K2", K2);
		return treat0404sDao.selectTmpList(map);
	}
	
	public String upd_DrugData(String USERID, String K1, String K2, String CODE){
		List<Map<String, Object>> TmpList = selectTmpList(USERID, K1, K2);
		if(TmpList != null && TmpList.size() > 0){
			for (Map<String, Object> map : TmpList) {
				String DT = map.get("T_DT") != null ? map.get("T_DT").toString() : "";
				if(CODE.equals(DT)){
					return "-1";
				}
			}
		}
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("USERID", USERID);
		map.put("K1", K1);
		map.put("K2", K2);
		int wk_CurMaxNo = treat0404sDao.getMaxK3Info(map);
		int chk = insertTmpInfo(USERID, K1, K2, wk_CurMaxNo + 1, CODE);
		if(chk == -1){
			return "-2";
		}
		else{
			return "";
		}
	}
	
	public List<Map<String, Object>> selectCBDataList(String JJJ_DOCNO, String DTLDay) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("DTLDay", DTLDay);
		return treat0404sDao.selectCBDataList(map);
	}
	

	public Map<String, Object> getDrugInfo(String CODE) {
		return treat0404sDao.getDrugInfo(CODE);
	}
	
	public int insertTmpInfo(String USERID, String K1, String K2, int K3, String T_DT){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("USERID", USERID);
		map.put("K1", K1);
		map.put("K2", K2);
		map.put("K3", K3);
		map.put("T_DT", T_DT);
		return treat0404sDao.insertTmpInfo(map);
	}
	
	public int deleteTmpInfo(String USERID, String K1, String K2, String CODE){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("USERID", USERID);
		map.put("K1", K1);
		map.put("K2", K2);
		map.put("CODE", CODE);
		return treat0404sDao.deleteTmpInfo(map);
	}
	
	public int deleteCBInfo(String CBDOCNO){
		return treat0404sDao.deleteCBInfo(CBDOCNO);
	}
	
	public int insertCBInfo(@RequestParam Map<String, Object> param, String USERID)
	{
		String CBDOCNO = "";
		if(param.get("CBDOCNO") == null || param.get("CBDOCNO").toString().equals(""))
		{
			CBDOCNO = treat0402sSvc.get_upd4DocNo("CB", "JN_JINRYO_DATE_CB", "JJDCB_DocNo", "");
		}
		else
		{
			CBDOCNO = param.get("CBDOCNO").toString();
		}
		List<Map<String, Object>> tempList = selectTmpList(USERID, "CB", "SelDrug");
		if(tempList != null)
		{
			for (Map<String, Object> map : tempList) {
				Map<String, Object> CBMAP = new HashMap<String, Object>();
				CBMAP.put("CBDOCNO", CBDOCNO);
				CBMAP.put("DTLDay", param.get("DTLDay"));
				CBMAP.put("JJJ_DOCNO", param.get("JRNO"));
				CBMAP.put("DRUGCODE", map.get("T_DT"));
				CBMAP.put("USEVOL", param.get("USEVOL_" + map.get("T_DT")));
				CBMAP.put("CMNT", param.get("CMNT_" + map.get("T_DT")));
				CBMAP.put("USERID", USERID);
				int chk = treat0404sDao.insertCBInfo(CBMAP);
				if(chk == -1){
					return chk;
				}
			}
		}
		return 0;
	}
}