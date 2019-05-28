package GEIT.AMS.Dao.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import GEIT.AMS.util.PaginationInfo;

public class AbstractDao {
	protected Log log = LogFactory.getLog(AbstractDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	public Object insert(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public Object update(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public Object delete(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	public Object selectOne(String queryId){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectOne(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId){
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectPagingList(String queryId, Object params){
		printQueryId(queryId);
		
		Map<String,Object> map = (Map<String,Object>)params;
		PaginationInfo paginationInfo = new PaginationInfo();
		
		if(!map.containsKey("PAGE_NO")) {
			map.put("PAGE_NO", 1);
		}
		if(map.get("PAGE_ROW")==null) {
			map.put("PAGE_ROW", 20);
		}
		paginationInfo.setCurrentPageNo(Integer.parseInt(map.get("PAGE_NO").toString()));
		paginationInfo.setRecordCountPerPage(Integer.parseInt(map.get("PAGE_ROW").toString())); //페이지당 건수
//		paginationInfo.setPageSize(map.get("PAGE_SIZE")==null? 1: Integer.parseInt(map.get("PAGE_SIZE").toString())); //페이징 리스트의 사이즈
 
		int start = paginationInfo.getFirstRecordIndex();
		int end = start + paginationInfo.getRecordCountPerPage();
		map.put("START",start+1);
		map.put("END",end);
		
		params = map;
		
		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<Map<String,Object>> list = sqlSession.selectList(queryId,params);
		
		returnMap.put("result", list);
		return returnMap;
	}
}
