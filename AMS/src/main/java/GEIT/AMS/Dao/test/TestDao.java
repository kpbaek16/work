package GEIT.AMS.Dao.test;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
	this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public Map<String, Object> getLoginInfo(Map<String, Object> map) {
	return sqlSessionTemplate.selectOne("TestUserMapper.getLoginInfo", map);
    }
    
    public boolean idCheck(String ss_userid){
    	List<String> list = sqlSessionTemplate.selectList("TestUserMapper.idCheck",ss_userid);
    	if(list == null || list.size() < 1)
    		return true;
    	return false;
    }
}
