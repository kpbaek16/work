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
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>
<script>
	function selectAniIoITotList(result){
	 	if(result!=null){
	//		console.log("selectAniRentTotList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#totIoI_tbody tr:first").attr('style',"display:");
			
			var tot_CNT_MAI_ANICLSCODE = 0;
			var tot_MAI_SEX_M = 0;
			var tot_MAI_SEX_F = 0;
			var tot_MAI_SEX_A = 0;
			var tot_TOT_MAI_SEX = 0;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("totIoI_tbody");
					
				var iRow = (i+1);
				$("#totIoI_tbody div#tot_MAC_ANICODE1_DIV").eq(iRow).attr('data-val',data.MAC_ANICODE1); 
				$("#totIoI_tbody div#tot_TXT_MAI_ANICODE_1_DIV").eq(iRow).html("[" + data.TXT_MAI_ANICODE_1 + "] 소계"); 
				$("#totIoI_tbody div#tot_MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#totIoI_tbody div#tot_MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#totIoI_tbody div#tot_MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#totIoI_tbody div#tot_TOT_MAI_SEX_DIV").eq(iRow).html(data.TOT_MAI_SEX);
				
				tot_MAI_SEX_M += data.MAI_SEX_M;
				tot_MAI_SEX_F += data.MAI_SEX_F;
				tot_MAI_SEX_A += data.MAI_SEX_A;
				tot_TOT_MAI_SEX += data.TOT_MAI_SEX;
			}
			$("#totIoI_tfoot div#MAI_SEX_M_DIV").eq(0).html(tot_MAI_SEX_M); 
			$("#totIoI_tfoot div#MAI_SEX_F_DIV").eq(0).html(tot_MAI_SEX_F); 
			$("#totIoI_tfoot div#MAI_SEX_A_DIV").eq(0).html(tot_MAI_SEX_A); 
			$("#totIoI_tfoot div#TOT_MAI_SEX_DIV").eq(0).html(tot_TOT_MAI_SEX); 
			
			$("#totIoI_tbody tr:first").attr('style',"display:none");
			
			if(result.length > 0){
				fn_sta_selectAniIoIList(selectAniIoIList);
			}
	 	}
	
	}

	function selectAniIoOTotList(result){
	 	if(result!=null){
	//		console.log("selectAniRentTotList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#totIoO_tbody tr:first").attr('style',"display:");
			
			var tot_CNT_MAI_ANICLSCODE = 0;
			var tot_MAI_SEX_M = 0;
			var tot_MAI_SEX_F = 0;
			var tot_MAI_SEX_A = 0;
			var tot_TOT_MAI_SEX = 0;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("totIoO_tbody");
					
				var iRow = (i+1);
				$("#totIoO_tbody div#tot_MAC_ANICODE1_DIV").eq(iRow).attr('data-val',data.MAC_ANICODE1); 
				$("#totIoO_tbody div#tot_TXT_MAI_ANICODE_1_DIV").eq(iRow).html("[" + data.TXT_MAI_ANICODE_1 + "] 소계"); 
				$("#totIoO_tbody div#tot_MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#totIoO_tbody div#tot_MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#totIoO_tbody div#tot_MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#totIoO_tbody div#tot_TOT_MAI_SEX_DIV").eq(iRow).html(data.TOT_MAI_SEX);
				
				tot_MAI_SEX_M += data.MAI_SEX_M;
				tot_MAI_SEX_F += data.MAI_SEX_F;
				tot_MAI_SEX_A += data.MAI_SEX_A;
				tot_TOT_MAI_SEX += data.TOT_MAI_SEX;
			}
			$("#totIoO_tfoot div#MAI_SEX_M_DIV").eq(0).html(tot_MAI_SEX_M); 
			$("#totIoO_tfoot div#MAI_SEX_F_DIV").eq(0).html(tot_MAI_SEX_F); 
			$("#totIoO_tfoot div#MAI_SEX_A_DIV").eq(0).html(tot_MAI_SEX_A); 
			$("#totIoO_tfoot div#TOT_MAI_SEX_DIV").eq(0).html(tot_TOT_MAI_SEX); 
			
			$("#totIoO_tbody tr:first").attr('style',"display:none");
			
			if(result.length > 0){
				fn_sta_selectAniIoOList(selectAniIoOList);
			}
	 	}
	
	}

	function selectTotAniIoList(result){
	 	if(result!=null){
	//		console.log("selectAniRentTotList:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#tot_tbody tr:first").attr('style',"display:");
			
			var tot_CNT_MAI_ANICLSCODE = 0;
			var tot_MAI_SEX_M = 0;
			var tot_MAI_SEX_F = 0;
			var tot_MAI_SEX_A = 0;
			var tot_TOT_MAI_SEX = 0;
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("tot_tbody");
					
				var iRow = (i+1);
				$("#tot_tbody div#IO_TOT_INDEX_DIV").eq(iRow).html(iRow); 
				$("#tot_tbody div#tot_MAC_ANICODE1_DIV").eq(iRow).attr('data-val',data.MAC_ANICODE1); 
				$("#tot_tbody div#tot_TXT_MAI_ANICODE_1_DIV").eq(iRow).html("[" + data.TXT_MAI_ANICODE_1 + "] 소계"); 
				$("#tot_tbody div#tot_MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#tot_tbody div#tot_MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#tot_tbody div#tot_MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#tot_tbody div#tot_TOT_MAI_SEX_DIV").eq(iRow).html(data.TOT_MAI_SEX);
				
				tot_MAI_SEX_M += data.MAI_SEX_M;
				tot_MAI_SEX_F += data.MAI_SEX_F;
				tot_MAI_SEX_A += data.MAI_SEX_A;
				tot_TOT_MAI_SEX += data.TOT_MAI_SEX;
			}
			$("#tot_tfoot div#MAI_SEX_M_DIV").eq(0).html(tot_MAI_SEX_M); 
			$("#tot_tfoot div#MAI_SEX_F_DIV").eq(0).html(tot_MAI_SEX_F); 
			$("#tot_tfoot div#MAI_SEX_A_DIV").eq(0).html(tot_MAI_SEX_A); 
			$("#tot_tfoot div#TOT_MAI_SEX_DIV").eq(0).html(tot_TOT_MAI_SEX); 
			
			$("#tot_tbody tr:first").attr('style',"display:none");
	 	}
	
	}

	function selectAniIoOList(result){
		console.log("****selectAniIoOList");
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
				$("#ioO_tbody div#TXT_DAIO_IODATE_DIV").eq(iRow).html(data.TXT_DAIO_IODATE); 
				$("#ioO_tbody div#TXT_DAIO_RESN_DIV").eq(iRow).html(data.TXT_DAIO_RESN); 
				$("#ioO_tbody div#MDI_DPTNAME_DIV").eq(iRow).html("[" + data.MDI_DPTNAME + "]" + data.MTI_TEAMNAME); 
				$("#ioO_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
				$("#ioO_tbody div#TXT_MAI_ANICODE_1_DIV").eq(iRow).html(data.TXT_MAI_ANICODE_1); 
				$("#ioO_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#ioO_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#ioO_tbody div#MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#ioO_tbody div#MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#ioO_tbody div#MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#ioO_tbody div#CNT_MAI_SEX_DIV").eq(iRow).html(data.CNT_MAI_SEX); 
			}
			$("#ioO_tbody").append($("#totIoO_tbody tr:last"));
			$("#ioO_tbody tr:first").attr('style',"display:none");
	 	}
	}
	function selectAniIoIList(result){
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
				$("#ioI_tbody div#TXT_DAIO_IODATE_DIV").eq(iRow).html(data.TXT_DAIO_IODATE); 
				$("#ioI_tbody div#TXT_DAIO_RESN_DIV").eq(iRow).html(data.TXT_DAIO_RESN); 
				$("#ioI_tbody div#MDI_DPTNAME_DIV").eq(iRow).html("[" + data.MDI_DPTNAME + "]" + data.MTI_TEAMNAME); 
				$("#ioI_tbody div#MVI_VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME); 
				$("#ioI_tbody div#TXT_MAI_ANICODE_1_DIV").eq(iRow).html(data.TXT_MAI_ANICODE_1); 
				$("#ioI_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#ioI_tbody div#MAI_ANICODE_DIV").eq(iRow).html(data.MAI_ANICODE); 
				$("#ioI_tbody div#MAI_SEX_M_DIV").eq(iRow).html(data.MAI_SEX_M); 
				$("#ioI_tbody div#MAI_SEX_F_DIV").eq(iRow).html(data.MAI_SEX_F); 
				$("#ioI_tbody div#MAI_SEX_A_DIV").eq(iRow).html(data.MAI_SEX_A); 
				$("#ioI_tbody div#CNT_MAI_SEX_DIV").eq(iRow).html(data.CNT_MAI_SEX); 
				
			}
			$("#ioI_tbody").append($("#totIoI_tbody tr:last"));
			$("#ioI_tbody tr:first").attr('style',"display:none");
	 	}
	}
	function fn_sta_selectAniIoOList(callback, retObj) {
		fc_clearRow("ioO_tbody");

		var targetUrl = "/stat/0604/selectAniIoOList.do";
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val()
		};
		
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	function fn_sta_selectAniIoIList(callback, retObj) {
		fc_clearRow("ioI_tbody");

		var targetUrl = "/stat/0604/selectAniIoIList.do";
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val()
		};
		
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniIoITotList(param, callback, retObj) {
		fc_clearRow("totIoI_tbody");

		var targetUrl = "/stat/0604/selectAniIoITotList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniIoOTotList(param, callback, retObj) {
		fc_clearRow("totIoO_tbody");

		var targetUrl = "/stat/0604/selectAniIoOTotList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectTotAniIoList(param, callback, retObj) {
		fc_clearRow("tot_tbody");

		var targetUrl = "/stat/0604/selectTotAniIoList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_sta_selectAniIoSta(){
		fc_clearRow("ioI_tbody");
		fc_clearRow("ioO_tbody");
		fc_clearRow("tot_tbody");
		var param = {
				cal_1 : $("#sch_tbody #cal_1").val(),
				cal_2 : $("#sch_tbody #cal_2").val()
		};
		fn_sta_selectAniIoITotList(param, selectAniIoITotList);
		fn_sta_selectAniIoOTotList(param, selectAniIoOTotList);
		fn_sta_selectTotAniIoList(param, selectTotAniIoList);
	}

	$(document).ready(function() {
		fc_clearRow("ioI_tbody");
		fc_clearRow("ioO_tbody");
		fc_clearRow("tot_tbody");
	});
	
