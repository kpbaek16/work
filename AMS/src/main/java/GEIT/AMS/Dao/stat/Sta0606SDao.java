package GEIT.AMS.Dao.stat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Sta0606SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectAniRentList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0606.selectAniRentList", map);
	}

	public List<Map<String, Object>> selectAniRentTotList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Sta0606.selectAniRentTotList", map);
	}
}
