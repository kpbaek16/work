package GEIT.AMS.Controller.common;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import GEIT.AMS.Service.base.Base0101SSvc;
import GEIT.AMS.Service.common.CmFileSvc;
import GEIT.AMS.auth.SessionParam;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/common/file", produces = "text/plain; charset=EUC-KR")
public class CmFileCtr {

	@Autowired
	private CmFileSvc cmFileSvc;

	@Autowired
	private Base0101SSvc base0101sSvc;

	private static final Logger logger = LoggerFactory.getLogger(CmFileCtr.class);

	@ResponseBody
	@RequestMapping(value = "/upload.do", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public String upload(MultipartHttpServletRequest request, @RequestParam Map<String, Object> param
			, @RequestParam(value = "minus_ids") String[] minus_ids
			, @RequestParam(value = "bzseqno_list") String[] bzseqno_list
			, @RequestParam(value = "file_ids") String[] file_ids) throws Exception {
		logger.info(param.toString());
		String ret = null;
		
		String path = base0101sSvc.getSystemInfo().get("MSC_UPLOADPATH").toString();
//		String path = request.getSession().getServletContext().getRealPath("/");

		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		DecimalFormat df = new DecimalFormat("00");

		JSONObject json = new JSONObject();
		Map<String, Object> fileListMap = new LinkedHashMap<String, Object>();

		
		String bzcls1 = param.get("bzcls1").toString();
		String docnoNew = cmFileSvc.getMaxImgDocno(bzcls1);
		logger.info("docnoNew::" + docnoNew);
		
		String imgfilettl_1 = StringUtils.defaultString(param.get("imgfilettl_1").toString());
		String imgfilettl_2 = StringUtils.defaultString(param.get("imgfilettl_2").toString());
		String imgfilettl_3 = StringUtils.defaultString(param.get("imgfilettl_3").toString());
		String imgfilettl_4 = StringUtils.defaultString(param.get("imgfilettl_4").toString());
		String imgfilettl_5 = StringUtils.defaultString(param.get("imgfilettl_5").toString());

		String rpsnttype_chkId = null;
		if(param.get("rpsnttype_chkId")!=null) {
			rpsnttype_chkId = param.get("rpsnttype_chkId").toString();
		}
		System.out.println("rpsnttype_chkId::" + rpsnttype_chkId);
		
		
		HttpSession session = request.getSession(false);
		
		Map<String, Object> paramMap = new LinkedHashMap<String, Object>();
		
		paramMap.put("imgfilettl_1", imgfilettl_1);
		paramMap.put("imgfilettl_2", imgfilettl_2);
		paramMap.put("imgfilettl_3", imgfilettl_3);
		paramMap.put("imgfilettl_4", imgfilettl_4);
		paramMap.put("imgfilettl_5", imgfilettl_5);
		
		paramMap.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < file_ids.length; i++) {
			list.add(file_ids[i]);
			paramMap.put("list", list);
		}
	    if(bzcls1.compareTo("ST")==0) {
			paramMap.put("bii_docno", docnoNew);
			paramMap.put("bii_anicode", param.get("mai_anicode"));
			paramMap.put("rpsnttype_chkId", rpsnttype_chkId);
			cmFileSvc.insSTMaxImgDocList(paramMap);
		}else if(bzcls1.compareTo("SY")==0) {
			for (int i = 0; i < bzseqno_list.length; i++) {
				paramMap.put("bii_docno", param.get("bii_docno"));
				paramMap.put("bii_bzseqno", bzseqno_list[i]);
				if (paramMap.get("bii_bzseqno").toString().compareTo("1")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_1);
				}else if (paramMap.get("bii_bzseqno").toString().compareTo("2")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_2);
				}else if (paramMap.get("bii_bzseqno").toString().compareTo("3")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_3);
				}else if (paramMap.get("bii_bzseqno").toString().compareTo("4")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_4);
				}else if (paramMap.get("bii_bzseqno").toString().compareTo("5")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_5);
				}
				cmFileSvc.updateSyFileInfo(paramMap);
			}
		}else if(bzcls1.compareTo("SS")==0) {
			for (int i = 0; i < bzseqno_list.length; i++) {
				paramMap.put("bii_docno", param.get("bii_docno"));
				paramMap.put("bii_bzseqno", bzseqno_list[i]);
				if (paramMap.get("bii_bzseqno").toString().compareTo("1")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_1);
				}else if (paramMap.get("bii_bzseqno").toString().compareTo("2")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_2);
				}else if (paramMap.get("bii_bzseqno").toString().compareTo("3")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_3);
				}else if (paramMap.get("bii_bzseqno").toString().compareTo("4")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_4);
				}else if (paramMap.get("bii_bzseqno").toString().compareTo("5")==0) {
					paramMap.put("bii_imgfilettl", imgfilettl_5);
				}
				cmFileSvc.updateSsFileInfo(paramMap);
			}
	    }

		// unload images
		for (int i = 0; i < minus_ids.length; i++) {
			Map<String, Object> map = new LinkedHashMap<String, Object>();
			map.put("bii_imgtype", "");
			map.put("bii_imgfilenm", "");

			map.put("bii_bzseqno", minus_ids[i]);
		    if(bzcls1.compareTo("ST")==0) {
				map.put("bii_docno", docnoNew);
				cmFileSvc.updateStFileInfo(map);
			}else if(bzcls1.compareTo("SY")==0) {
				map.put("bii_docno", param.get("bii_docno"));
				if (map.get("bii_bzseqno").toString().compareTo("1")==0) {
					map.put("bii_imgfilettl", imgfilettl_1);
				}else if (map.get("bii_bzseqno").toString().compareTo("2")==0) {
					map.put("bii_imgfilettl", imgfilettl_2);
				}else if (map.get("bii_bzseqno").toString().compareTo("3")==0) {
					map.put("bii_imgfilettl", imgfilettl_3);
				}else if (map.get("bii_bzseqno").toString().compareTo("4")==0) {
					map.put("bii_imgfilettl", imgfilettl_4);
				}else if (map.get("bii_bzseqno").toString().compareTo("5")==0) {
					map.put("bii_imgfilettl", imgfilettl_5);
				}
				cmFileSvc.createSyImgList(map);
			}else if(bzcls1.compareTo("SS")==0) {
				map.put("bii_docno", param.get("bii_docno"));
				if (map.get("bii_bzseqno").toString().compareTo("1")==0) {
					map.put("bii_imgfilettl", imgfilettl_1);
				}else if (map.get("bii_bzseqno").toString().compareTo("2")==0) {
					map.put("bii_imgfilettl", imgfilettl_2);
				}else if (map.get("bii_bzseqno").toString().compareTo("3")==0) {
					map.put("bii_imgfilettl", imgfilettl_3);
				}else if (map.get("bii_bzseqno").toString().compareTo("4")==0) {
					map.put("bii_imgfilettl", imgfilettl_4);
				}else if (map.get("bii_bzseqno").toString().compareTo("5")==0) {
					map.put("bii_imgfilettl", imgfilettl_5);
				}
				cmFileSvc.createSsImgList(map);
		    }
		}
		
		// upload images
	    if(bzcls1.compareTo("ST")==0) {
	    	path += cmFileSvc.getStUploadPath() + "/";
		}else if(bzcls1.compareTo("SY")==0) {
	    	path += cmFileSvc.getSyUploadPath() + "/";
		}else if(bzcls1.compareTo("SS")==0) {
	    	path += cmFileSvc.getSsUploadPath() + "/";
	    }
		System.out.println("path===> " + path);

		Iterator itr = request.getFileNames();
		while (itr.hasNext()) {
			String filename = itr.next().toString();
			List<MultipartFile> mpf = request.getFiles(filename);
			List<String> lstIndex = new ArrayList<String>();
			List<String> lstName = new ArrayList<String>();
			List<String> lstSize = new ArrayList<String>();
			List<String> lstCtntTp = new ArrayList<String>();

			int cntFile = 0;
			for (int i = 0; i < mpf.size(); i++) {
				String prefix = cal.get(Calendar.YEAR) + df.format(cal.get(Calendar.MONTH) + 1)
						+ df.format(cal.get(Calendar.DATE)) + System.currentTimeMillis();
				File file = new File(path + prefix + "_" + mpf.get(i).getOriginalFilename());
				logger.debug(file.getAbsolutePath());
				mpf.get(i).transferTo(file);
				cntFile++;

				lstIndex.add(file_ids[i]);
				lstName.add(file.getName());
				lstSize.add(String.valueOf(file.length()));
				lstCtntTp.add(mpf.get(i).getContentType());

				Map<String, Object> mapIndex = new LinkedHashMap<String, Object>();
				Map<String, Object> mapName = new LinkedHashMap<String, Object>();
				Map<String, Object> mapSize = new LinkedHashMap<String, Object>();
				Map<String, Object> mapCtntTp = new LinkedHashMap<String, Object>();
				mapIndex.put("index", cntFile);
				mapName.put("name", file.getName());
				mapSize.put("size", String.valueOf(file.length()));
				mapCtntTp.put("ctntTp", mpf.get(i).getContentType());

				List<Map<String, Object>> lstMap = new ArrayList<Map<String, Object>>();
				lstMap.add(mapIndex);
				lstMap.add(mapName);
				lstMap.add(mapSize);
				lstMap.add(mapCtntTp);

				Map<String, Object> fileInfoMap = new LinkedHashMap<String, Object>();
				fileInfoMap.put(file_ids[i], lstMap);
				
				fileInfoMap.put("BII_BZCLS1", bzcls1);
			    if(bzcls1.compareTo("ST")==0) {
					fileInfoMap.put("BII_DOCNO", docnoNew);
			    	fileInfoMap.put("BII_ANICODE", param.get("mai_anicode"));
			    	fileInfoMap.put("BII_BZCLS2", "N");	
				}else if(bzcls1.compareTo("SY")==0) {
					fileInfoMap.put("BII_DOCNO", param.get("bii_docno"));
					fileInfoMap.put("BII_BZCLS2", "SY002007");
				}else if(bzcls1.compareTo("SS")==0) {
					fileInfoMap.put("BII_DOCNO", param.get("bii_docno"));
					fileInfoMap.put("BII_BZCLS2", "SY003004");
			    }
			    fileInfoMap.put("BII_BZCLS3", "N");
			    fileInfoMap.put("BII_BZSEQNO", file_ids[i]);
			    fileInfoMap.put("BII_IMGTYPE", mapCtntTp.get("ctntTp"));
			    fileInfoMap.put("BII_IMGFILENM", mapName.get("name"));
				
				if (fileInfoMap.get("BII_BZSEQNO").toString().compareTo("1")==0) {
					fileInfoMap.put("BII_IMGFILETTL", imgfilettl_1);
				}else if (fileInfoMap.get("BII_BZSEQNO").toString().compareTo("2")==0) {
					fileInfoMap.put("BII_IMGFILETTL", imgfilettl_2);
				}else if (fileInfoMap.get("BII_BZSEQNO").toString().compareTo("3")==0) {
					fileInfoMap.put("BII_IMGFILETTL", imgfilettl_3);
				}else if (fileInfoMap.get("BII_BZSEQNO").toString().compareTo("4")==0) {
					fileInfoMap.put("BII_IMGFILETTL", imgfilettl_4);
				}else if (fileInfoMap.get("BII_BZSEQNO").toString().compareTo("5")==0) {
					fileInfoMap.put("BII_IMGFILETTL", imgfilettl_5);
				}
				fileInfoMap.put("CMN_MAK_ID", session.getAttribute(SessionParam.ss_userid));

				if (bzcls1.compareTo("ST") == 0) {
					Map<String, Object> map = cmFileSvc.selectStFileInfo(fileInfoMap);
					if (map == null) {
						cmFileSvc.insFileInfo(fileInfoMap);
					} else {
						Map<String, Object> infoMap = new LinkedHashMap<String, Object>();
						infoMap.put("bii_imgtype", fileInfoMap.get("BII_IMGTYPE"));
						infoMap.put("bii_imgfilenm", fileInfoMap.get("BII_IMGFILENM"));
						infoMap.put("bii_imgfilettl", fileInfoMap.get("BII_IMGFILETTL"));
						infoMap.put("bii_docno", fileInfoMap.get("BII_DOCNO"));
						infoMap.put("bii_bzseqno", fileInfoMap.get("BII_BZSEQNO"));
						infoMap.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
						if (rpsnttype_chkId != null && rpsnttype_chkId.compareTo(file_ids[i]) == 0) {
							fileInfoMap.put("BII_RPSNTTYPE", "1");
						}
						infoMap.put("bii_rpsnttype", fileInfoMap.get("BII_RPSNTTYPE"));
						cmFileSvc.updateStFileInfo(infoMap);
					}
				} else if (bzcls1.compareTo("SY") == 0) {
					Map<String, Object> infoMap = new LinkedHashMap<String, Object>();
					infoMap.put("bii_imgtype", fileInfoMap.get("BII_IMGTYPE"));
					infoMap.put("bii_imgfilenm", fileInfoMap.get("BII_IMGFILENM"));
					infoMap.put("bii_imgfilettl", fileInfoMap.get("BII_IMGFILETTL"));
					infoMap.put("bii_docno", fileInfoMap.get("BII_DOCNO"));
					infoMap.put("bii_bzseqno", fileInfoMap.get("BII_BZSEQNO"));
					infoMap.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
					cmFileSvc.createSyImgList(infoMap);
				} else if (bzcls1.compareTo("SS") == 0) {
					Map<String, Object> infoMap = new LinkedHashMap<String, Object>();
					infoMap.put("bii_imgtype", fileInfoMap.get("BII_IMGTYPE"));
					infoMap.put("bii_imgfilenm", fileInfoMap.get("BII_IMGFILENM"));
					infoMap.put("bii_imgfilettl", fileInfoMap.get("BII_IMGFILETTL"));
					infoMap.put("bii_docno", fileInfoMap.get("BII_DOCNO"));
					infoMap.put("bii_bzseqno", fileInfoMap.get("BII_BZSEQNO"));
					infoMap.put(SessionParam.ss_userid, session.getAttribute(SessionParam.ss_userid));
					cmFileSvc.createSsImgList(infoMap);
				}
				
			}

			fileListMap.put("lstIndex", lstIndex);
			fileListMap.put("lstName", lstName);
			fileListMap.put("lstSize", lstSize);
			fileListMap.put("lstCtntTp", lstCtntTp);

		}
		
		json.put("fileMap", fileListMap);
		ret = json.toString();
		logger.info("ret : " + ret);
		return ret;
	}

}