</script>

<title>현황/통계 &gt; 증감현황</title>
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
                    <p class="contents_title">증감현황</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 현황/통계</li>
                        <li>> 증감현황</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 증감현황 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>증감현황 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${calInfo.cal_1}"><label for="cal_1"></label> ~ <input type="text" class="calendar1" id="cal_2" value="${calInfo.cal_2}"><label for="cal_2"></label></p></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sta_selectAniIoSta();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //증감현황 조회 -->

					<!-- 동물분류 증감합계 -->
					<div id="ioTot_div" style="display:none;">
						<table>
							<tbody id="totIoI_tbody">
								<tr style="display:;">
									<th scope="row"  colspan="8"><div id="tot_MAC_ANICODE1_DIV" data-val=''></div><div id="tot_TXT_MAI_ANICODE_1_DIV" data-val=''></div></th>
									<td><div id="tot_MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="tot_TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tbody>
							<tbody id="totIoO_tbody">
								<tr style="display:;">
									<th scope="row"  colspan="8"><div id="tot_MAC_ANICODE1_DIV" data-val=''></div><div id="tot_TXT_MAI_ANICODE_1_DIV" data-val=''></div></th>
									<td><div id="tot_MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="tot_TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div>&nbsp;</div>
					<!-- 동물증가내역 -->
					<div>
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>동물증가내역</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>동물증가내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">일자</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">부서명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물사</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물번호</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">증가사유</th>
									<th scope="colgroup" colspan="4">동물 수</th>
								</tr>
								<tr>
									<th scope="col">수</th>
									<th scope="col">암</th>
									<th scope="col">미상</th>
									<th scope="col">합계</th>
								</tr>
							</thead>
							<tbody id="ioI_tbody">
								<tr style="display:none">
									<th scope="row"><div id="IO_I_INDEX_DIV" data-val=''></div></th>
									<td><div id="TXT_DAIO_IODATE_DIV" data-val=''></div></td>
									<td><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_ANICODE_1_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="TXT_DAIO_RESN_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="colgroup" colspan="8">[파충강] 소계</th>
									<td>1</td>
									<td>0</td>
									<td>0</td>
									<td>1</td>
								</tr>
							</tbody>
							<tfoot id="totIoI_tfoot">
								<tr>
									<th scope="colgroup" colspan="8">총 합계</th>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tfoot>
						</table>
					</div>
					
  					<!-- //동물증가내역 -->

					<div>&nbsp;</div>

					<!-- 동물감소내역 -->
					<div>
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>동물감소내역</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide2"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>동물감소내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">일자</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">부서명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물사</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">분류명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물명</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">동물번호</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;">감소사유</th>
									<th scope="colgroup" colspan="4">동물 수</th>
								</tr>
								<tr>
									<th scope="col">수</th>
									<th scope="col">암</th>
									<th scope="col">미상</th>
									<th scope="col">합계</th>
								</tr>
							</thead>
							<tbody id="ioO_tbody">
								<tr style="display:none;">
									<th scope="row"><div id="IO_O_INDEX_DIV" data-val=''></div></th>
									<td><div id="TXT_DAIO_IODATE_DIV" data-val=''></div></td>
									<td><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td><div id="MVI_VVRMNAME_DIV" data-val=''></div></td>
									<td><div id="TXT_MAI_ANICODE_1_DIV" data-val=''></div></td>
									<td><div id="MAC_NAME_DIV" data-val=''></div></td>
									<td><div id="MAI_ANICODE_DIV" data-val=''></div></td>
									<td><div id="TXT_DAIO_RESN_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="CNT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="colgroup" colspan="8">[포유강] 소계</th>
									<td>0</td>
									<td>4</td>
									<td>1</td>
									<td>5</td>
								</tr>
							</tbody>
							<tfoot id="totIoO_tfoot">
								<tr>
									<th scope="colgroup" colspan="8">총 합계</th>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tfoot>
						</table>
						
					</div>
					
					<div>&nbsp;</div>

					<!-- 합계 -->
					<div>
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus3"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>합계</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide3"><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>
							</div>
						</div>

						<table class="aniinfo_add table_view">
							<caption>합계</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" rowspan="2" style="vertical-align:middle;">No</th>
									<th scope="col" rowspan="2" style="vertical-align:middle;" colspan=7>분류명</th>
									<th scope="colgroup" colspan="4">동물 수</th>
								</tr>
								<tr>
									<th scope="col">수</th>
									<th scope="col">암</th>
									<th scope="col">미상</th>
									<th scope="col">합계</th>
								</tr>
							</thead>
							<tbody id="tot_tbody">
								<tr style="display:none">
									<th scope="row"><div id="IO_TOT_INDEX_DIV" data-val=''></div></th>
									<td colspan="7"><div id="tot_MAC_ANICODE1_DIV" data-val=''></div><div id="tot_TXT_MAI_ANICODE_1_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="tot_MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="tot_TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tbody>
							<tfoot>
								<tr id="tot_tfoot">
									<th scope="colgroup" colspan="8">총 합계</th>
									<td><div id="MAI_SEX_M_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_F_DIV" data-val=''></div></td>
									<td><div id="MAI_SEX_A_DIV" data-val=''></div></td>
									<td><div id="TOT_MAI_SEX_DIV" data-val=''></div></td>
								</tr>
							</tfoot>
						</table>
					</div>
					
  					<!-- //합계 -->

				
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
