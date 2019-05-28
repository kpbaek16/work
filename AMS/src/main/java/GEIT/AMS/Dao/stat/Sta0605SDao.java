package GEIT.AMS.Dao.stat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sta0605SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniBreedList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0605.selectAniBreedList", map);
	}

	public List<Map<String, Object>> selectAniBreedTotList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0605.selectAniBreedTotList", map);
	}
}
