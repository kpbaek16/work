package GEIT.AMS.Dao.treat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Treat0403SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectJnlList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0403.selectJnlList", map);
	}
	
	public List<Map<String, Object>> select_JRDateDtlList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0403.select_JRDateDtlList", map);
	}
	
	public List<Map<String, Object>> select_KYList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0403.select_KYList", map);
	}
	
	public List<Map<String, Object>> select_CBList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0403.select_CBList", map);
	}
	
	public List<Map<String, Object>> select_FileList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0403.select_FileList", map);
	}
	
	public List<Map<String, Object>> selectJnlDateKYList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0403.selectJnlDateKYList", map);
	}
	
	public Map<String, Object> getJnlInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0403.getJnlInfo", map);
	}
	
	public Map<String, Object> getBuPSInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0403.getBuPSInfo", map);
	}
	
	public Map<String, Object> getAniINFO(String ANICODE) {
		return sqlSessionTemplate.selectOne("Treat0403.getAniINFO", ANICODE);
	}
	
	public int get_JnlDateCHK(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0403.get_JnlDateCHK", map);
	}
	
	public int getFileSeq(String JJJ_DOCNO) {
		return sqlSessionTemplate.selectOne("Treat0403.getFileSeq", JJJ_DOCNO);
	}
	
	public List<Map<String, Object>> SelectFileList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0403.SelectFileList", map);
	}
	
	public int updateJnlDateInfo(Map<String, Object> map){
		return sqlSessionTemplate.update("Treat0403.updateJnlDateInfo", map);
	}
	
	public int updateRctInfo(Map<String, Object> map){
		return sqlSessionTemplate.update("Treat0403.updateRctInfo", map);
	}
	
	public int updateJnlInfo(Map<String, Object> map){
		return sqlSessionTemplate.update("Treat0403.updateJnlInfo", map);
	}
	
	public int updateRctJnlDelete(Map<String, Object> map){
		return sqlSessionTemplate.update("Treat0403.updateRctJnlDelete", map);
	}
	
	public int insertJnlInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0403.insertJnlInfo", map);
	}
	
	public int insertJnlDateInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0403.insertJnlDateInfo", map);
	}
	
	public int insertFileInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0403.insertFileInfo", map);
	}
	
	public int deleteFileInfo(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0403.deleteFileInfo",map);
	}
	
	public int deleteKSDataInfo(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0403.deleteKSDataInfo",map);
	}
	
	public int deleteKSInfo(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0403.deleteKSInfo",map);
	}
	
	public int deleteCBInfo(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0403.deleteCBInfo",map);
	}
	
	public int deleteJnlDateInfo(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0403.deleteJnlDateInfo",map);
	}
	
	public int deleteJnlInfo(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0403.deleteJnlInfo",map);
	}
	
}
