package GEIT.AMS.Dao.main;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;
    
    public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
	this.sqlSessionTemplate = sqlSessionTemplate;
    }
    
    /*메인 페이지 공지사항 Top 7 가져오기 */
    public List<Map<String, Object>> getRecentBoard() {
		return sqlSessionTemplate.selectList("CmUserMapper.getRecentBoard");
	}
    
    public List<Map<String, Object>> selectMainSch(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmUserMapper.selectMainSch", map);
	}
    
    public Map<String, Object> getDocKjInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("CmUserMapper.getDocKjInfo", map);
    }
    
    public List<Map<String, Object>> selectDocKjList(Map<String, Object> map) {
    	return sqlSessionTemplate.selectList("CmUserMapper.selectDocKjList", map);
    }
    
  	/*메인 통합검색*/
    public List<Map<String, Object>> selectSayukSearch(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmUserMapper.selectSayukSearch", map);
	}
    
    public List<Map<String, Object>> selectJinryoSearch(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmUserMapper.selectJinryoSearch", map);
	}
    
    public List<Map<String, Object>> selectBokunSearch(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmUserMapper.selectBokunSearch", map);
	}
    
  	/*메인 현황 차트*/
	public List<Map<String, Object>> selectTotAniList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmStatMapper.selectTotAniList", map);
	}
	
	public List<Map<String, Object>> selectBsAniList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmStatMapper.selectBsAniList", map);
	}
}
