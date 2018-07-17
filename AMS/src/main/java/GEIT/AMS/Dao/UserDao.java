package GEIT.AMS.Dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
	this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public Map<String, Object> getLoginInfo(Map<String, Object> map) {
	return sqlSessionTemplate.selectOne("UserMapper.getLoginInfo", map);
    }
    
}
