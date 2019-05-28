package GEIT.AMS.Dao.sign;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SIGN0701SDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<Map<String, Object>> selectSignList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("SIGN0701.selectSignList", param);
	}
	
	public List<Map<String, Object>> selectCONNSignList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("SIGN0701.selectCONNSignList", param);
	}
	
	public List<Map<String, Object>> selectSIGN_USERList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("SIGN0701.selectSIGN_USERList", param);
	}
	
	public List<Map<String, Object>> selectUSER_KJPList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("SIGN0701.selectUSER_KJPList", param);
	}
	
	public List<Map<String, Object>> selectTEMPList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("SIGN0701.selectTEMPList", param);
	}
	
	public List<Map<String, Object>> selectUSERList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("SIGN0701.selectUSERList", param);
	}
	public Map<String, Object> getFileInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SIGN0701.getFileInfo", param);
	}
	public Map<String, Object> getSIGNInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SIGN0701.getSIGNInfo", param);
	}
	
	public Map<String, Object> getUSERInfo(String USERID) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SIGN0701.getUSERInfo", USERID);
	}
	
	public String getTEMPInfo(Map<String, Object> param){
		return sqlSessionTemplate.selectOne("getTEMPInfo",param);
	}
	public String getMAX_TK3(String USERID) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SIGN0701.getMAX_TK3", USERID);
	}
	
	public String getMAX_KJNOInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SIGN0701.getMAX_KJNOInfo", param);
	}
	public String getMAX_SIGN_NOInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SIGN0701.getMAX_SIGN_NOInfo", param);
	}
	
	public Map<String, Object> getSignUserInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SIGN0701.getSignUserInfo", param);
	}
	public Map<String, Object> getNextSignUserInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SIGN0701.getNextSignUserInfo", param);
	}
	public String getSIGNCNT_Info(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("SIGN0701.getSIGNCNT_Info", param);
	}
	
	public int insertSIGNInfo(Map<String, Object> param){
		return sqlSessionTemplate.insert("SIGN0701.insertSIGNInfo", param);
	}
	
	public int insertSIGN_USERList(Map<String, Object> param){
		return sqlSessionTemplate.insert("SIGN0701.insertSIGN_USERList", param);
	}
	
	public int insertTEMP_KJPList(Map<String, Object> param){
		return sqlSessionTemplate.insert("SIGN0701.insertTEMP_KJPList", param);
	}
	
	public int insertTEMP_SIGNUSERList(Map<String, Object> param){
		return sqlSessionTemplate.insert("SIGN0701.insertTEMP_SIGNUSERList", param);
	}
	
	public int insertTEMP_KJPInfo(Map<String, Object> param){
		return sqlSessionTemplate.insert("SIGN0701.insertTEMP_KJPInfo", param);
	}
	
	public int updateUserInfo(Map<String, Object> param){
		return sqlSessionTemplate.update("SIGN0701.updateUserInfo", param);
	}
	
	public int updateSignUser(Map<String, Object> param){
		return sqlSessionTemplate.update("SIGN0701.updateSignUser", param);
	}
	
	public int updateSignUserInfo(Map<String, Object> param){
		return sqlSessionTemplate.update("SIGN0701.updateSignUserInfo", param);
	}
	
	public int updateNextSignUserInfo(Map<String, Object> param){
		return sqlSessionTemplate.update("SIGN0701.updateNextSignUserInfo", param);
	}
	
	public int updateSignInfo(Map<String, Object> param){
		return sqlSessionTemplate.update("SIGN0701.updateSignInfo", param);
	}
	
	public int updateCNFMSTSUserInfo(Map<String, Object> param){
		return sqlSessionTemplate.update("SIGN0701.updateCNFMSTSUserInfo", param);
	}
	
	public int updateCONN_SIGNInfo(Map<String, Object> param){
		return sqlSessionTemplate.update("SIGN0701.updateCONN_SIGNInfo", param);
	}
	
	public int deleteSIGNUserList(Map<String, Object> param){
		return sqlSessionTemplate.delete("SIGN0701.deleteSIGNUserList", param);
	}
	
	public int deleteSIGNInfo(Map<String, Object> param){
		return sqlSessionTemplate.delete("SIGN0701.deleteSIGNInfo", param);
	}
	
	public int deleteTEMPList(String USERID){
		return sqlSessionTemplate.delete("SIGN0701.deleteTEMPList",USERID);
	}
	
	public int deleteTEMPInfo(Map<String, Object> param){
		return sqlSessionTemplate.delete("SIGN0701.deleteTEMPInfo", param);
	}
	public int deleteFileInfo(Map<String, Object> param){
		return sqlSessionTemplate.delete("SIGN0701.deleteFileInfo", param);
	}
}
