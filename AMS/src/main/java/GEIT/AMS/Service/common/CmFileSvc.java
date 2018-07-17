package GEIT.AMS.Service.common;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.common.CmFileDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class CmFileSvc {

	@Autowired
	private CmFileDao cmFileDao;

	private final String ST_PATH = "Anibase";

	private final String SY_PATH = "SYImg/SY";

	private final String SS_PATH = "SYImg/SS";

    public String getStUploadPath() {
    	return ST_PATH;
    }

    public String getSyUploadPath() {
    	return SY_PATH;
    }

    public String getSsUploadPath() {
    	return SS_PATH;
    }
    
	public String getMaxImgDocno(String bzcls1) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bzcls1", bzcls1);

		String ret = cmFileDao.selectMaxImgDocno(map);
		return ret;
	}
	
	public List<Map<String, Object>> selectStFileList(String bii_anicode) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bii_anicode", bii_anicode);
		return cmFileDao.selectStFileList(map);
	}
	
	public Map<String, Object> selectStFileInfo(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bii_docno", param.get("BII_DOCNO"));
		map.put("bii_bzseqno", param.get("BII_BZSEQNO"));
		Map<String, Object> mapInfo = cmFileDao.selectStFileInfo(map);
		return mapInfo;
	}

	public int insFileInfo(Map<String, Object> param){
		return cmFileDao.insertFileInfo(param);
	}

	public int insSTMaxImgDocList(Map<String, Object> param){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bii_docno", param.get("bii_docno"));
		map.put("bii_anicode", param.get("bii_anicode"));
		map.put("rpsnttype_chkId", param.get("rpsnttype_chkId"));
		
		map.put("imgfilettl_1", param.get("imgfilettl_1"));
		map.put("imgfilettl_2", param.get("imgfilettl_2"));
		map.put("imgfilettl_3", param.get("imgfilettl_3"));
		map.put("imgfilettl_4", param.get("imgfilettl_4"));
		map.put("imgfilettl_5", param.get("imgfilettl_5"));
		
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		if(param.containsKey("list")) {
			map.put("list", param.get("list"));
		}
		return cmFileDao.insertSTMaxDocList(map);
	}
	
	public int updateStFileInfo(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bii_docno", param.get("bii_docno"));
		map.put("bii_bzseqno", param.get("bii_bzseqno"));

		map.put("bii_imgtype", param.get("bii_imgtype"));
		map.put("bii_imgfilenm", param.get("bii_imgfilenm"));
		map.put("bii_imgfilettl", param.get("bii_imgfilettl"));
		map.put("bii_rpsnttype", param.get("bii_rpsnttype"));
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		
		return cmFileDao.updateStFileInfo(map);
	}
	
	public List<Map<String, Object>> selectSyFileList(String bii_docno) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bii_docno", bii_docno);
		return cmFileDao.selectSyFileList(map);
	}
	
	public List<Map<String, Object>> selectSsFileList(String bii_docno) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bii_docno", bii_docno);
		return cmFileDao.selectSsFileList(map);
	}
	
	public Map<String, Object> selectSyFileInfo(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bii_docno", param.get("BII_DOCNO"));
		map.put("bii_bzseqno", param.get("BII_BZSEQNO"));
		Map<String, Object> mapInfo = cmFileDao.selectSyFileInfo(map);
		return mapInfo;
	}

	public Map<String, Object> selectSsFileInfo(Map<String, Object> param) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bii_docno", param.get("BII_DOCNO"));
		map.put("bii_bzseqno", param.get("BII_BZSEQNO"));
		Map<String, Object> mapInfo = cmFileDao.selectSsFileInfo(map);
		return mapInfo;
	}
	
	public int createSyImgList(Map<String, Object> param){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bii_docno", param.get("bii_docno"));
		map.put("bii_bzseqno", param.get("bii_bzseqno"));
		
		map.put("bii_imgtype", param.get("bii_imgtype"));
		map.put("bii_imgfilenm", param.get("bii_imgfilenm"));
		map.put("bii_imgfilettl", param.get("bii_imgfilettl"));
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		return cmFileDao.createSyImgList(map);
	}
	
	public int createSsImgList(Map<String, Object> param){
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("bii_docno", param.get("bii_docno"));
		map.put("bii_bzseqno", param.get("bii_bzseqno"));
		
		map.put("bii_imgtype", param.get("bii_imgtype"));
		map.put("bii_imgfilenm", param.get("bii_imgfilenm"));
		map.put("bii_imgfilettl", param.get("bii_imgfilettl"));
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		return cmFileDao.createSsImgList(map);
	}
	
	public int updateSyFileInfo(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bii_docno", param.get("bii_docno"));
		map.put("bii_bzseqno", param.get("bii_bzseqno"));

		map.put("bii_imgtype", param.get("bii_imgtype"));
		map.put("bii_imgfilenm", param.get("bii_imgfilenm"));
		map.put("bii_imgfilettl", param.get("bii_imgfilettl"));
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		
		return cmFileDao.updateSyFileInfo(map);
	}
	
	public int updateSsFileInfo(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("bii_docno", param.get("bii_docno"));
		map.put("bii_bzseqno", param.get("bii_bzseqno"));
		
		map.put("bii_imgtype", param.get("bii_imgtype"));
		map.put("bii_imgfilenm", param.get("bii_imgfilenm"));
		map.put("bii_imgfilettl", param.get("bii_imgfilettl"));
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		
		return cmFileDao.updateSsFileInfo(map);
	}
	
}
