package GEIT.AMS.Controller.treat;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import GEIT.AMS.Controller.common.CmKjpCtr;
import GEIT.AMS.Service.common.CmKjpSvc;
import GEIT.AMS.Service.treat.Treat0401SSvc;

@Controller
@RequestMapping(value = "/treat/0401", produces = "text/json; charset=EUC-KR")
public class Treat0401ECtr {

	@Autowired
	Treat0401SSvc treat0401sSvc;

	@Autowired
	CmKjpSvc cmKjpSvc;
	
	private static final Logger logger = LoggerFactory.getLogger(Treat0401ECtr.class);

	@RequestMapping(value = "/selectUserKjpList")
	@ResponseBody
	public String selectUserKjpList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		CmKjpCtr cmKjpCtr = new CmKjpCtr(cmKjpSvc);
		return cmKjpCtr.selectUserKjpList(request, param);
		
	}
	
	@RequestMapping(value = "/selectUserRcvTypeList")
	@ResponseBody
	public String selectUserRcvTypeList(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		CmKjpCtr cmKjpCtr = new CmKjpCtr(cmKjpSvc);
		return cmKjpCtr.selectUserRcvTypeList(request, param);
	}
	
	@RequestMapping(value = "/deleteUserRcvType")
	@ResponseBody
	public int deleteUserRcvType(HttpServletRequest request, @RequestParam Map<String, Object> param) {
		
		CmKjpCtr cmKjpCtr = new CmKjpCtr(cmKjpSvc);
		return cmKjpCtr.deleteUserRcvType(request, param);
	}
}
