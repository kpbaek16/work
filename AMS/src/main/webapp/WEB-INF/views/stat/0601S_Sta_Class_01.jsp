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
	function selectClsList(result, param){
	 	if(result!=null){
	//		console.log("selectClsList:" + JSON.stringify(result));
			console.log("selectClsList result.length==>" + result.length);
			
			$("#cls_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				$("div#ANIINFO_DIV div#MAC_NAME1_DIV").html(data.MAC_NAME1);
				if(i!=0){
					$("div#ANILIST_DIV").append($("div#ANIINFO_DIV").html());
				}
			}
			$("#cls_tbody tr:first").attr('style',"display:none");
	 	}
		if(result.length > 0){
			$("div#CLS_DIV").attr('style',"display:");
			fn_sta_selectTotClsList(param, selectTotClsList);
		}else{
			$("div#CLS_DIV").attr('style',"display:none");
		}
	}

	function selectTotClsList(result, param){
	 	if(result!=null){
//			console.log("selectTotClsList:" + JSON.stringify(result));
			console.log("selectTotClsList result.length==>" + result.length);
			
			if(result.length > 0){
				$("#totCls_tbody").attr('style',"display:");
				var data = result[0];

				$("#totCls_tbody div#CNT_ANICLS_1_DIV").eq(0).html(data.CNT_ANICLS_1 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_1_DIV").eq(0).html(data.CNT_ANI_1); 
				$("#totCls_tbody div#CNT_ANICLS_2_DIV").eq(0).html(data.CNT_ANICLS_2 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_2_DIV").eq(0).html(data.CNT_ANI_2); 
				$("#totCls_tbody div#CNT_ANICLS_3_DIV").eq(0).html(data.CNT_ANICLS_3 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_3_DIV").eq(0).html(data.CNT_ANI_3); 
				
				$("#totCls_tbody div#CNT_BOYUK_1_DIV").eq(0).html(data.CNT_BOYUK_1); 
				$("#totCls_tbody div#CNT_ANI_BOYUK_1_DIV").eq(0).html(data.CNT_ANI_BOYUK_1); 
				$("#totCls_tbody div#CNT_BOYUK_2_DIV").eq(0).html(data.CNT_BOYUK_2); 
				$("#totCls_tbody div#CNT_ANI_BOYUK_2_DIV").eq(0).html(data.CNT_ANI_BOYUK_2); 
				$("#totCls_tbody div#CNT_BOYUK_3_DIV").eq(0).html(data.CNT_BOYUK_3); 
				$("#totCls_tbody div#CNT_ANI_BOYUK_3_DIV").eq(0).html(data.CNT_ANI_BOYUK_3); 
				
				$("#totCls_tbody div#CNT_NATMON_1_DIV").eq(0).html(data.CNT_NATMON_1 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_NATMON_1_DIV").eq(0).html(data.CNT_ANI_NATMON_1); 
				$("#totCls_tbody div#CNT_NATMON_2_DIV").eq(0).html(data.CNT_NATMON_2 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_NATMON_2_DIV").eq(0).html(data.CNT_ANI_NATMON_2); 
				$("#totCls_tbody div#CNT_NATMON_3_DIV").eq(0).html(data.CNT_NATMON_3 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_NATMON_3_DIV").eq(0).html(data.CNT_ANI_NATMON_3); 
				
				$("#totCls_tbody div#CNT_CITES_1_DIV").eq(0).html(data.CNT_CITES_1 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_CITES_1_DIV").eq(0).html(data.CNT_ANI_CITES_1); 
				$("#totCls_tbody div#CNT_CITES_2_DIV").eq(0).html(data.CNT_CITES_2 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_CITES_2_DIV").eq(0).html(data.CNT_ANI_CITES_2); 
				$("#totCls_tbody div#CNT_CITES_3_DIV").eq(0).html(data.CNT_CITES_3 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_CITES_3_DIV").eq(0).html(data.CNT_ANI_CITES_3); 
				
				$("#totCls_tbody div#CNT_ENDANG_1_DIV").eq(0).html(data.CNT_ENDANG_1 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_ENDANG_1_DIV").eq(0).html(data.CNT_ANI_ENDANG_1); 
				$("#totCls_tbody div#CNT_ENDANG_2_DIV").eq(0).html(data.CNT_ENDANG_2 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_ENDANG_2_DIV").eq(0).html(data.CNT_ANI_ENDANG_2); 
				$("#totCls_tbody div#CNT_ENDANG_3_DIV").eq(0).html(data.CNT_ENDANG_3 + " 종"); 
				$("#totCls_tbody div#CNT_ANI_ENDANG_3_DIV").eq(0).html(data.CNT_ANI_ENDANG_3); 
				
				fn_sta_selectTotAniClsList(param, selectTotAniClsList);
			}else{
				$("#totCls_tbody").attr('style',"display:none");
			}			
	 	}
	}

	function selectTotAniClsList(result, param){
	 	if(result!=null){
//			console.log("selectTotAniClsList:" + JSON.stringify(result));
			console.log("selectTotAniClsList result.length==>" + result.length);
			
			$("#totAniCls_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("totAniCls_tbody");
				
				var iRow = (i+1);
				$("#totAniCls_tbody div#MAC_NAME1_DIV").eq(iRow).html(data.MAC_NAME1); 
				$("#totAniCls_tbody div#CNT_ANICLS_1_DIV").eq(iRow).html(data.CNT_ANICLS_1 + "종"); 
				$("#totAniCls_tbody div#CNT_ANI_1_DIV").eq(iRow).html(data.CNT_ANI_1); 
				$("#totAniCls_tbody div#CNT_ANICLS_2_DIV").eq(iRow).html(data.CNT_ANICLS_2 + "종"); 
				$("#totAniCls_tbody div#CNT_ANI_2_DIV").eq(iRow).html(data.CNT_ANI_2); 
				$("#totAniCls_tbody div#CNT_ANICLS_3_DIV").eq(iRow).html(data.CNT_ANICLS_3 + "종"); 
				$("#totAniCls_tbody div#CNT_ANI_3_DIV").eq(iRow).html(data.CNT_ANI_3); 
			}
			$("#totAniCls_tbody tr:first").attr('style',"display:none");
			
			if(result.length > 0){

				$("div#CLS_DIV").each(function(i_tot){
					var i_totRow = (i_tot+1);
					$(this).find("#ani_tot_tbody tr").remove();
					$(this).find("#ani_tot_tbody").append($("#totAniCls_tbody tr").eq(i_totRow).clone());
				});
				fn_sta_selectAniClsList(param, selectAniClsList);
			}			
	 	}
	}

	function selectAniClsList(result, param){
	 	if(result!=null){
//			console.log("selectAniClsList:" + JSON.stringify(result));
			console.log("selectAniClsList result.length==>" + result.length);
			$("#aniCls_tbody tr:first").attr('style',"display:");
			
			for(var i=0; i<result.length; i++){
				var data = result[i];
				
				fc_addRow("aniCls_tbody");
	
				var iRow = (i+1);
				$("#aniCls_tbody div#ANICLS_INDEX_DIV").eq(iRow).attr('data-val',iRow); 
				$("#aniCls_tbody div#ANI1_ROW_DIV").eq(iRow).attr('data-val',data.ANI1_ROW); 
				$("#aniCls_tbody div#ANI2_ROW_DIV").eq(iRow).attr('data-val',data.ANI2_ROW); 
				$("#aniCls_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#aniCls_tbody div#MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#aniCls_tbody div#MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#aniCls_tbody div#MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#aniCls_tbody div#CNT_MAI_SEX_DIV").eq(iRow).html(data.CNT_MAI_SEX); 
				$("#aniCls_tbody div#CNT_BOYUK_DIV").eq(iRow).html(data.CNT_BOYUK); 
				
				$("#aniCls_tbody div#MAC_ENAME_DIV").eq(iRow).html(data.MAC_ENAME); 
				$("#aniCls_tbody div#MAC_SNAME_DIV").eq(iRow).html(data.MAC_SNAME); 
				$("#aniCls_tbody div#MAC_NATMON_DIV").eq(iRow).html(data.MAC_NATMON); 
				$("#aniCls_tbody div#TXT_MAC_CITES_DIV").eq(iRow).html(data.TXT_MAC_CITES); 
				$("#aniCls_tbody div#TXT_MAC_RANK_DIV").eq(iRow).html(data.TXT_MAC_RANK); 
				$("#aniCls_tbody div#TXT_MAC_ENDANG_DIV").eq(iRow).html(data.TXT_MAC_ENDANG); 
	
			}
			
			$("#aniCls_tbody tr:first").attr('style',"display:none");
//			$("#aniCls_tbody").append($("#tot_tbody tr:last"));
			
			if(result.length > 0){
				fn_sta_selectAniClsTotList(param, selectAniClsTotList);
			}			
	 	}
	}
	
	function selectAniClsTotList(result, param){
	 	if(result!=null){
	//		console.log("selectAniClsTotList:" + JSON.stringify(result));
			console.log("selectAniClsTotList result.length==>" + result.length);
			
			$("#aniClsTot_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("aniClsTot_thead");
				fc_addRow("aniClsTot_tbody");
				var iRow = (i+1);
//				$("#aniClsTot_thead div#CLS1_INDEX_DIV").eq(iRow).attr('data-val', data.ANI1_ROW); 
				$("#aniClsTot_thead div#MAC_NAME2_DIV").eq(iRow).html(data.MAC_NAME2); 
				
				$("#aniClsTot_tbody div#CNT_MAC_ANICLSCODE").eq(iRow).html(data.CNT_MAC_ANICLSCODE + "종"); 
				$("#aniClsTot_tbody div#CNT_MAI_SEX_DIV").eq(iRow).html(data.CNT_MAI_SEX); 

				$("#aniClsTot_tbody div#CNT_MAC_NATMON_DIV").eq(iRow).html(data.CNT_MAC_NATMON); 
				$("#aniClsTot_tbody div#CNT_MAC_CITES_DIV").eq(iRow).html(data.CNT_MAC_CITES); 
				$("#aniClsTot_tbody div#CNT_MAC_RANK_DIV").eq(iRow).html(data.CNT_MAC_RANK); 
				$("#aniClsTot_tbody div#CNT_MAC_ENDANG_DIV").eq(iRow).html(data.CNT_MAC_ENDANG); 
	
				$("#aniClsTot_tbody div#CNT_ANI_MAC_NATMON_DIV").eq(iRow).html(data.CNT_ANI_MAC_NATMON); 
				$("#aniClsTot_tbody div#CNT_ANI_MAC_CITES_DIV").eq(iRow).html(data.CNT_ANI_MAC_CITES); 
				$("#aniClsTot_tbody div#CNT_ANI_MAC_RANK_DIV").eq(iRow).html(data.CNT_ANI_MAC_RANK); 
				$("#aniClsTot_tbody div#CNT_ANI_MAC_ENDANG_DIV").eq(iRow).html(data.CNT_ANI_MAC_ENDANG); 
	
				$("div#CLS_DIV").eq(data.ANI1_ROW-1).find("#ani_list_tbody").append($("#aniClsTot_thead tr").eq(iRow).clone());
				$("#aniCls_tbody tr").each(function(i_tot){
					var ani1_row = $(this).find("div#ANI1_ROW_DIV").attr('data-val');
					var ani2_row = $(this).find("div#ANI2_ROW_DIV").attr('data-val');
					if(ani1_row==data.ANI1_ROW && ani2_row==data.ANI2_ROW){
						$("div#CLS_DIV").eq(data.ANI1_ROW-1).find("#ani_list_tbody").append($(this).clone());
					}
				});
				$("div#CLS_DIV").eq(data.ANI1_ROW-1).find("#ani_list_tbody").append($("#aniClsTot_tbody tr").eq(iRow).clone());
			}
			$("#aniClsTot_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	
	function fn_sta_selectAniClsList(param, callback, retObj) {
		console.log("****fn_sta_selectAniClsList");
	
		fc_clearRow("aniCls_tbody");
		
		var targetUrl = "/stat/0601/selectAniClsList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result, param);
			}
		});
	}
	
	function fn_sta_selectAniClsTotList(param, callback, retObj) {
		fc_clearRow("aniClsTot_tbody");
		var targetUrl = "/stat/0601/selectAniClsTotList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result, param);
			}
		});
	}
	
	function fn_sta_selectClsList(param, callback, retObj) {
		fc_clearRow("cls_tbody");
	
		var targetUrl = "/stat/0601/selectClsList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result, param);
			}
		});
	}
	
	function fn_sta_selectTotAniClsList(param, callback, retObj) {
		fc_clearRow("totAniCls_tbody");
	
		var targetUrl = "/stat/0601/selectTotAniClsList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result, param);
			}
		});
	}
	
	function fn_sta_selectTotClsList(param, callback, retObj) {
//		fc_clearRow("totCls_tbody");
	
		var targetUrl = "/stat/0601/selectTotClsList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result, param);
			}
		});
	}
	
	function fn_sta_selectAniClsSta(){
		$("div#ANILIST_DIV").html("");
		$("div#ANIINFO_DIV #ani_list_tbody tr").each(function(index){
			$(this).remove();
		});
	
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val(),
				sch_anicode1 : $("#sch_tbody #sch_anicode1").val()
		};
		fn_sta_selectClsList(param, selectClsList);
