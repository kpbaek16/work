package GEIT.AMS.Service.test;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.test.TestDao;

@Service
public class TestService {

	@Autowired
	private TestDao testDao;

	public Map<String, Object> getLoginInfo(String CKEY, String Name, String DptName) {
		Map<String, Object> result = new LinkedHashMap<String, Object>();

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("CKEY", CKEY);
		map.put("Name", Name);
		map.put("DptName", DptName);

		Map<String, Object> user = testDao.getLoginInfo(map);

		/*
		 * if(user == null){ result.put("Result", "Null"); } else {
		 * if(user.get("MUI_SPW").equals(null)){ result.put("Result", "Empty");
		 * } else { if(user.get("MUI_SPW").equals(pw)){ result.put("Result",
		 * "Equal"); } else { result.put("Result", "Wrong"); } } }
		 */

		return result;
	}

	public boolean idCheck(String ss_userid) {
		return testDao.idCheck(ss_userid);
	}
	
}
