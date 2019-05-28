package GEIT.AMS.Dao.prevent;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Prevent0501SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectBukumlist(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Prevent0501.selectBukumlist", map);
	}
	
}