//		fn_sta_selectTotClsList(param, selectTotClsList);
//		fn_sta_selectTotAniClsList(param, selectTotAniClsList);
//		fn_sta_selectAniClsTotList(param, selectAniClsTotList);
//		fn_sta_selectAniClsList(param, selectAniClsList);
	}

	$(document).ready(function() {
		getComboMajorAniCls1("#sch_tbody #sch_anicode1");
//		fn_sta_selectAniClsSta();
	});
	
</script>

<title>현황/통계 &gt; 분류군별현황</title>
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
                    <p class="contents_title">분류군별현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 분류군별현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류군별현황 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>분류군별현황 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">기간</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~ <input type="text" class="calendar1" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>
								</tr>
								<tr>
									<th scope="row">강정보</th>
									<td>
										<div class="select_box">			
											<select id="sch_anicode1" name="sch_anicode1">
											<option value="">전체</option>
											</select>
										</div>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniClsSta();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //분류군별현황 조회 -->
					
					<div class="aniinfo_add_box" style="display:none;">
							<div class="table_title_box">
								<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a><div id="MAC_NAME1_DIV" data-val=''></div></span>
								<div class="sys_btn_box">
									<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div>
							</div>
							<table class="aniinfo_add table_view table_td_margin" >
								<caption>양서강</caption>
								<colgroup>
									<col style="width:11%;">
									<col style="width:12%;">
									<col style="width:12%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2" style="vertical-align:middle;">동물명</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">영명</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">학명</th>
										<th scope="colgroup" colspan="4">동물수</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">보육</th>
										<th scope="colgroup" colspan="2">천연기념물</th>
										<th scope="colgroup" colspan="2">CITES</th>
										<th scope="colgroup" colspan="2">갑을병</th>
										<th scope="colgroup" colspan="2">멸종위기</th>
									</tr>
									<tr>
										<th scope="col">수</th>
										<th scope="col">암</th>
										<th scope="col">미상</th>
										<th scope="col">합계</th>
										<th scope="col">호</th>
										<th scope="col">두수</th>
										<th scope="col">종별</th>
										<th scope="col">두수</th>
										<th scope="col">종별</th>
										<th scope="col">두수</th>
										<th scope="col">종별</th>
										<th scope="col">두수</th>
									</tr>
								</thead>
								<thead id="aniClsTot_thead">
									<tr>
										<th scope="colgroup" colspan="16"><div id="MAC_NAME2_DIV" data-val=''></div></th>
									</tr>
								</thead>
								<tbody id="aniCls_tbody">
									<tr style="display:">
										<td class="text_margin">
										<div id="ANI1_ROW_DIV" data-val=''></div>
										<div id="ANI2_ROW_DIV" data-val=''></div>
										<div id="ANICLS_INDEX_DIV" data-val=''></div><div id="MAC_NAME_DIV" data-val=''></div>
										</td>
										<td class="text_margin"><div id="MAC_ENAME_DIV" data-val=''></div></td>
										<td class="text_margin"><div id="MAC_SNAME_DIV" data-val=''></div></td>
										<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
										<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
										<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
										<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
										<td><div id="CNT_BOYUK_DIV" data-val=''></div></td>
										<td><div id="MAC_NATMON_DIV" data-val=''></div></td>
										<td><div id="" data-val=''></div></td>
										<td><div id="TXT_MAC_CITES_DIV" data-val=''></div></td>
										<td><div id="" data-val=''></div></td>
										<td><div id="TXT_MAC_RANK_DIV" data-val=''></div></td>
										<td><div id="" data-val=''></div></td>
										<td><div id="TXT_MAC_ENDANG_DIV" data-val=''></div></td>
										<td><div id="" data-val=''></div></td>
									</tr>
								</tbody>
								<tbody id="aniClsTot_tbody">
									<tr>
										<th scope="colgroup" colspan="3">소계</th>
										<td colspan="3"><div id="CNT_MAC_ANICLSCODE" data-val=''></div></td>
										<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
										<td><div id="" data-val=''></div></td>
										<td><div id="CNT_MAC_NATMON_DIV" data-val=''></div></td>
										<td><div id="CNT_ANI_MAC_NATMON_DIV" data-val=''></div></td>
										<td><div id="CNT_MAC_CITES_DIV" data-val=''></div></td>
										<td><div id="CNT_ANI_MAC_CITES_DIV" data-val=''></div></td>
										<td><div id="CNT_MAC_RANK_DIV" data-val=''></div></td>
										<td><div id="CNT_ANI_MAC_RANK_DIV" data-val=''></div></td>
										<td><div id="CNT_MAC_ENDANG_DIV" data-val=''></div></td>
										<td><div id="CNT_ANI_MAC_ENDANG_DIV" data-val=''></div></td>
									</tr>
								</tbody>
							</table>
							<table class="aniinfo_add table_view" style="margin-top:10px;" >
								<caption>양서강</caption>
								<colgroup>
									<col style="width:16%;">
									<col style="width:14%;">
									<col style="width:14%;">
									<col style="width:14%;">
									<col style="width:14%;">
									<col style="width:14%;">
									<col style="width:14%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2" style="vertical-align:middle;">강 명칭 합계</th>
										<th scope="colgroup" colspan="2">1종 / 갑</th>
										<th scope="colgroup" colspan="2">2종 / 을</th>
										<th scope="colgroup" colspan="2">3종 / 병</th>
									</tr>
									<tr>
										<th scope="col">종 합계</th>
										<th scope="col">마리수 합계</th>
										<th scope="col">종 합계</th>
										<th scope="col">마리수 합계</th>
										<th scope="col">종 합계</th>
										<th scope="col">마리수 합계</th>
									</tr>
								</thead>
								<tbody id="totAniCls_tbody">
									<tr>
										<th scope="row"><div id="MAC_NAME1_DIV" data-val=''></div></th>
										<td><div id="CNT_ANICLS_1_DIV" data-val=''></div></td>
										<td><div id="CNT_ANI_1_DIV" data-val=''></div></td>
										<td><div id="CNT_ANICLS_2_DIV" data-val=''></div></td>
										<td><div id="CNT_ANI_2_DIV" data-val=''></div></td>
										<td><div id="CNT_ANICLS_3_DIV" data-val=''></div></td>
										<td><div id="CNT_ANI_3_DIV" data-val=''></div></td>
									</tr>
								</tbody>
							</table>
					</div>

					<div id="ANILIST_DIV" style="display:;"></div>
					<div id="ANIINFO_DIV" style="display:;">
					<!-- 양서강 -->
						<div class="aniinfo_add_box" id="CLS_DIV">
							<div class="table_title_box">
								<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a><div id="MAC_NAME1_DIV" data-val=''></div></span>
								<div class="sys_btn_box">
									<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
								</div>
							</div>
							<table class="aniinfo_add table_view table_td_margin" >
								<caption>양서강</caption>
								<colgroup>
									<col style="width:11%;">
									<col style="width:12%;">
									<col style="width:12%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
									<col style="width:5%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2" style="vertical-align:middle;">동물명</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">영명</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">학명</th>
										<th scope="colgroup" colspan="4">동물수</th>
										<th scope="col" rowspan="2" style="vertical-align:middle;">보육</th>
										<th scope="colgroup" colspan="2">천연기념물</th>
										<th scope="colgroup" colspan="2">CITES</th>
										<th scope="colgroup" colspan="2">갑을병</th>
										<th scope="colgroup" colspan="2">멸종위기</th>
									</tr>
									<tr>
										<th scope="col">수</th>
										<th scope="col">암</th>
										<th scope="col">미상</th>
										<th scope="col">합계</th>
										<th scope="col">호</th>
										<th scope="col">두수</th>
										<th scope="col">종별</th>
										<th scope="col">두수</th>
										<th scope="col">종별</th>
										<th scope="col">두수</th>
										<th scope="col">종별</th>
										<th scope="col">두수</th>
									</tr>
								</thead>
								<tbody id="ani_list_tbody">
								</tbody>
							</table>
							<table class="aniinfo_add table_view" style="margin-top:10px;" >
								<caption></caption>
								<colgroup>
									<col style="width:16%;">
									<col style="width:14%;">
									<col style="width:14%;">
									<col style="width:14%;">
									<col style="width:14%;">
									<col style="width:14%;">
									<col style="width:14%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" rowspan="2" style="vertical-align:middle;">강 명칭 합계</th>
										<th scope="colgroup" colspan="2">1종 / 갑</th>
										<th scope="colgroup" colspan="2">2종 / 을</th>
										<th scope="colgroup" colspan="2">3종 / 병</th>
									</tr>
									<tr>
										<th scope="col">종 합계</th>
										<th scope="col">마리수 합계</th>
										<th scope="col">종 합계</th>
										<th scope="col">마리수 합계</th>
										<th scope="col">종 합계</th>
										<th scope="col">마리수 합계</th>
									</tr>
								</thead>
								<tbody id="ani_tot_tbody">
								</tbody>
							</table>
							<div id="Nwagon1" class="aniinfo_add table_view" style="margin-top:10px;"></div>
							<script>
								var options = {
									'legend': {
										names: ['2009','2010','2011','2012','2013','2014','2015','2016'],
										hrefs: []
									},
									'dataset': {
										title: 'Playing time per day',
										values: [[1,2], [1,1], [2,1], [3,5], [3,1], [4,3], [2,4], [3,1]],
										colorset: ['#30a1ce','#DC143C'],
										fields:['중국장수도롱뇽', '청개구리']
									},
									'chartDiv': 'Nwagon1',
									'chartType': 'multi_column',
									'chartSize': { width: 990, height: 300 },
									'maxValue': 6,
									'increment': 2
								};
	//							Nwagon.chart(options);
							</script>
	
						</div>
					
  					<!-- //양서강 -->
					</div>


					<!-- 합계 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus3"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>합계</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide3"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						
						
						<table class="aniinfo_add table_view" style="margin-top:10px;" >
							<caption>양서강</caption>
							<colgroup>
								<col style="width:16%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:14%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">총 합 계</th>
									<th scope="colgroup" colspan="2">1종 / 갑</th>
									<th scope="colgroup" colspan="2">2종 / 을</th>
									<th scope="colgroup" colspan="2">3종 / 병</th>
								</tr>
								<tr>
									<th scope="col">종 합계</th>
									<th scope="col">마리수 합계</th>
									<th scope="col">종 합계</th>
									<th scope="col">마리수 합계</th>
									<th scope="col">종 합계</th>
									<th scope="col">마리수 합계</th>
								</tr>
							</thead>
							<tbody id="totCls_tbody" style="display:;">
								<tr>
									<th scope="row">동물 수</th>
									<td><div id="CNT_ANICLS_1_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_1_DIV" data-val=''></div></td>
									<td><div id="CNT_ANICLS_2_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_2_DIV" data-val=''></div></td>
									<td><div id="CNT_ANICLS_3_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_3_DIV" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">보육현황</th>
									<td><div id="CNT_BOYUK_1_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_BOYUK_1_DIV" data-val=''></div></td>
									<td><div id="CNT_BOYUK_2_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_BOYUK_2_DIV" data-val=''></div></td>
									<td><div id="CNT_BOYUK_3_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_BOYUK_3_DIV" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">천연기념물</th>
									<td><div id="CNT_NATMON_1_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_NATMON_1_DIV" data-val=''></div></td>
									<td><div id="CNT_NATMON_2_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_NATMON_2_DIV" data-val=''></div></td>
									<td><div id="CNT_NATMON_3_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_NATMON_3_DIV" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">CITES</th>
									<td><div id="CNT_CITES_1_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_CITES_1_DIV" data-val=''></div></td>
									<td><div id="CNT_CITES_2_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_CITES_2_DIV" data-val=''></div></td>
									<td><div id="CNT_CITES_3_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_CITES_3_DIV" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">멸종위기</th>
									<td><div id="CNT_ENDANG_1_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_ENDANG_1_DIV" data-val=''></div></td>
									<td><div id="CNT_ENDANG_2_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_ENDANG_2_DIV" data-val=''></div></td>
									<td><div id="CNT_ENDANG_3_DIV" data-val=''></div></td>
									<td><div id="CNT_ANI_ENDANG_3_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
						
						
