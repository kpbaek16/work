package GEIT.AMS.Dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnimalDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
	this.sqlSessionTemplate = sqlSessionTemplate;
    }
    
    public Map<String, Object> getAnimalInfo() {
    	return sqlSessionTemplate.selectOne("AnimalMapper.getAnimalInfo");
    }
    
    public List<Map<String, Object>> getAnimal_Group(String type, String name, String aniCode1, String aniCode2, String aniCode3) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("name", name);
		map.put("aniCode1", aniCode1);
		map.put("aniCode2", aniCode2);
		map.put("aniCode3", aniCode3);
    	return sqlSessionTemplate.selectList("AnimalMapper.getAnimal_Group", map);
    }
}
