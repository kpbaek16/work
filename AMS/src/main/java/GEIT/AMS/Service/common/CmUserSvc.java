package GEIT.AMS.Service.common;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.common.CmUserDao;
import GEIT.AMS.auth.SessionParam;

@Service
public class CmUserSvc {

	@Autowired
	private CmUserDao cmUserDao;

	public Map<String, Object> getLoginInfo(String id, String pw) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("userid", id);
		map.put("pwd", pw);

		Map<String, Object> user = cmUserDao.getUserInfo(map);

		return user;
	}

	public Map<String, Object> getHjptLoginInfo(String sid) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("sid", sid);

		Map<String, Object> user = cmUserDao.getLoginInfo(map);

		return user;
	}

	/**
	 * 사용자 조회
	 * @param id
	 * @param pw
	 * @return
	 */
	public Map<String, Object> getUserInfo(String id, String pw) {

		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("userid", id);
		map.put("pwd", pw);

		Map<String, Object> userInfo = cmUserDao.getUserInfo(map);
		return userInfo;
	}
	
	/**
	 * 직원 초회 등록
	 * @param param
	 * @return
	 */
	public int regUserInfo(Map<String, Object> param) {
		Map<String, Object> loginMap = new HashMap<String, Object>();
		loginMap.put("sid", param.get("sid"));
		loginMap.put("spw", param.get("pwd"));
		Map<String, Object> user = cmUserDao.getLoginInfo(loginMap);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pwd", param.get("pwd"));
		map.put(SessionParam.ss_id, param.get("sid"));
		map.put(SessionParam.ss_userid, param.get("ss_userid"));
		
		if (user == null) {
			map.put("mui_name", param.get("mui_name"));
			map.put("mui_dptlvlcode", param.get("mui_dptlvlcode"));
			map.put("mui_dptlvlname", param.get("mui_dptlvlname"));
			map.put("mui_dptpositcode", param.get("mui_dptpositcode"));
			map.put("mui_dptpositname", param.get("mui_dptpositname"));
			map.put("mui_lgkeyset", param.get("mui_lgkeyset"));
			System.out.println("#######regUserInfo:" + map.toString());
			cmUserDao.createUserInfo(map);
		}
		return cmUserDao.createSysUser(map);
	}

	public List<Map<String, Object>> selectMenuPmsList(String id) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("userid", id);
		return cmUserDao.selectMenuPmsList(map);
	}
	
	/**
	 * 사용자 등록
	 * 
	 * @param param
	 * @return
	 */
	public int createSysUser(Map<String, Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pwd", param.get("pwd"));
		map.put(SessionParam.ss_id, param.get(SessionParam.ss_id));
		map.put(SessionParam.ss_userid, param.get(SessionParam.ss_userid));
		return cmUserDao.createSysUser(map);
	}
	
	// 아이디 증복검사
	public boolean idCheck(String ss_userid) {
		return cmUserDao.idCheck(ss_userid);
	}

	// 직원번호 삭제검사
	public boolean isDelUserInfo(String sid) {
		return cmUserDao.isDelUserInfo(sid);
	}
	
	/*메인 페이지 공지사항 Top 7  가져오기 */
	public List<Map<String, Object>> getRecentBoard() {
		return cmUserDao.getRecentBoard();
	}
	
}
