<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script>
<script src='/js/contents/Nwagon.js'></script>
<script src="/js/common/json2.js"></script>

<script>
	function selectAniPrevTotList(result, param){
	 	if(result!=null){
	//		console.log("selectAniRentTotList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#dayTot_tbody tr:first").attr('style',"display:");
			
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("dayTot_tbody");
				var iRow = (i*3)+1;
				$("#dayTot_tbody div#TXT_ANICODE_1_DIV").eq(iRow).html(data.TXT_ANICODE_1); 
				$("#dayTot_tbody div#GUBUN_DIV").eq(iRow).html("원수"); 
				$("#dayTot_tbody div#CNT_1_PREV_CLS_DIV").eq(iRow).html(data.CNT_1_CLS); 
				$("#dayTot_tbody div#CNT_1_PREV_ANI_DIV").eq(iRow).html(data.CNT_1_ANI); 
				$("#dayTot_tbody div#CNT_2_PREV_CLS_DIV").eq(iRow).html(data.CNT_2_CLS); 
				$("#dayTot_tbody div#CNT_2_PREV_ANI_DIV").eq(iRow).html(data.CNT_2_ANI); 
				$("#dayTot_tbody div#CNT_3_PREV_CLS_DIV").eq(iRow).html(data.CNT_3_CLS); 
				$("#dayTot_tbody div#CNT_3_PREV_ANI_DIV").eq(iRow).html(data.CNT_3_ANI); 
				$("#dayTot_tbody div#CNT_4_PREV_CLS_DIV").eq(iRow).html(data.CNT_4_CLS); 
				$("#dayTot_tbody div#CNT_4_PREV_ANI_DIV").eq(iRow).html(data.CNT_4_ANI); 
				$("#dayTot_tbody div#CNT_PREV_CLS_DIV").eq(iRow).html(data.CNT_CLS); 
				$("#dayTot_tbody div#CNT_PREV_ANI_DIV").eq(iRow).html(data.CNT_ANI); 
				
				fc_addRow("dayTot_tbody");
				iRow++;
				$("#dayTot_tbody div#TXT_ANICODE_1_DIV").eq(iRow).html(data.TXT_ANICODE_1); 
				$("#dayTot_tbody div#GUBUN_DIV").eq(iRow).html("보육"); 
				$("#dayTot_tbody div#CNT_1_PREV_CLS_DIV").eq(iRow).html(data.CNT_1_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_1_PREV_ANI_DIV").eq(iRow).html(data.CNT_1_BOYUK_ANI); 
				$("#dayTot_tbody div#CNT_2_PREV_CLS_DIV").eq(iRow).html(data.CNT_2_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_2_PREV_ANI_DIV").eq(iRow).html(data.CNT_2_BOYUK_ANI); 
				$("#dayTot_tbody div#CNT_3_PREV_CLS_DIV").eq(iRow).html(data.CNT_3_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_3_PREV_ANI_DIV").eq(iRow).html(data.CNT_3_BOYUK_ANI); 
				$("#dayTot_tbody div#CNT_4_PREV_CLS_DIV").eq(iRow).html(data.CNT_4_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_4_PREV_ANI_DIV").eq(iRow).html(data.CNT_4_BOYUK_ANI); 
				$("#dayTot_tbody div#CNT_PREV_CLS_DIV").eq(iRow).html(data.CNT_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_PREV_ANI_DIV").eq(iRow).html(data.CNT_BOYUK_ANI); 
				
				fc_addRow("dayTot_tbody");
				iRow++;
				$("#dayTot_tbody div#TXT_ANICODE_1_DIV").eq(iRow).html(data.TXT_ANICODE_1); 
				$("#dayTot_tbody div#GUBUN_DIV").eq(iRow).html("임대"); 
				$("#dayTot_tbody div#CNT_1_PREV_CLS_DIV").eq(iRow).html(data.CNT_1_RENT_CLS); 
				$("#dayTot_tbody div#CNT_1_PREV_ANI_DIV").eq(iRow).html(data.CNT_1_RENT_ANI); 
				$("#dayTot_tbody div#CNT_2_PREV_CLS_DIV").eq(iRow).html(data.CNT_2_RENT_CLS); 
				$("#dayTot_tbody div#CNT_2_PREV_ANI_DIV").eq(iRow).html(data.CNT_2_RENT_ANI); 
				$("#dayTot_tbody div#CNT_3_PREV_CLS_DIV").eq(iRow).html(data.CNT_3_RENT_CLS); 
				$("#dayTot_tbody div#CNT_3_PREV_ANI_DIV").eq(iRow).html(data.CNT_3_RENT_ANI); 
				$("#dayTot_tbody div#CNT_4_PREV_CLS_DIV").eq(iRow).html(data.CNT_4_RENT_CLS); 
				$("#dayTot_tbody div#CNT_4_PREV_ANI_DIV").eq(iRow).html(data.CNT_4_RENT_ANI); 
				$("#dayTot_tbody div#CNT_PREV_CLS_DIV").eq(iRow).html(data.CNT_RENT_CLS); 
				$("#dayTot_tbody div#CNT_PREV_ANI_DIV").eq(iRow).html(data.CNT_RENT_ANI); 
				
			}
			$("#dayTot_tbody tr:first").attr('style',"display:none");
			
			if(result.length > 0){
				fn_sta_selectAniDayTotList(param, selectAniDayTotList);
			}
	 	}
	
	}

	function selectAniDayTotList(result, param){
	 	if(result!=null){
	//		console.log("selectAniRentTotList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#dayTot_tbody tr:first").attr('style',"display:");
			
			for(var i=0; i<result.length; i++){
				var data = result[i];
				var iRow = (i*3)+1;
				$("#dayTot_tbody div#TXT_ANICODE_1_DIV").eq(iRow).html(data.TXT_ANICODE_1); 
				$("#dayTot_tbody div#GUBUN_DIV").eq(iRow).html("원수"); 
				$("#dayTot_tbody div#CNT_1_CLS_DIV").eq(iRow).html(data.CNT_1_CLS); 
				$("#dayTot_tbody div#CNT_1_ANI_DIV").eq(iRow).html(data.CNT_1_ANI); 
				$("#dayTot_tbody div#CNT_2_CLS_DIV").eq(iRow).html(data.CNT_2_CLS); 
				$("#dayTot_tbody div#CNT_2_ANI_DIV").eq(iRow).html(data.CNT_2_ANI); 
				$("#dayTot_tbody div#CNT_3_CLS_DIV").eq(iRow).html(data.CNT_3_CLS); 
				$("#dayTot_tbody div#CNT_3_ANI_DIV").eq(iRow).html(data.CNT_3_ANI); 
				$("#dayTot_tbody div#CNT_4_CLS_DIV").eq(iRow).html(data.CNT_4_CLS); 
				$("#dayTot_tbody div#CNT_4_ANI_DIV").eq(iRow).html(data.CNT_4_ANI); 
				$("#dayTot_tbody div#CNT_CLS_DIV").eq(iRow).html(data.CNT_CLS); 
				$("#dayTot_tbody div#CNT_ANI_DIV").eq(iRow).html(data.CNT_ANI); 
				
				iRow++;
				$("#dayTot_tbody div#TXT_ANICODE_1_DIV").eq(iRow).html(data.TXT_ANICODE_1); 
				$("#dayTot_tbody div#GUBUN_DIV").eq(iRow).html("보육"); 
				$("#dayTot_tbody div#CNT_1_CLS_DIV").eq(iRow).html(data.CNT_1_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_1_ANI_DIV").eq(iRow).html(data.CNT_1_BOYUK_ANI); 
				$("#dayTot_tbody div#CNT_2_CLS_DIV").eq(iRow).html(data.CNT_2_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_2_ANI_DIV").eq(iRow).html(data.CNT_2_BOYUK_ANI); 
				$("#dayTot_tbody div#CNT_3_CLS_DIV").eq(iRow).html(data.CNT_3_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_3_ANI_DIV").eq(iRow).html(data.CNT_3_BOYUK_ANI); 
				$("#dayTot_tbody div#CNT_4_CLS_DIV").eq(iRow).html(data.CNT_4_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_4_ANI_DIV").eq(iRow).html(data.CNT_4_BOYUK_ANI); 
				$("#dayTot_tbody div#CNT_CLS_DIV").eq(iRow).html(data.CNT_BOYUK_CLS); 
				$("#dayTot_tbody div#CNT_ANI_DIV").eq(iRow).html(data.CNT_BOYUK_ANI); 
				
				iRow++;
				$("#dayTot_tbody div#TXT_ANICODE_1_DIV").eq(iRow).html(data.TXT_ANICODE_1); 
				$("#dayTot_tbody div#GUBUN_DIV").eq(iRow).html("임대"); 
				$("#dayTot_tbody div#CNT_1_CLS_DIV").eq(iRow).html(data.CNT_1_RENT_CLS); 
				$("#dayTot_tbody div#CNT_1_ANI_DIV").eq(iRow).html(data.CNT_1_RENT_ANI); 
				$("#dayTot_tbody div#CNT_2_CLS_DIV").eq(iRow).html(data.CNT_2_RENT_CLS); 
				$("#dayTot_tbody div#CNT_2_ANI_DIV").eq(iRow).html(data.CNT_2_RENT_ANI); 
				$("#dayTot_tbody div#CNT_3_CLS_DIV").eq(iRow).html(data.CNT_3_RENT_CLS); 
				$("#dayTot_tbody div#CNT_3_ANI_DIV").eq(iRow).html(data.CNT_3_RENT_ANI); 
				$("#dayTot_tbody div#CNT_4_CLS_DIV").eq(iRow).html(data.CNT_4_RENT_CLS); 
				$("#dayTot_tbody div#CNT_4_ANI_DIV").eq(iRow).html(data.CNT_4_RENT_ANI); 
				$("#dayTot_tbody div#CNT_CLS_DIV").eq(iRow).html(data.CNT_RENT_CLS); 
				$("#dayTot_tbody div#CNT_ANI_DIV").eq(iRow).html(data.CNT_RENT_ANI); 
				
			}
			$("#dayTot_tbody tr:first").attr('style',"display:none");
			
			if(result.length > 0){
				fn_sta_selectTotAniJnlList(param, selectTotAniJnlList);
				fn_sta_selectAniJnlIList(param, selectAniJnlIList);
				fn_sta_selectAniJnlOList(param, selectAniJnlOList);
			}
	 	}
	
	}

	function selectTotAniJnlList(result){
	 	if(result!=null){
	//		console.log("selectAniRentTotList:" + JSON.stringify(result));
			console.log("selectTotAniJnlList result.length==>" + result.length);
			$("#tot_tfoot tr:first").attr('style',"display:");
			
			for(var i=0; i<result.length; i++){
				var data = result[i];

				if(i==0){ // 전일/전월/전년
					fc_addRow("tot_tfoot");
					var iRow = 1;
					$("#tot_tfoot div#GUBUN_DIV").eq(iRow).html("원수"); 
					$("#tot_tfoot div#CNT_1_PREV_CLS_DIV").eq(iRow).html(data.CNT_1_CLS); 
					$("#tot_tfoot div#CNT_1_PREV_ANI_DIV").eq(iRow).html(data.CNT_1_ANI); 
					$("#tot_tfoot div#CNT_2_PREV_CLS_DIV").eq(iRow).html(data.CNT_2_CLS); 
					$("#tot_tfoot div#CNT_2_PREV_ANI_DIV").eq(iRow).html(data.CNT_2_ANI); 
					$("#tot_tfoot div#CNT_3_PREV_CLS_DIV").eq(iRow).html(data.CNT_3_CLS); 
					$("#tot_tfoot div#CNT_3_PREV_ANI_DIV").eq(iRow).html(data.CNT_3_ANI); 
					$("#tot_tfoot div#CNT_4_PREV_CLS_DIV").eq(iRow).html(data.CNT_4_CLS); 
					$("#tot_tfoot div#CNT_4_PREV_ANI_DIV").eq(iRow).html(data.CNT_4_ANI); 
					$("#tot_tfoot div#CNT_PREV_CLS_DIV").eq(iRow).html(data.CNT_CLS); 
					$("#tot_tfoot div#CNT_PREV_ANI_DIV").eq(iRow).html(data.CNT_ANI); 
					
					fc_addRow("tot_tfoot");
					iRow++;
					$("#tot_tfoot div#GUBUN_DIV").eq(iRow).html("보육"); 
					$("#tot_tfoot div#CNT_1_PREV_CLS_DIV").eq(iRow).html(data.CNT_1_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_1_PREV_ANI_DIV").eq(iRow).html(data.CNT_1_BOYUK_ANI); 
					$("#tot_tfoot div#CNT_2_PREV_CLS_DIV").eq(iRow).html(data.CNT_2_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_2_PREV_ANI_DIV").eq(iRow).html(data.CNT_2_BOYUK_ANI); 
					$("#tot_tfoot div#CNT_3_PREV_CLS_DIV").eq(iRow).html(data.CNT_3_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_3_PREV_ANI_DIV").eq(iRow).html(data.CNT_3_BOYUK_ANI); 
					$("#tot_tfoot div#CNT_4_PREV_CLS_DIV").eq(iRow).html(data.CNT_4_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_4_PREV_ANI_DIV").eq(iRow).html(data.CNT_4_BOYUK_ANI); 
					$("#tot_tfoot div#CNT_PREV_CLS_DIV").eq(iRow).html(data.CNT_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_PREV_ANI_DIV").eq(iRow).html(data.CNT_BOYUK_ANI); 
					
					fc_addRow("tot_tfoot");
					iRow++;
					$("#tot_tfoot div#GUBUN_DIV").eq(iRow).html("임대"); 
					$("#tot_tfoot div#CNT_1_PREV_CLS_DIV").eq(iRow).html(data.CNT_1_RENT_CLS); 
					$("#tot_tfoot div#CNT_1_PREV_ANI_DIV").eq(iRow).html(data.CNT_1_RENT_ANI); 
					$("#tot_tfoot div#CNT_2_PREV_CLS_DIV").eq(iRow).html(data.CNT_2_RENT_CLS); 
					$("#tot_tfoot div#CNT_2_PREV_ANI_DIV").eq(iRow).html(data.CNT_2_RENT_ANI); 
					$("#tot_tfoot div#CNT_3_PREV_CLS_DIV").eq(iRow).html(data.CNT_3_RENT_CLS); 
					$("#tot_tfoot div#CNT_3_PREV_ANI_DIV").eq(iRow).html(data.CNT_3_RENT_ANI); 
					$("#tot_tfoot div#CNT_4_PREV_CLS_DIV").eq(iRow).html(data.CNT_4_RENT_CLS); 
					$("#tot_tfoot div#CNT_4_PREV_ANI_DIV").eq(iRow).html(data.CNT_4_RENT_ANI); 
					$("#tot_tfoot div#CNT_PREV_CLS_DIV").eq(iRow).html(data.CNT_RENT_CLS); 
					$("#tot_tfoot div#CNT_PREV_ANI_DIV").eq(iRow).html(data.CNT_RENT_ANI); 
				}else if(i==1){ // 당일
					var iRow = 1;
					//$("#tot_tfoot div#GUBUN_DIV").eq(iRow).html("원수"); 
					$("#tot_tfoot div#CNT_1_CLS_DIV").eq(iRow).html(data.CNT_1_CLS); 
					$("#tot_tfoot div#CNT_1_ANI_DIV").eq(iRow).html(data.CNT_1_ANI); 
					$("#tot_tfoot div#CNT_2_CLS_DIV").eq(iRow).html(data.CNT_2_CLS); 
					$("#tot_tfoot div#CNT_2_ANI_DIV").eq(iRow).html(data.CNT_2_ANI); 
					$("#tot_tfoot div#CNT_3_CLS_DIV").eq(iRow).html(data.CNT_3_CLS); 
					$("#tot_tfoot div#CNT_3_ANI_DIV").eq(iRow).html(data.CNT_3_ANI); 
					$("#tot_tfoot div#CNT_4_CLS_DIV").eq(iRow).html(data.CNT_4_CLS); 
					$("#tot_tfoot div#CNT_4_ANI_DIV").eq(iRow).html(data.CNT_4_ANI); 
					$("#tot_tfoot div#CNT_CLS_DIV").eq(iRow).html(data.CNT_CLS); 
					$("#tot_tfoot div#CNT_ANI_DIV").eq(iRow).html(data.CNT_ANI); 
					
					iRow++;
					//$("#tot_tfoot div#GUBUN_DIV").eq(iRow).html("보육"); 
					$("#tot_tfoot div#CNT_1_CLS_DIV").eq(iRow).html(data.CNT_1_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_1_ANI_DIV").eq(iRow).html(data.CNT_1_BOYUK_ANI);
					$("#tot_tfoot div#CNT_2_CLS_DIV").eq(iRow).html(data.CNT_2_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_2_ANI_DIV").eq(iRow).html(data.CNT_2_BOYUK_ANI);
					$("#tot_tfoot div#CNT_3_CLS_DIV").eq(iRow).html(data.CNT_3_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_3_ANI_DIV").eq(iRow).html(data.CNT_3_BOYUK_ANI);
					$("#tot_tfoot div#CNT_4_CLS_DIV").eq(iRow).html(data.CNT_4_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_4_ANI_DIV").eq(iRow).html(data.CNT_4_BOYUK_ANI);
					$("#tot_tfoot div#CNT_CLS_DIV").eq(iRow).html(data.CNT_BOYUK_CLS); 
					$("#tot_tfoot div#CNT_ANI_DIV").eq(iRow).html(data.CNT_BOYUK_ANI); 
					
					iRow++;
					//$("#tot_tfoot div#GUBUN_DIV").eq(iRow).html("임대"); 
					$("#tot_tfoot div#CNT_1_CLS_DIV").eq(iRow).html(data.CNT_1_RENT_CLS); 
					$("#tot_tfoot div#CNT_1_ANI_DIV").eq(iRow).html(data.CNT_1_RENT_ANI);
					$("#tot_tfoot div#CNT_2_CLS_DIV").eq(iRow).html(data.CNT_2_RENT_CLS); 
					$("#tot_tfoot div#CNT_2_ANI_DIV").eq(iRow).html(data.CNT_2_RENT_ANI);
					$("#tot_tfoot div#CNT_3_CLS_DIV").eq(iRow).html(data.CNT_3_RENT_CLS); 
					$("#tot_tfoot div#CNT_3_ANI_DIV").eq(iRow).html(data.CNT_3_RENT_ANI);
					$("#tot_tfoot div#CNT_4_CLS_DIV").eq(iRow).html(data.CNT_4_RENT_CLS); 
					$("#tot_tfoot div#CNT_4_ANI_DIV").eq(iRow).html(data.CNT_4_RENT_ANI);
					$("#tot_tfoot div#CNT_CLS_DIV").eq(iRow).html(data.CNT_RENT_CLS); 
					$("#tot_tfoot div#CNT_ANI_DIV").eq(iRow).html(data.CNT_RENT_ANI); 
				}
			}
			$("#tot_tfoot tr:first").attr('style',"display:none");
	 	}
	
	}

	function selectAniJnlOList(result){
		console.log("****selectAniJnlOList");
	 	if(result!=null){
//			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#ioO_tbody tr:first").attr('style',"display:");
			
			var prev_MAC_ANICODE1;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				if((i > 0 && data.MAC_ANICODE1!=prev_MAC_ANICODE1)){	
					$("#totIoO_tbody tr").each(function(i_tot){
						if(i_tot > 0 && prev_MAC_ANICODE1==$(this).find("div#tot_MAC_ANICODE1_DIV").attr('data-val')){
//							alert(prev_MAC_ANICODE1);
							console.log("tot_MAC_ANICODE1_DIV==>" + $(this).find("div#tot_MAC_ANICODE1_DIV").attr('data-val'));
							$("#ioO_tbody").append($(this));
						}
					});
				}
				prev_MAC_ANICODE1 = data.MAC_ANICODE1;

				fc_addRow("ioO_tbody");
				
				var iRow = (i+1);
				$("#ioO_tbody div#IO_O_INDEX_DIV").eq(iRow).html(iRow); 
				$("#ioO_tbody div#IO_O_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				
				$("#ioO_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#ioO_tbody div#TXT_ANICODE_1_DIV").eq(iRow).html(data.TXT_ANICODE_1); 
				$("#ioO_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#ioO_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#ioO_tbody div#TXT_MAI_SEX_DIV").eq(iRow).html(data.TXT_MAI_SEX); 
				$("#ioO_tbody div#TXT_DAIO_RESN_DIV").eq(iRow).html(data.TXT_DAIO_RESN); 
			}
			$("#ioO_tbody").append($("#totIoO_tbody tr:last"));
			$("#ioO_tbody tr:first").attr('style',"display:none");
	 	}
	}
	function selectAniJnlIList(result){
	 	if(result!=null){
//			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#ioI_tbody tr:first").attr('style',"display:");
			
			var prev_MAC_ANICODE1;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				if((i > 0 && data.MAC_ANICODE1!=prev_MAC_ANICODE1)){	
					$("#totIoI_tbody tr").each(function(i_tot){
						if(i_tot > 0 && prev_MAC_ANICODE1==$(this).find("div#tot_MAC_ANICODE1_DIV").attr('data-val')){
//							alert(prev_MAC_ANICODE1);
							console.log("tot_MAC_ANICODE1_DIV==>" + $(this).find("div#tot_MAC_ANICODE1_DIV").attr('data-val'));
							$("#ioI_tbody").append($(this));
						}
					});
				}
				prev_MAC_ANICODE1 = data.MAC_ANICODE1;
				
				fc_addRow("ioI_tbody");
				
				var iRow = (i+1);
				
				$("#ioI_tbody div#IO_I_INDEX_DIV").eq(iRow).html(iRow); 
				$("#ioI_tbody div#IO_I_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				
				$("#ioI_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#ioI_tbody div#TXT_ANICODE_1_DIV").eq(iRow).html(data.TXT_ANICODE_1); 
				$("#ioI_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#ioI_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#ioI_tbody div#TXT_MAI_SEX_DIV").eq(iRow).html(data.TXT_MAI_SEX); 
				$("#ioI_tbody div#TXT_DAIO_RESN_DIV").eq(iRow).html(data.TXT_DAIO_RESN); 
				
			}
			$("#ioI_tbody").append($("#totIoI_tbody tr:last"));
			$("#ioI_tbody tr:first").attr('style',"display:none");
	 	}
	}
	function fn_sta_selectAniJnlOList(param, callback, retObj) {
		fc_clearRow("ioO_tbody");

		var targetUrl = "/stat/0610/selectAniJnlOList.do";
		
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	function fn_sta_selectAniJnlIList(param, callback, retObj) {
		fc_clearRow("ioI_tbody");

		var targetUrl = "/stat/0610/selectAniJnlIList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniPrevTotList(param, callback, retObj) {
		fc_clearRow("dayTot_tbody");

		var targetUrl = "/stat/0610/selectAniPrevTotList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result, param);
			}
		});
	}

	function fn_sta_selectAniDayTotList(param, callback, retObj) {
//		fc_clearRow("dayTot_tbody");

		var targetUrl = "/stat/0610/selectAniDayTotList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result, param);
			}
		});
	}

	function fn_sta_selectTotAniJnlList(param, callback, retObj) {
		fc_clearRow("tot_tfoot");

		var targetUrl = "/stat/0610/selectTotAniJnlList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniClsKnjpInfo(param, callback, retObj) {

		var targetUrl = "/stat/0610/selectAniClsKnjpInfo.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
			var data = result;
//			console.log("test:" + JSON.stringify(result));
			$("#txtSchDate").val(result.TXT_SCH_DATE);
			$("#cntKnjp").val(result.CNT_ANICLS_KNJP);

		});
	}

	function fn_sta_selectAniJnlSta(){
		fc_clearRow("ioI_tbody");
		fc_clearRow("ioO_tbody");
		var param = {
				sch_type : $('#sch_tbody input:radio[name=sch_type]:checked').val(),
				cal_1 : $("#sch_tbody #cal_1").val()
		};
		$("#sch_day_tr").attr('style',"display:none;");
		$("#sch_month_tr").attr('style',"display:none;");
		$("#sch_year_tr").attr('style',"display:none;");
		if(param.sch_type=="D"){
			$("#sch_day_tr").attr('style',"display:;");
		}else if(param.sch_type=="M"){
			$("#sch_month_tr").attr('style',"display:;");
		}else if(param.sch_type=="Y"){
			$("#sch_year_tr").attr('style',"display:;");
		}
		fn_sta_selectAniClsKnjpInfo(param);
		
		fn_sta_selectAniPrevTotList(param, selectAniPrevTotList);
	}

	$(document).ready(function() {
		fc_clearRow("ioI_tbody");
		fc_clearRow("ioO_tbody");
		$("#sch_day_tr").attr('style',"display:;");
	});
	
</script>


<title>현황/통계 &gt; 동물월보</title>
</head>
<body>
<div id="sub_wrap">

	<jsp:include page="/header.do"></jsp:include>
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<div id="lnb_area">
			<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">동물월보</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 동물월보</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 동물월보 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>동물월보 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label></p></td>
								</tr>
								<tr>
									<th scope="row">종류</th>
									<td>
										<p>
										  <label><input type="radio" id="sch_type" name="sch_type" value="D" class="search_radio type1" checked/>일보</label>
										  <label><input type="radio" id="sch_type" name="sch_type" value="M" class="search_radio"/>월보</label>
										  <label><input type="radio" id="sch_type" name="sch_type" value="Y" class="search_radio"/>연보</label>
										</p>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniJnlSta();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //동물월보 조회 -->

					<!-- [동물일보] -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">[동물일보] <input type=text id="txtSchDate" name="txtSchDate" value="" style="background: transparent; border: 0;width:120px;text-align: right;" readOnly></span>
							<div class="sys_btn_box">
								<span class="align_right table_title_text">군집관리종(<input type=text id="cntKnjp" name="cntKnjp" value="" style="background: transparent; border: 0;width:33px;text-align: right;" readOnly>종) &nbsp; &nbsp;<a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>동물일보</caption>
							<colgroup>
								<col style="width:13%;">
								<col style="width:7%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:4%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="colgroup" colspan="2">구분</th>
									<th scope="colgroup" colspan="4">동물기획과</th>
									<th scope="colgroup" colspan="4">동물복지 1과</th>
									<th scope="colgroup" colspan="4">동물복지 2과</th>
									<th scope="colgroup" colspan="4">종보전연구실</th>
									<th scope="colgroup" colspan="4">합계</th>
								</tr>
								<tr id="sch_day_tr" style="display:none">
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">구분</th>
									<th scope="colgroup" colspan="2">전일</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전일</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전일</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전일</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전일</th>
									<th scope="colgroup" colspan="2">당일</th>
								</tr>
								<tr id="sch_month_tr" style="display:none">
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">구분</th>
									<th scope="colgroup" colspan="2">전월</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전월</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전월</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전월</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전월</th>
									<th scope="colgroup" colspan="2">당일</th>
								</tr>
								<tr id="sch_year_tr" style="display:none">
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">구분</th>
									<th scope="colgroup" colspan="2">전년</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전년</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전년</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전년</th>
									<th scope="colgroup" colspan="2">당일</th>
									<th scope="colgroup" colspan="2">전년</th>
									<th scope="colgroup" colspan="2">당일</th>
								</tr>
								<tr>
									<th scope="col">종</th>
									<th scope="col">수</th>
									<th scope="col">종</th>
									<th scope="col">수</th>
									<th scope="col">종</th>
									<th scope="col">수</th>
									<th scope="col">종</th>
									<th scope="col">수</th>
									<th scope="col">종</th>
									<th scope="col">수</th>
									<th scope="col">종</th>
									<th scope="col">수</th>
									<th scope="col">종</th>
									<th scope="col">수</th>
									<th scope="col">종</th>
									<th scope="col">수</th>
									<th scope="col">종</th>
									<th scope="col">수</th>
									<th scope="col">종</th>
									<th scope="col">수</th>
								</tr>
							</thead>
							<tbody id="dayTot_tbody">
								<tr style="display:none">
									<th scope="row" style="vertical-align:middle;"><div id="TXT_ANICODE_1_DIV" data-val=''></div></th>
									<td><div id="GUBUN_DIV" data-val=''></div></td>
									<td><div id="CNT_1_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_1_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_1_CLS_DIV" data-val=''></div></td><td><div id="CNT_1_ANI_DIV" data-val=''></div></td>
									<td><div id="CNT_2_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_2_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_2_CLS_DIV" data-val=''></div></td><td><div id="CNT_2_ANI_DIV" data-val=''></div></td>
									<td><div id="CNT_3_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_3_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_3_CLS_DIV" data-val=''></div></td><td><div id="CNT_3_ANI_DIV" data-val=''></div></td>
									<td><div id="CNT_4_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_4_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_4_CLS_DIV" data-val=''></div></td><td><div id="CNT_4_ANI_DIV" data-val=''></div></td>
									<td><div id="CNT_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_CLS_DIV" data-val=''></div></td><td><div id="CNT_ANI_DIV" data-val=''></div></td>
								</tr>
							</tbody>
							<tfoot id="tot_tfoot">
								<tr style="display:">
									<th scope="row" style="vertical-align:middle;">합계</th>
									<td><div id="GUBUN_DIV" data-val=''></div></td>
									<td><div id="CNT_1_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_1_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_1_CLS_DIV" data-val=''></div></td><td><div id="CNT_1_ANI_DIV" data-val=''></div></td>
									<td><div id="CNT_2_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_2_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_2_CLS_DIV" data-val=''></div></td><td><div id="CNT_2_ANI_DIV" data-val=''></div></td>
									<td><div id="CNT_3_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_3_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_3_CLS_DIV" data-val=''></div></td><td><div id="CNT_3_ANI_DIV" data-val=''></div></td>
									<td><div id="CNT_4_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_4_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_4_CLS_DIV" data-val=''></div></td><td><div id="CNT_4_ANI_DIV" data-val=''></div></td>
									<td><div id="CNT_PREV_CLS_DIV" data-val=''></div></td><td><div id="CNT_PREV_ANI_DIV" data-val=''></div></td><td><div id="CNT_CLS_DIV" data-val=''></div></td><td><div id="CNT_ANI_DIV" data-val=''></div></td>
								</tr>
							</tfoot>
						</table>

						
					</div>
					
  					<!-- //[동물일보] -->

					<!-- 증가동물 -->
					<div class="aniinfo_add_box">
						<span class="table_title" style="display:block;margin-bottom:8px;">증가동물</span>			
						<table class="aniinfo_add table_view" >
							<caption>증가동물</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
								
								
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">부서명</th>
									<th scope="col">분류명</th>
									<th scope="col">동물명</th>
									<th scope="col">동물번호</th>
									<th scope="col">성별</th>
									<th scope="col">증감사유</th>
								</tr>
							</thead>
							<tbody id="ioI_tbody">
								<tr style="display:none">
									<th scope="row"><div id="IO_I_INDEX_DIV" data-val=''></div></th>
									<td><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td><div id="TXT_ANICODE_1_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_SEX_DIV" data-val=''></div></td>
									<td><div id="TXT_DAIO_RESN_DIV" data-val=''></div></td>									
								</tr>
							
						</table>
					</div>
					<!-- //증가동물 -->

					<!-- 감소동물 -->
					<div class="aniinfo_add_box">
						<span class="table_title" style="display:block;margin-bottom:8px;">감소동물</span>			
						<table class="aniinfo_add table_view" >
							<caption>감소동물</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
								
								
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">부서명</th>
									<th scope="col">분류명</th>
									<th scope="col">동물명</th>
									<th scope="col">동물번호</th>
									<th scope="col">성별</th>
									<th scope="col">증감사유</th>
								</tr>
							</thead>
							<tbody id="ioO_tbody">
								<tr style="display:none;">
									<th scope="row"><div id="IO_O_INDEX_DIV" data-val=''></div></th>
									<td><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td><div id="TXT_ANICODE_1_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_SEX_DIV" data-val=''></div></td>
									<td><div id="TXT_DAIO_RESN_DIV" data-val=''></div></td>									
								</tr>
							
						</table>
					</div>
					<!-- //감소동물 -->

				
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
	</div>
	<!-- //container -->	
 	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->

</div>
</body>

					

</html>
