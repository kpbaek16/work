package GEIT.AMS.Controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import GEIT.AMS.Service.AnimalService;
import GEIT.AMS.Service.SystemService;

@Controller
public class BaseController {

    @Autowired
    SystemService systemService;

    @Autowired
    AnimalService animalService;

    // 기준정보관리 -> 시스템정보 조회
    @RequestMapping("/Base/System_Info")
    public ModelAndView System_Info(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/base/system_info");
	mav.addObject("SystemInfo", systemService.getSystemInfo());
	return mav;
    }

    // 기준정보관리 -> 시스템정보 수정
    @RequestMapping(value = "/Base/System_Info_Update", method = RequestMethod.POST)
    public ModelAndView System_Info_Update(HttpServletRequest request, @RequestParam Map<String, Object> map) throws IOException {
	ModelAndView mav = new ModelAndView();
	mav.setView(new RedirectView("/Base/System_Info.do"));
	boolean result = systemService.updateSystemInfo(map);
	return mav;
    }

    /*******************************************************************************/

    // Category - 대분류
    // Division - 중분류
    // Section - 소분류

    // 기준정보관리 -> 공통코드 조회
    @RequestMapping("/Base/Common_Code")
    public ModelAndView Common_Code(HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/Base/Common_Code");
	return mav;
    }

    // 기준정보관리 -> 공통코드 검색
    @RequestMapping(value = "/Base/Common_Code_Search", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView Common_Code_Search(HttpServletRequest request, @RequestParam("C_Type") String type, @RequestParam("C_Name") String name) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/Base/Common_Code");
	return mav;
    }

    // 기준정보관리 -> 공통코드 하위코드 조회
    @RequestMapping(value = "/Base/Common_Code_Sub", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView Common_Code_Sub(HttpServletRequest request, @RequestParam("C_Type") String type, @RequestParam("C_Name") String name) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/Base/Common_Code");
	return mav;
    }

    /*******************************************************************************/

    // 기준정보관리 -> 동물그룹 초기화면
    @RequestMapping(value = "/Base/Ani_Group.do", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView Ani_Group(HttpServletRequest request) {
	List<Map<String, Object>> map = animalService.getAnimal_Group("kang", "", "", "", "");
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/base/ani_group");
	mav.addObject("type", "kang");
	mav.addObject("list", map);
	System.out.println("TEST = " + animalService.getKangCnt());
	mav.addObject("kangCnt", animalService.getKangCnt());
	return mav;
    }

    // 기준정보관리 -> 동물그룹 검색
    @RequestMapping(value = "/Base/Ani_GroupSeq.do", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView Ani_groupSeq(HttpServletRequest request, @RequestParam(value = "groupType", defaultValue = "kang") String groupType,
	    @RequestParam(value = "groupName", defaultValue = "") String groupName) {
	List<Map<String, Object>> map = animalService.getAnimal_Group(groupType, groupName, "", "", "");
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/base/ani_group");
	mav.addObject("type", groupType);
	mav.addObject("name", groupName);
	mav.addObject("list", map);
	System.out.println("Ani_GroupSeq TEST = " + animalService.getKangCnt());
	mav.addObject("kangCnt", animalService.getKangCnt());
	mav.addObject("mogCnt", animalService.getMogCnt());
	mav.addObject("gwaCnt", animalService.getGwaCnt());
	return mav;
    }

    // 기준정보관리 -> 동물그룹 에서 하위데이터 선택
    @RequestMapping(value = "/Base/Ani_GroupRowRank.do", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView Ani_GroupRowRank(HttpServletRequest request, @RequestParam(value = "Rowtype", defaultValue = "") String groupType,
	    @RequestParam(value = "aniCode1", defaultValue = "") String aniCode1,
	    @RequestParam(value = "aniCode2", defaultValue = "") String aniCode2, @RequestParam(value = "aniCode3", defaultValue = "") String aniCode3) {
	ModelAndView mav = new ModelAndView();
	if (groupType.equals("")) {
	    mav.setView(new RedirectView("Ani_Group.do"));
	    return mav;
	}
	List<Map<String, Object>> map = animalService.getAnimal_Group(groupType, "", aniCode1, aniCode2, aniCode3);
	mav.setViewName("/base/ani_group");
	mav.addObject("type", groupType);
	mav.addObject("list", map);
	mav.addObject("kangCnt", animalService.getKangCnt());
	mav.addObject("mogCnt", animalService.getMogCnt());
	mav.addObject("gwaCnt", animalService.getGwaCnt());
	return mav;
    }
    /*******************************************************************************/
}
