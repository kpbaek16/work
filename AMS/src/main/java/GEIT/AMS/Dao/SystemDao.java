package GEIT.AMS.Dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SystemDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
	this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public Map<String, Object> getSystemInfo() {
	// TODO Auto-generated method stub
	return sqlSessionTemplate.selectOne("SystemMapper.getSystemInfo");
    }
    
    public Map<String, Object> getCodeList(Map<String, Object> map) {
	// TODO Auto-generated method stub
	return null;
    }
}
