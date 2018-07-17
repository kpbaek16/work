package GEIT.AMS.Controller.base;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import GEIT.AMS.Service.base.Base0108SSvc;
import GEIT.AMS.auth.SessionParam;
import GEIT.AMS.util.JsonUtil;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application main page.
 */
@Controller
@RequestMapping(value = "/base/0108", produces = "text/json; charset=EUC-KR")
public class Base0108SCtr{

	private static final Logger logger = LoggerFactory.getLogger(Base0108SCtr.class);
	
	@Autowired
	private Base0108SSvc base0108sSvc;

	@RequestMapping(value = "/main")
	public ModelAndView main(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/base/0108S_BloodInfo_01");
		return mav;
	}

	@RequestMapping(value = "/sub")
	public ModelAndView sub(HttpServletRequest request, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/base/0108S_BloodTest_01");
		return mav;
	}

	@RequestMapping(value = "/selectAniCls1List")
    @ResponseBody
	public String selectAniCls1List(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAniCls1List:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0108sSvc.selectAniCls1List(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniCls2List")
    @ResponseBody
	public String selectAniCls2List(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAniCls2List:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0108sSvc.selectAniCls2List(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniCls3List")
    @ResponseBody
	public String selectAniCls3List(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAniCls3List:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0108sSvc.selectAniCls3List(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniCls4List")
    @ResponseBody
	public String selectAniCls4List(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAniCls4List:" + param.toString());
		String ret = JsonUtil.getJsonStringFromList(base0108sSvc.selectAniCls4List(param));
		return ret;
	}
	
	@RequestMapping(value = "/selectAniClsInfo")
    @ResponseBody
	public String selectAniClsInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectAniInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0108sSvc.selectAniClsInfo(param.get("mac_aniclscode").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	@RequestMapping(value = "/selectBdInspList")
	@ResponseBody
	public String selectBdInspList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectBdInspList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mac_aniclscode", param.get("mac_aniclscode").toString());
		String ret = JsonUtil.getJsonStringFromList(base0108sSvc.selectBdInspList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectBdItemList")
	@ResponseBody
	public String selectBdItemList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectBdItemList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mac_aniclscode", param.get("mac_aniclscode").toString());
		map.put("schKeyword", param.get("schKeyword"));
		String ret = JsonUtil.getJsonStringFromList(base0108sSvc.selectBdItemList(map));
		return ret;
	}
	
	@RequestMapping(value = "/createBdInspList")
    @ResponseBody
	public String createBdInspList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    logger.info("createBdInspList:" + param.toString());
	    
		HttpSession session = request.getSession(false);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
		map.put("mac_aniclscode", param.get("mac_aniclscode").toString());
		map.put("schKeyword", param.get("schKeyword"));

		List<String> list = new ArrayList<String>();
		StringTokenizer listToken = new StringTokenizer(param.get("list").toString(), ",");
		while (listToken.hasMoreElements()) {
			String mbi_bdinspcode = (String) listToken.nextElement();
			list.add(mbi_bdinspcode);
		}
		map.put("list", list);

		int i = base0108sSvc.createBdInspList(map);
	    String qryRslt = "Y";
		if (i == 0){
			qryRslt = "N";
		}
	    JSONObject json = JsonUtil.getJsonStringFromMap(param);

		json.put("qryRslt", qryRslt);
		
		return json.toString();

	}
	
	@RequestMapping(value = "/selectCommBdItemList")
	@ResponseBody
	public String selectCommBdItemList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		logger.info("selectCommBdItemList:" + param.toString());
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("schKeyword", param.get("schKeyword"));
		String ret = JsonUtil.getJsonStringFromList(base0108sSvc.selectCommBdItemList(map));
		return ret;
	}
	
	@RequestMapping(value = "/selectBdItemInfo")
    @ResponseBody
	public String selectBdItemInfo(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    
		logger.info("selectBdItemInfo:" + param.toString());
		String ret = null;

	    Map<String, Object> map = base0108sSvc.selectBdItemInfo(param.get("mcc_s_code").toString());
	    JSONObject json = JsonUtil.getJsonStringFromMap(map);
		if (map!=null) {
			ret = json.toString();
		}
		logger.info("ret:" + ret);
		return ret;
	}
	
	@RequestMapping(value = "/createBdItem")
    @ResponseBody
	public String createBdItem(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    logger.info("createBdItem:" + param.toString());
	    
		HttpSession session = request.getSession(false);
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
		map.put("regMode", param.get("regMode"));
		map.put("mcc_s_code", param.get("mcc_s_code"));
		map.put("mcc_s_name", param.get("mcc_s_name"));
		map.put("mcc_sort_order", param.get("mcc_sort_order"));
		map.put("mcc_com_s1", param.get("mcc_com_s1"));

		int i = base0108sSvc.createBdItem(map);
	    String qryRslt = "Y";
		if (i == 0){
			qryRslt = "N";
		}
	    JSONObject json = JsonUtil.getJsonStringFromMap(param);

		json.put("qryRslt", qryRslt);
		
		return json.toString();

	}

	@RequestMapping(value = "/deleteBdItem")
    @ResponseBody
	public String deleteBdItem(HttpServletRequest request, @RequestParam Map<String, Object> param) {
	    logger.info("deleteBdItem:" + param.toString());
	    
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		map.put("mcc_s_code", param.get("mcc_s_code"));

		int i = base0108sSvc.deleteBdItem(map);
	    String qryRslt = "Y";
		if (i == 0){
			qryRslt = "N";
		}
	    JSONObject json = JsonUtil.getJsonStringFromMap(param);

		json.put("qryRslt", qryRslt);
		
		return json.toString();

	}
	
	@RequestMapping(value = "/saveBdInspList")
	@ResponseBody
	public String saveBdInspList(HttpServletRequest request, @RequestParam Map<String, Object> param,
			@RequestParam(value = "mbi_aniclscode") String[] aniclscode_list,
			@RequestParam(value = "mbi_bdinspcode") String[] mbi_bdinspcode_list,
			@RequestParam(value = "mbi_mean") String[] mbi_mean_list,
			@RequestParam(value = "mbi_stddevi") String[] mbi_stddevi_list) {
		logger.info("saveBdInspList:" + param.toString());
		JSONObject json = new JSONObject();

		String qryRslt = "N";
		int cnt = 0;
		for (int i = 0; i < aniclscode_list.length; i++) {
			System.out.println(aniclscode_list[i].toString() + "::" + mbi_bdinspcode_list[i].toString() + "::"
					+ mbi_mean_list[i].toString() + "::" + mbi_stddevi_list[i].toString());
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("mbi_aniclscode", aniclscode_list[i]);
			map.put("mbi_bdinspcode", mbi_bdinspcode_list[i]);
			map.put("mbi_mean", mbi_mean_list[i]);
			map.put("mbi_stddevi", mbi_stddevi_list[i]);
			cnt += base0108sSvc.updateBdInsp(map);
			qryRslt = "Y";
		}
		if (cnt == 0) {
			qryRslt = "N";
		}
		json.put("qryRslt", qryRslt);

		return json.toString();
	}

}
