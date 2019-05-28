package GEIT.AMS.Dao.biz;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Biz0202SDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<Map<String, Object>> selectBizManualList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Biz0202.selectBizManualList", param);
	}
	
	public List<Map<String, Object>> selectBizArticleList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Biz0202.selectBizArticleList", param);
	}
	
	public int insertFileInfo(Map<String, Object> param){
		return sqlSessionTemplate.insert("Biz0202.insertFileInfo", param);
	}
	
	public int insertBizInfo(Map<String, Object> param){
		return sqlSessionTemplate.insert("Biz0202.insertBizInfo", param);
	}
	
	public int insertCommentInfo(Map<String, Object> param){
		return sqlSessionTemplate.insert("Biz0202.insertCommentInfo", param);
	}
	public int updateCommentInfo(Map<String, Object> param){
		return sqlSessionTemplate.update("Biz0202.updateCommentInfo", param);
	}
	public int updateBizInfo(Map<String, Object> param){
		return sqlSessionTemplate.update("Biz0202.updateBizInfo", param);
	}
	public int updateFileSeqInfo(Map<String, Object> param){
		return sqlSessionTemplate.update("Biz0202.updateFileSeqInfo", param);
	}
	public int updateBizSelectCntInfo(String DOCNO){
		return sqlSessionTemplate.update("Biz0202.updateBizSelectCntInfo", DOCNO);
	}
	public int deleteCommentInfo(Map<String, Object> param){
		return sqlSessionTemplate.delete("Biz0202.deleteCommentInfo", param);
	}
	public String selectBiz_MaxDocno(){
		return sqlSessionTemplate.selectOne("Biz0202.selectBiz_MaxDocno");
	}
	public List<Map<String, Object>> selectCommentList(String DOCNO) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Biz0202.selectCommentList", DOCNO);
	}
	public List<Map<String, Object>> selectFileList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("Biz0202.selectFileList", param);
	}
	public Map<String, Object> getFileInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("Biz0202.getFileInfo", param);
	}
	public Map<String, Object> getBizInfo(Map<String, Object> param){
		return sqlSessionTemplate.selectOne("Biz0202.getBizInfo", param);
	}
	public int deleteBizInfo(Map<String, Object> param){
		return sqlSessionTemplate.delete("Biz0202.deleteBizInfo", param);
	}
	public int deleteCommentList(Map<String, Object> param){
		return sqlSessionTemplate.delete("Biz0202.deleteCommentList", param);
	}
	public int deleteFileInfo(Map<String, Object> param){
		return sqlSessionTemplate.delete("Biz0202.deleteFileInfo", param);
	}
}