<!-- 						
						<table class="aniinfo_add table_view3">
							<caption>양서강</caption>
							<colgroup>
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
								<col style="width:9%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" colspan="2">강 / 연도</th>
									<th scope="col">2009</th>
									<th scope="col">2010</th>
									<th scope="col">2011</th>
									<th scope="col">2012</th>
									<th scope="col">2013</th>
									<th scope="col">2014</th>
									<th scope="col">2015</th>
									<th scope="col">2016</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" rowspan="2" style="vertical-align:middle;">양서강</th>
									<th scope="row">종 수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row">마리 수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row" rowspan="2" style="vertical-align:middle;">조강</th>
									<th scope="row">종 수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row">마리 수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row" rowspan="2" style="vertical-align:middle;">합계</th>
									<th scope="row">종 수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row">마리 수</th>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
									<td>0</td>
								</tr>
							</tbody>
						</table>
 -->						
						<div id="Nwagon3" class="aniinfo_add table_view3" style="margin-top:10px;"></div>
						<script>
							var options = {
								'legend': {
									names: ['2009','2010','2011','2012','2013','2014','2015','2016'],
									hrefs: []
								},
								'dataset': {
									title: 'Playing time per day',
									values: [[1,2], [1,1], [2,1], [3,5], [3,1], [4,3], [2,4], [3,1]],
									colorset: ['#30a1ce','#DC143C'],
									fields:['양서강', '조강']
								},
								'chartDiv': 'Nwagon3',
								'chartType': 'multi_column',
								'chartSize': { width: 990, height: 300 },
								'maxValue': 6,
								'increment': 2
							};
//							Nwagon.chart(options);
						</script>


					</div>
					<!-- 합계 -->
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
