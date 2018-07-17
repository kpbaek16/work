package GEIT.AMS.Dao.common;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CmFileDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

    public String selectMaxImgDocno(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("CmFileMapper.selectMaxImgDocno", map);
    }
    
	public List<Map<String, Object>> selectStFileList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmFileMapper.selectStFileList", map);
	}
    
    public Map<String, Object> selectStFileInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("CmFileMapper.selectStFileInfo", map);
    }
    
	public int insertFileInfo(Map<String, Object> param){
		return sqlSessionTemplate.insert("CmFileMapper.insertFileInfo", param);
	}
	
	public int insertSTMaxDocList(Map<String, Object> param){
		return sqlSessionTemplate.insert("CmFileMapper.insertSTMaxDocList", param);
	}
	
    public int updateStFileInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.update("CmFileMapper.updateStFileInfo", map);
    }
    
	public List<Map<String, Object>> selectSyFileList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmFileMapper.selectSyFileList", map);
	}
    
	public List<Map<String, Object>> selectSsFileList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("CmFileMapper.selectSsFileList", map);
	}
	
    public Map<String, Object> selectSyFileInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("CmFileMapper.selectSyFileInfo", map);
    }
    
    public Map<String, Object> selectSsFileInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.selectOne("CmFileMapper.selectSsFileInfo", map);
    }
    
	public int createSyImgList(Map<String, Object> param){
		return sqlSessionTemplate.insert("CmFileMapper.createSyImgList", param);
	}
	
	public int createSsImgList(Map<String, Object> param){
		return sqlSessionTemplate.insert("CmFileMapper.createSsImgList", param);
	}
	
    public int updateSyFileInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.update("CmFileMapper.updateSyFileInfo", map);
    }
    
    public int updateSsFileInfo(Map<String, Object> map) {
    	return sqlSessionTemplate.update("CmFileMapper.updateSsFileInfo", map);
    }
    
}
