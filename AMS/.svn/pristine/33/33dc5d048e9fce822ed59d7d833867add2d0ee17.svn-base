package GEIT.AMS.Service;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.UserDao;

@Service
public class UserService {

    	@Autowired
    	private UserDao userDao;

    	public Map<String, Object> getLoginInfo(String id, String pw){
    	    Map<String, Object> result = new LinkedHashMap<String, Object>();

    	    Map<String, Object> map = new LinkedHashMap<String, Object>();
    	    map.put("sid", id);
    	    map.put("spw", pw);
    	    
    	    Map<String, Object> user = userDao.getLoginInfo(map);
    	    
    	    if(user == null){
    		result.put("Result", "Null");
    	    } else {
    		if(user.get("MUI_SPW").equals(null)){
    		    result.put("Result", "Empty");
    		} else {
    		    if(user.get("MUI_SPW").equals(pw)){
    			result.put("Result", "Equal");
    		    } else {
    			result.put("Result", "Wrong");
    		    }
    		}
    	    }
    	    
    	    return result;
    	}
}
