package GEIT.AMS.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import GEIT.AMS.Dao.AnimalDao;
import GEIT.AMS.Dao.UserDao;

@Service
public class AnimalService {

    @Autowired
	private AnimalDao animalDao;
	
	private int kangCnt;
	private int mogCnt;
	private int gwaCnt;
	
	public int getKangCnt() {
		return kangCnt;
	}
	public void setKangCnt(int kangCnt) {
		this.kangCnt = kangCnt;
	}
	public int getMogCnt() {
		return mogCnt;
	}
	public void setMogCnt(int mogCnt) {
		this.mogCnt = mogCnt;
	}
	public int getGwaCnt() {
		return gwaCnt;
	}
	public void setGwaCnt(int gwaCnt) {
		this.gwaCnt = gwaCnt;
	}
	
	public Map<String, Object> getAnimalInfo(){
	    return animalDao.getAnimalInfo();
	}
	//동물그룹메뉴에서 상단 검색창에서 검색시
	public List<Map<String, Object>> getAnimal_Group(String type, String name, String aniCode1, String aniCode2, String aniCode3){
		List<Map<String, Object>> map = animalDao.getAnimal_Group(type, name, aniCode1, aniCode2, aniCode3);
		if(type.equals("kang"))
		{
			return map;
		}
		if(map != null){
			return getDataGrpChk(type, map);
		}
		else{
			return null;
		}
	}
	//동물그룹에서 동물명 중복제거
	private List<Map<String, Object>> getDataGrpChk(String Type, List<Map<String, Object>> map){
		String KangName = "";
		String mogName = "";
		String gwaName = "";
		//상위 코드가 몇개가 되는지 체크함.
		//상위 코드가 여러개 라면 검색하여 넘어온 것.
		//검색했을 때는 상위코드가 여러개가 될 수 있음.
		//화면에서 검색해서 넘어왔다면 상위동물명이 빈값도 표에 표시함
		kangCnt = 0;
		mogCnt = 0;
		gwaCnt = 0;
		for(int i = 0;i<map.size();++i){
			if(KangName.equals("")){
				KangName = map.get(i).get("KANG_NAME").toString();
				if(map.get(i).containsKey("MOG_NAME")){
					mogName = map.get(i).get("MOG_NAME").toString();
					mogCnt++;
				}
				if(map.get(i).containsKey("GWA_NAME")){
					gwaName = map.get(i).get("GWA_NAME").toString();
					gwaCnt++;
				}
				kangCnt++;
				continue;
			}
			else{
				if(KangName.equals(map.get(i).get("KANG_NAME").toString())){
					map.get(i).put("KANG_NAME", "");
				}
				else{
					KangName = map.get(i).get("KANG_NAME").toString();
					if(map.get(i).containsKey("MOG_NAME")){
						mogName = map.get(i).get("MOG_NAME").toString();
						mogCnt++;
					}
					if(map.get(i).containsKey("GWA_NAME")){
						gwaName = map.get(i).get("GWA_NAME").toString();
						gwaCnt++;
					}
					kangCnt++;
					continue;
				}
			}
			if(!Type.equals("mog")){
				if(mogName.equals(map.get(i).get("MOG_NAME").toString())){
					map.get(i).put("MOG_NAME", "");
				}
				else{
					mogName = map.get(i).get("MOG_NAME").toString();
					if(map.get(i).containsKey("GWA_NAME")){
						gwaName = map.get(i).get("GWA_NAME").toString();
						gwaCnt++;
					}
					mogCnt++;
					continue;
				}
			}
			if(Type.equals("jong")){
				if(gwaName.equals(map.get(i).get("GWA_NAME").toString())){
					map.get(i).put("GWA_NAME", "");
				}
				else{
					gwaName = map.get(i).get("GWA_NAME").toString();
					gwaCnt++;
					continue;
				}
			}
		}
		return map;
	}
}
