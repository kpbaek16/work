package GEIT.AMS.Service.base;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.base.Base0101SDao;

@Service
public class Base0101SSvc {

	@Autowired
	private Base0101SDao base0101sDao;

	public Map<String, Object> getSystemInfo() {
		return base0101sDao.getSystemInfo();
	}
	
    public boolean updateSystemInfo(Map<String, Object> map) throws IOException {

	String usystem_name = (String) map.get("usystem_name");
	String ulogo_name = (String) map.get("ulogo_name");
	String uupload_path = (String) map.get("uupload_path");
	
	map.put("usystem_name", usystem_name);
	map.put("ulogo_name", ulogo_name);
	map.put("uupload_path", uupload_path);
	
	return base0101sDao.updateSystemInfo(map);
    }
    
    private boolean file_type_check(String str) {
    	String allowPattern = ".+\\.(jpg|png|gif)$";
    	boolean result = false;
    	Pattern p = Pattern.compile(allowPattern);
    	Matcher m = p.matcher(str);
    	result = m.matches();
    	return result;
        }

        private boolean folder_path_check(String str) throws IOException {


    	boolean result = false;
    	File dir = new File(str);

    	if (dir.isDirectory()) {
    	    System.out.println("디렉토리가 존재합니다.");
    	} else {
    	    System.out.println("디렉토리가 없습니다. ");
    	}
    	
    	return result;
        }
        
   public List<Map<String, Object>> selectDptList() {
	   return base0101sDao.selectDptList();
	   }   
}
