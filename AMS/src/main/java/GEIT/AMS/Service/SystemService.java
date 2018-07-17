package GEIT.AMS.Service;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.SystemDao;
import GEIT.AMS.Dao.UserDao;

@Service
public class SystemService {

    @Autowired
    private SystemDao systemDao;

    public Map<String, Object> getSystemInfo() {
	return systemDao.getSystemInfo();
    }

    public Map<String, Object> getCodeList(String type, String code) {
	Map<String, Object> map = new LinkedHashMap<String, Object>();
	map.put("type", type);
	map.put("code", code);
	return systemDao.getCodeList(map);
    }

    public boolean updateSystemInfo(Map<String, Object> map) throws IOException {
	// TODO Auto-generated method stub
	String name = (String) map.get("zoo_name");
	String file_name = (String) map.get("file_name");
	String folder_path = (String) map.get("folder_path");
	String potal_code = (String) map.get("potal_code");

	if (name.length() < 1) {
	    return false;
	} 

	if (file_type_check(file_name) == false) {
	    return false;
	}
	
	if (folder_path_check(folder_path) == false) {
	    return false;
	}
	
	if(potal_code.length() < 1){
	    return false;
	}

	return true;
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
}
