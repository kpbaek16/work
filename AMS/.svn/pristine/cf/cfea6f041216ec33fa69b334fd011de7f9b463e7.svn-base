package GEIT.AMS.Dao.common;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CmUserDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
	this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public Map<String, Object> getLoginInfo(Map<String, Object> map) {
	return sqlSessionTemplate.selectOne("CmUserMapper.getLoginInfo", map);
    }
    
    public Map<String, Object> getUserInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("CmUserMapper.getUserInfo", map);
    }
    
	public List<Map<String, Object>> selectMenuPmsList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmUserMapper.selectMenuPmsList", map);
	}

	public int createUserInfo(Map<String, Object> map) {
		return sqlSessionTemplate.update("CmUserMapper.createUserInfo", map);
    }

    public int createSysUser(Map<String, Object> map) {
    	return sqlSessionTemplate.update("CmUserMapper.createSysUser", map);
    }
    
    public boolean idCheck(String ss_userid){
    	List<String> list = sqlSessionTemplate.selectList("CmUserMapper.idCheck",ss_userid);
    	if(list == null || list.size() < 1)
    		return true;
    	return false;
    }
    
    public boolean isDelUserInfo(String sid){
    	List<String> list = sqlSessionTemplate.selectList("CmUserMapper.getDelUserInfo",sid);
    	boolean ret = ((list.size() > 0)? true : false);
    	return ret;
    }
    
    /*메인 페이지 공지사항 Top 7 가져오기 */
    public List<Map<String, Object>> getRecentBoard() {
		return sqlSessionTemplate.selectList("CmUserMapper.getRecentBoard");
	}
}
