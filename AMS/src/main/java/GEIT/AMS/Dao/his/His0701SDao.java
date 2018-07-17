package GEIT.AMS.Dao.his;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class His0701SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniHisList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("His0701.selectAniHisList", map);
	}

}
