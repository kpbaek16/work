package GEIT.AMS.Dao.treat;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Treat0406SDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<Map<String, Object>> selectInspctMgr(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.selectInspctMgr", map);
	}
	
	public int selectInspctMgrCount(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0406.selectInspctMgrCount", map);
	}
	
	public List<Map<String, Object>> selectKSDataList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.selectKSDataList", map);
	}
	
	public Map<String, Object> getKSDataInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0406.getKSDataInfo", map);
	}
	
	public List<Map<String, Object>> getK01DataInfo(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.getK01DataInfo", map);
	}
	
	public List<Map<String, Object>> getKS02List(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.getKS02List", map);
	}
	
	public List<Map<String, Object>> getKS03List(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.getKS03List", map);
	}
	
	public List<Map<String, Object>> getKS04List(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.getKS04List", map);
	}
	
	public List<Map<String, Object>> getKS05List(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.getKS05List", map);
	}
	
	public List<Map<String, Object>> getKS06List(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.getKS06List", map);
	}
	
	public Map<String, Object> getKS07List(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0406.getKS07List", map);
	}
	
	public List<Map<String, Object>> getKS08List(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.getKS08List", map);
	}
	
	public Map<String, Object> getKS09List(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0406.getKS09List", map);
	}
	
	public Map<String, Object> getKS10List(Map<String, Object> map) {
		return sqlSessionTemplate.selectOne("Treat0406.getKS10List", map);
	}
	
	public List<Map<String, Object>> getKS01List(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("Treat0406.getKS01List", map);
	}
	
	public int insertKSInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertKSInfo", map);
	}
	
	public int insertK01Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK01Info", map);
	}
	
	public int insertK02Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK02Info", map);
	}
	
	public int insertK03Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK03Info", map);
	}
	
	public int insertK04Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK04Info", map);
	}
	
	public int insertK05Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK05Info", map);
	}
	
	public int insertK06Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK06Info", map);
	}
	
	public int insertK07Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK07Info", map);
	}
	
	public int insertK08Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK08Info", map);
	}
	
	public int insertK09Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK09Info", map);
	}
	
	public int insertK10Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertK10Info", map);
	}
	
	public int insertFileInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.insertFileInfo", map);
	}
	
	public int updateKSInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.updateKSInfo", map);
	}
	
	public int updateKSStatusInfo(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.updateKSStatusInfo", map);
	}
	
	public int updateK01Info(Map<String, Object> map){
		return sqlSessionTemplate.insert("Treat0406.updateK01Info", map);
	}
	
	public int deleteKSInfo(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteKSInfo", map);
	}
	
	public int deleteFileInfo(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteFileInfo", map);
	}
	
	public int deleteK01Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK01Info", map);
	}
	
	public int deleteK02Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK02Info", map);
	}
	
	public int deleteK03Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK03Info", map);
	}
	
	public int deleteK04Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK04Info", map);
	}
	
	public int deleteK05Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK05Info", map);
	}
	
	public int deleteK06Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK06Info", map);
	}
	
	public int deleteK07Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK07Info", map);
	}
	
	public int deleteK08Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK08Info", map);
	}
	
	public int deleteK09Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK09Info", map);
	}
	
	public int deleteK10Info(Map<String, Object> map){
		return sqlSessionTemplate.delete("Treat0406.deleteK10Info", map);
	}
}
