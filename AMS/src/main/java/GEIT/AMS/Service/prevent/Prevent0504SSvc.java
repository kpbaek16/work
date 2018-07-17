package GEIT.AMS.Service.prevent;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.prevent.Prevent0504SDao;

@Service
public class Prevent0504SSvc {

	@Autowired
	private Prevent0504SDao prevent0504SDao;
	
	public Map<String, Object> selectK01(String JJJ_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		/*map.put("JJDKY_DOCNO", JJDKHS_DOCNO);*/
		Map<String, Object> detailInfo = prevent0504SDao.selectK01(map);
		return detailInfo;
	}
	
	public List<Object> K01_Result(String MBI_ANICLSCODE, String JJDKY_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("MBI_ANICLSCODE", MBI_ANICLSCODE);
		map.put("JJDKY_DOCNO", JJDKY_DOCNO);
		List<Object> detailInfo = prevent0504SDao.K01_Result(map);
		return detailInfo;
	}

	public Map<String, Object> selectK02(String JJJ_DOCNO, String JJDKY_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("JJDKY_DOCNO", JJDKY_DOCNO);
		Map<String, Object> detailInfo = prevent0504SDao.selectK02(map);
		return detailInfo;
	}
	
	public Map<String, Object> selectK03(String JJJ_DOCNO, String JJDKY_DOCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("JJDKY_DOCNO", JJDKY_DOCNO);
		Map<String, Object> detailInfo = prevent0504SDao.selectK03(map);
		return detailInfo;
	}
	
	public Map<String, Object> selectK04(String JJJ_DOCNO, String JJJ_RCNO) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("JJJ_DOCNO", JJJ_DOCNO);
		map.put("JJJ_RCNO", JJJ_RCNO);
		Map<String, Object> detailInfo = prevent0504SDao.selectK04(map);
		return detailInfo;
	}
}
