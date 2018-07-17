<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel='stylesheet' href='/css/base/Nwagon.css' type='text/css'>
<script src="/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<title>기본정보 &gt; 혈액검사기준치</title>
</head>
<script>
	function selectAniCls1List(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("result.length==>" + result.length);
			$("#aniCls1_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("aniCls1_tbody"); 
				
				var iRow = (i+1);
				$("#aniCls1_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
				$("#aniCls1_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#aniCls1_tbody div#MAC_ANICODE1_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
			}
			$("#aniCls1_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectAniCls2List(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			$("#aniCls2_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("aniCls2_tbody");
				
				var iRow = (i+1);
				$("#aniCls2_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
				$("#aniCls2_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#aniCls2_tbody div#MAC_ANICODE1_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
				$("#aniCls2_tbody div#MAC_ANICODE2_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE2); 
			}
			$("#aniCls2_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectAniCls3List(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			$("#aniCls3_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("aniCls3_tbody");
				
				var iRow = (i+1);
				$("#aniCls3_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
				$("#aniCls3_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#aniCls3_tbody div#MAC_ANICODE1_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
				$("#aniCls3_tbody div#MAC_ANICODE2_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE2); 
				$("#aniCls3_tbody div#MAC_ANICODE3_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE3); 
			}
			$("#aniCls3_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectAniCls4List(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			$("#aniCls4_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("aniCls4_tbody");
				
				var iRow = (i+1);
				$("#aniCls4_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
				$("#aniCls4_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
				$("#aniCls4_tbody div#MAC_ANICLSCODE_DIV").eq(iRow).attr('data-val', data.MAC_ANICLSCODE); 
			}
			$("#aniCls4_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectBdInspList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#bdInsp_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("bdInsp_tbody");
				
				var iRow = (i+1);
				$("#bdInsp_tbody div#BDINSP_INDEX_DIV").eq(iRow).html(iRow); 
				$("#bdInsp_tbody div#MCC_S_NAME_DIV").eq(iRow).html(data.MCC_S_NAME); 
				$("#bdInsp_tbody div#MCC_COM_S1_DIV").eq(iRow).html(data.MCC_COM_S1); 
				$("#bdInsp_tbody #MBI_ANICLSCODE").eq(iRow).val(data.MBI_ANICLSCODE); 
				$("#bdInsp_tbody #MBI_BDINSPCODE").eq(iRow).val(data.MBI_BDINSPCODE); 
				$("#bdInsp_tbody #MBI_MEAN").eq(iRow).val(data.MBI_MEAN); 
				$("#bdInsp_tbody #MBI_STDDEVI").eq(iRow).val(data.MBI_STDDEVI); 
			}
			$("#bdInsp_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectBdItemList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#bdItem_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("bdItem_tbody");
				
				var iRow = (i+1);
				$("#bdItem_tbody div#BDITEM_INDEX_DIV").eq(iRow).html(iRow); 
				$("#bdItem_tbody div#MCC_S_CODE_DIV").eq(iRow).attr('data-val', data.MCC_S_CODE); 
				$("#bdItem_tbody div#MCC_S_NAME_DIV").eq(iRow).html(data.MCC_S_NAME); 
				$("#bdItem_tbody div#MCC_COM_S1_DIV").eq(iRow).html(data.MCC_COM_S1); 
				if(data.CHK_YN == "Y"){
					$("#bdItem_tbody #bditem_chk_yn").eq(iRow).prop("checked", true);
				}
			}
			$("#bdItem_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function fn_base_selectAniCls1List(param, callback, retObj) {
		fc_clearRow("aniCls1_tbody");
		var targetUrl = "/base/0108/selectAniCls1List.do";
		var param = {
				schKeyword:$("#sch_tbody #schKeyword").val(),
				clsType : "1"
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_base_selectAniCls2List(targetRow, callback, retObj) {
		console.log("targetRow====>" + targetRow);
		var anicode1 = "";
		if(targetRow!=""){
			anicode1 = $("#aniCls1_tbody div#MAC_ANICODE1_DIV").eq(targetRow).attr('data-val');	
		}

		fc_clearRow("aniCls2_tbody");

		var targetUrl = "/base/0108/selectAniCls2List.do";
		var param = {
				anicode1:anicode1,
				schKeyword:$("#sch_tbody #schKeyword").val(),
				clsType : "2"
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_base_selectAniCls3List(targetRow, callback, retObj) {
		console.log("targetRow====>" + targetRow);
		var anicode1 = "";
		var anicode2 = "";
		if(targetRow!=""){
			anicode1 = $("#aniCls2_tbody div#MAC_ANICODE1_DIV").eq(targetRow).attr('data-val');	
			anicode2 = $("#aniCls2_tbody div#MAC_ANICODE2_DIV").eq(targetRow).attr('data-val');	
		}

		fc_clearRow("aniCls3_tbody");

		var targetUrl = "/base/0108/selectAniCls3List.do";
		var param = {
				anicode1 : anicode1,
				anicode2 : anicode2,
				schKeyword:$("#sch_tbody #schKeyword").val(),
				clsType : "3"
		};
		console.log(JSON.stringify(param));
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_base_selectAniCls4List(targetRow, callback, retObj) {
		console.log("targetRow====>" + targetRow);
		var anicode1 = "";
		var anicode2 = "";
		var anicode3 = "";
		if(targetRow!=""){
			anicode1 = $("#aniCls3_tbody div#MAC_ANICODE1_DIV").eq(targetRow).attr('data-val');	
			anicode2 = $("#aniCls3_tbody div#MAC_ANICODE2_DIV").eq(targetRow).attr('data-val');	
			anicode3 = $("#aniCls3_tbody div#MAC_ANICODE3_DIV").eq(targetRow).attr('data-val');	
		}

		fc_clearRow("aniCls4_tbody");

		var targetUrl = "/base/0108/selectAniCls4List.do";
		var param = {
				anicode1 : anicode1,
				anicode2 : anicode2,
				anicode3 : anicode3,
				schKeyword:$("#sch_tbody #schKeyword").val(),
				clsType : "4"
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_base_selectBdInspList(mac_aniclscode, callback, retObj) {
		console.log("mac_aniclscode====>" + mac_aniclscode);

		fc_clearRow("bdInsp_tbody");

		var targetUrl = "/base/0108/selectBdInspList.do";
		var param = {
				mac_aniclscode:mac_aniclscode
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_base_selectBdItemList(mac_aniclscode, callback, retObj) {
		console.log("mac_aniclscode====>" + mac_aniclscode);

		fc_clearRow("bdItem_tbody");

		var targetUrl = "/base/0108/selectBdItemList.do";
		var param = {
				schKeyword : $("#sch_pop_tbody #schKeyword").val(),
				mac_aniclscode:mac_aniclscode
		};
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function selectAniClsInfo(mac_aniclscode, callback, retObj){
		var param = {
				mac_aniclscode:mac_aniclscode
		};
		$.ajax({
			type : "POST",
			url : "/base/0108/selectAniClsInfo.do",
			dataType : 'json',
			data : param,
			success : function(data) {
//				alert(JSON.stringify(data));
				console.log(JSON.stringify(data));
				$("#aniClsInfo_tbody div#MAC_ANICLSCODE_DIV").attr('data-val', data.MAC_ANICLSCODE); 
				$("#aniClsInfo_tbody div#CLS1_NAME_DIV").html(data.CLS1_NAME); 
				$("#aniClsInfo_tbody div#CLS2_NAME_DIV").html(data.CLS2_NAME); 
				$("#aniClsInfo_tbody div#CLS3_NAME_DIV").html(data.CLS3_NAME); 
				$("#aniClsInfo_tbody div#MAC_ANICLSCODE_DIV").html(data.MAC_ANICLSCODE); 
				$("#aniClsInfo_tbody div#CLS4_NAME_DIV").html(data.MAC_NAME); 
				$("#aniClsInfo_tbody div#MAC_ENAME_DIV").html(data.MAC_ENAME); 
				$("#aniClsInfo_tbody div#MAC_SNAME_DIV").html(data.MAC_SNAME); 
				
				$("#aniClsInfo_tbody div#MAC_CITES_DIV").html(data.MAC_CITES); 
				$("#aniClsInfo_tbody div#MAC_ENDANG_DIV").html(data.MAC_ENDANG); 
				$("#aniClsInfo_tbody div#MAC_NATMON_DIV").html(data.MAC_NATMON); 
				$("#aniClsInfo_tbody div#MAC_RANK_DIV").html(data.MAC_RANK); 
				$("#aniClsInfo_tbody div#MAC_ORGPLACE_DIV").html(data.MAC_ORGPLACE); 
				$("#aniClsInfo_tbody div#MAC_GESTPERID_DIV").html(data.MAC_GESTPERID); 
				$("#aniClsInfo_tbody div#MAC_BRDPERID_DIV").html(data.MAC_BRDPERID); 
								
				if(typeof(callback)=="function"){
					callback.call(retObj, data);
				}
				fn_base_selectBdInspList(param.mac_aniclscode, selectBdInspList);
			},
			error : function(xmlHttpObj) {
				alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
			}
		});	
	}
	
	function fn_base_selectAniClsInfo(targetRow){
		console.log("targetRow====>" + targetRow);
		var param = {
				mac_aniclscode:$("#aniCls4_tbody div#MAC_ANICLSCODE_DIV").eq(targetRow).attr('data-val')
		};
		var validate = function validate(data){
			if(data!=null){
		 		return;
			}else{
		 	}
		}
		selectAniClsInfo(param.mac_aniclscode, validate);
	}	
	
	function fn_base_search(){
		var param = {
				schType : $('#sch_tbody input:radio[name=schType]:checked').val()
		};
		console.log(param.schType);
		if(param.schType=="1"){
			fn_base_selectAniCls1List(param, selectAniCls1List);
		}else if(param.schType=="2"){
			fc_clearRow("aniCls1_tbody");
			fn_base_selectAniCls2List("", selectAniCls2List);
		}else if(param.schType=="3"){
			fc_clearRow("aniCls2_tbody");
			fn_base_selectAniCls3List("", selectAniCls3List);
		}else if(param.schType=="4"){
			fc_clearRow("aniCls3_tbody");
			fn_base_selectAniCls4List("", selectAniCls4List);
		}
	}	
	
	function fn_pop_selectBdItemList(){
		var aniclscode = $("#aniClsInfo_tbody div#MAC_ANICLSCODE_DIV").attr('data-val');
		console.log("aniclscode====>" + aniclscode);
		if(aniclscode==""){
			alert("동물종을 먼저 선택하시기 바랍니다.");
			return;
		}
		fn_layer_show();

		var param = {
			mac_aniclscode : aniclscode
		};
		fn_base_selectBdItemList(param.mac_aniclscode, selectBdItemList);
	}

	function fn_pop_createBdInspList(callback, retObj) {
		
		var chk_list = [];
		var chk_list_Y = "";
		$("#bdItem_tbody #bditem_chk_yn").each(function(index){
			console.log($(this).prop("checked"));
			if($(this).prop("checked")){
				chk_list.push($("#bdItem_tbody #MCC_S_CODE_DIV").eq(index).attr('data-val'));
				if(index!=0){
					chk_list_Y += ",";
				}
				chk_list_Y += $("#bdItem_tbody #MCC_S_CODE_DIV").eq(index).attr('data-val');
			}
		});
		var param = {
				mac_aniclscode : $("#aniClsInfo_tbody div#MAC_ANICLSCODE_DIV").attr('data-val'),
				list : chk_list_Y,
				schKeyword : $("#sch_pop_tbody #schKeyword").val()
		};
		console.log("mac_aniclscode====>" + param.mac_aniclscode);
		console.log("list====>" + param.list);

		var targetUrl = "/base/0108/createBdInspList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function createBdInspList(result) {
		if (result.qryRslt == "Y") {
			alert("등록되었습니다.");
			fn_layer_hide();
			var param = {
				mac_aniclscode : $("#aniClsInfo_tbody div#MAC_ANICLSCODE_DIV").attr('data-val')
			};
			console.log("mac_aniclscode====>" + param.mac_aniclscode);
			fn_base_selectBdInspList(param.mac_aniclscode, selectBdInspList);
		}
	}
	
	function fn_layer_show() {
		$(".layer_box").show();
		$(".layer_popup").show();
		var width_size = $(".layer_box").innerWidth()/2;
		$(".layer_box").css("margin-left",-width_size);
	}

	function fn_layer_hide() {
		$(".layer_box").hide();
		$(".layer_popup").hide();
		$("body").css("overflow-y", "auto");
	}

	function saveBdInspList(result) {
		if (result.qryRslt == "Y") {
			alert("등록되었습니다.");
			var param = {
				mac_aniclscode : $("#aniClsInfo_tbody div#MAC_ANICLSCODE_DIV").attr('data-val')
			};
			console.log("mac_aniclscode====>" + param.mac_aniclscode);
			fn_base_selectBdInspList(param.mac_aniclscode, selectBdInspList);
		}
	}
	
	function fn_base_saveBdInspList(callback, retObj) {
		
		var aniclscode_list = [];
		var bdinspcode_list = [];
		var mean_list = [];
		var stddevi_list = [];
		$("#bdInsp_tbody #MBI_STDDEVI").each(function(index){
			console.log($(this).val());
			if(index!=0){
 				aniclscode_list.push($("#bdInsp_tbody #MBI_ANICLSCODE").eq(index).val());
				bdinspcode_list.push($("#bdInsp_tbody #MBI_BDINSPCODE").eq(index).val());
				mean_list.push($("#bdInsp_tbody #MBI_MEAN").eq(index).val());
				stddevi_list.push($("#bdInsp_tbody #MBI_STDDEVI").eq(index).val()); 
			}
		});
		var param = {
				mbi_aniclscode : aniclscode_list,
				mbi_bdinspcode : bdinspcode_list,
				mbi_mean : mean_list,
				mbi_stddevi : stddevi_list
		};
		console.log("list.mbi_aniclscode====>" + param.mbi_aniclscode);
		console.log("list.mbi_bdinspcode====>" + param.mbi_bdinspcode);
		console.log("list.mbi_mean====>" + param.mbi_mean);
		console.log("list.mbi_stddevi====>" + param.mbi_stddevi);
		
		var targetUrl = "/base/0108/saveBdInspList.do";
		$.ajaxSettings.traditional = true; 
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	
	$(document).ready(function() {
		if(fn_is_pms_upd(0108)){
			/* $("#save_btn").css("display","");
			$(".cancel_btn").css("display","");
			$(".add_btn").css("display","");
			$(".excel_btn").css("display",""); */
		}
	});
</script>
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
                    <p class="contents_title">혈액검사기준치</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home" style="margin-top: 10px;"></li>
                        <li>> 기본정보</li>
                        <li>>  혈액검사기준치</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="search_table" >
							<caption>동물그룹정보조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
                            <tr>
                                <th scope="row">분류 구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="schType" name="schType" value="1" class="search_radio" checked="checked"/>강</label>
                                  <label><input type="radio" id="schType" name="schType" value="2" class="search_radio" />목</label>
                                  <label><input type="radio" id="schType" name="schType" value="3" class="search_radio" />과</label>
                                  <label><input type="radio" id="schType" name="schType" value="4" class="search_radio" />종</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류 명칭</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn" style="margin-top: 5px;">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<!-- //분류검색표-->
					<!-- 동물 그룹정보 일람-->
					<div class="table_wrap">
						<!-- 그룹항목표-->
						<p class="sub_title">동물 그룹정보 일람</p>					
						<table class="ani_list category">
							<caption>강그룹</caption>
							<colgroup>
								<col style="width:100%" />
							</colgroup>
							<thead>
								<tr><th scope="col">강<a href="#" class="all_btn">전체</a></th></tr>
							</thead>
							<tbody id="aniCls1_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
									<td>
										<div id="MAC_ANICODE1_DIV" data-val=''></div>
										<a href="javascript:;">
										<div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectAniCls2List($(this).attr('data-val'), selectAniCls2List);"></div></a>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div>							
							<table class="ani_list" >
								<caption>목그룹</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">목<a href="#" class="all_btn">전체</a></th></tr>
								</thead>
								<tbody id="aniCls2_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICODE1_DIV" data-val=''></div>
											<div id="MAC_ANICODE2_DIV" data-val=''></div>
											<a href="javascript:;">
											<div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectAniCls3List($(this).attr('data-val'), selectAniCls3List);"></div></a>
										</td>
									</tr>
								</tbody>
							</table>							
						</div>
						<div>							
							<table class="ani_list" >
								<caption>과그룹</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">과<a href="#" class="all_btn">전체</a></th></tr>
								</thead>
								<tbody id="aniCls3_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICODE1_DIV" data-val=''></div>
											<div id="MAC_ANICODE2_DIV" data-val=''></div>
											<div id="MAC_ANICODE3_DIV" data-val=''></div>
											<a href="javascript:;">
											<div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectAniCls4List($(this).attr('data-val'), selectAniCls4List);"></div></a>
										</td>
									</tr>
								</tbody>
							</table>							
						</div>
						<div>
							<table class="ani_list">
								<caption>종그룹</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">종<a href="#" class="all_btn">전체</a></th></tr>
								</thead>
								<tbody id="aniCls4_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICLSCODE_DIV" data-val=''></div>
											<a href="javascript:;">
											<div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectAniClsInfo($(this).attr('data-val'));"></div></a>
										</td>
									</tr>
								</tbody>
							</table>							
						</div>
						<!-- //그룹항목표-->
						
						<!-- 상세정보표-->
						<div class="ani_info_box">
							<!-- 상세정보기본-->
							<%-- <table class="ani_info infobase" > 
								<caption>동물그룹상세정보</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span></th></tr>
								</thead>
								<tbody id="aniClsInfo_tbody">
									<tr><th scope="row">강번호</th><td><div id="CLS1_NAME_DIV" data-val=''></div></td></tr>
									<tr><th scope="row">강명칭</th><td><div id="CLS2_NAME_DIV" data-val=''></div></td></tr>
									<tr><th scope="row">과정보</th><td><div id="CLS3_NAME_DIV" data-val=''></div></td></tr>
									<tr><th scope="row">종번호</th><td><div id="MAC_ANICLSCODE_DIV" data-val=''></div></td></tr>
									<tr><th scope="row">종명칭</th><td><div id="CLS4_NAME_DIV" data-val=''></td></tr>
									<tr><th scope="row">영명</th><td><div id="MAC_ENAME_DIV" data-val=''></td></tr>
									<tr><th scope="row">학명</th><td><div id="MAC_SNAME_DIV" data-val=''></td></tr>
									<tr><th scope="row">CITES</th><td><div id="MAC_CITES_DIV" data-val=''></td></tr>
									<tr><th scope="row">멸종위기</th><td><div id="MAC_ENDANG_DIV" data-val=''></td></tr>
									<tr><th scope="row">천연기년물</th><td><div id="MAC_NATMON_DIV" data-val=''></td></tr>
									<tr><th scope="row">등급</th><td><div id="MAC_RANK_DIV" data-val=''></td></tr>
									<tr><th scope="row">원산지</th><td><div id="MAC_ORGPLACE_DIV" data-val=''></td></tr>
									<tr><th scope="row">임신기간</th><td><div id="MAC_GESTPERID_DIV" data-val=''></td></tr>
									<tr><th scope="row">보육기간</th><td><div id="MAC_BRDPERID_DIV" data-val=''></td></tr>
							   </tbody>
							</table> --%>
							<!-- //상세정보기본-->
							<!-- 종그룹보기-->					
							<table class="ani_info infotable" >
								<caption>동물그룹상세정보</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="#" class="del_btn" style="float:right; margin:5px 10px; ">삭제</a></th></tr>
								</thead>
								<tbody>
									<tr><th scope="row">강정보</th><td>조강 (B)</td></tr>
									<tr><th scope="row">목정보</th><td>타조목 (1)</td></tr>
									<tr><th scope="row">과정보</th><td>타조과 (1)</td></tr>
									<tr><th scope="row">종번호</th><td>1</td></tr>
									<tr><th scope="row">종명칭</th><td>타조</td></tr>
									<tr><th scope="row">영명</th><td>South African Ostrich</td></tr>
									<tr><th scope="row">학명</th><td>Struthio camelus</td></tr>
									<tr><th scope="row">CITES</th><td>CITESⅡ</td></tr>
									<tr><th scope="row">멸종위기</th><td>해당없음</td></tr>
									<tr><th scope="row">천연기년물</th><td>0</td></tr>
									<tr><th scope="row">등급</th><td>을</td></tr>
									<tr><th scope="row">평가내용</th><td>유지종</td></tr>
									<tr><th scope="row">원산지</th><td>토종</td></tr>
									<tr><th scope="row">임신기간</th><td>개월</td></tr>
									<tr><th scope="row">군집구분</th><td>군집</td></tr>
									<tr><th scope="row">개체수</th><td>마리</td></tr>
									<tr><th scope="row">평균수명</th><td>10 년</td></tr>
								</tbody>
							</table>
							<!-- //종그룹보기-->					
							
						</div>
						<!-- //상세정보표-->
					</div>
					<!-- 혈액검사 정보-->
					<div class="aniinfo_add_box deptinfo_position">
						<div class="table_title_box">
							<span class="table_title">
							<img src="/images/btn_minus.gif" alt="">혈액검사 정보</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide">
								<!-- <a href="#layer01" onclick="javascript:fn_base_saveBdInspList(saveBdInspList);" class="cha_btn layer_open">저장</a> -->
								 <a href="#layer01" class="print_btn btn_type2" onclick="javascript:fn_pop_selectBdItemList();">취소</a>
								</span>
							</div>
						</div>
						<table class="aniinfo_add table_view2" >
							<caption>혈액검사 정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">검사항목</th>
									<th scope="col" id="th03">검사항목단위</th>
									<th scope="col" id="th04">Mean</th>
									<th scope="col" id="th05">Standard Deviation</th>
								</tr>
							</thead>
							<tbody id="bdInsp_tbody">
								<tr style="display:none">
									<th scope="row" id="n01" headers="th01"><div id="BDINSP_INDEX_DIV" data-val=''></div>
									<input type="hidden" id="mbi_aniclscode" name="mbi_aniclscode"/>
									<input type="hidden" id="mbi_bdinspcode" name="mbi_bdinspcode"/>
									</th>
									<td headers="n01 th02"><div id="MCC_S_NAME_DIV" data-val=''></div></td>
									<td headers="n01 th03"><div id="MCC_COM_S1_DIV" data-val=''></div></td>
									<td headers="n01 th04"><input name="MBI_MEAN" type="text" id="MBI_MEAN" class="textfield" value="" maxlength="25"/></td>
									<td headers="n01 th05"><input name="MBI_STDDEVI" type="text" id="MBI_STDDEVI" class="textfield" value="" maxlength="25"/></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //혈액검사 정보-->
					
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
		
<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer01 -->
		<div class="layer_box" id="layer01" style="width:800px;">
			<div class="layer_tit">혈액검사 정보</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" style="width:760px;" >
							<caption>분류구분 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_pop_tbody">
                            <tr><th scope="row">검사항목</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/><label for="seach_text2"></label></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_pop_selectBdItemList();" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box" style="height: 300px; overflow: auto">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;">
							<caption>혈액검사 정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:22%;">
								<col style="width:20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_1">No</th>
									<th scope="col" id="th02_1">검사항목</th>
									<th scope="col" id="th03_1">검사항목단위</th>
									<th scope="col" id="th04_1">선택</th>
								</tr>
							</thead>
							<tbody id="bdItem_tbody">
								<tr style="display:">
									<th scope="row" id="n01_1" headers="th01_1"><div id="BDITEM_INDEX_DIV" data-val=''></div></th>
									<td headers="n01_1 th02_1"><div id="MCC_S_CODE_DIV" data-val=''></div><div id="MCC_S_NAME_DIV" data-val=''></div></td>
									<td headers="n01_1 th03_1"><div id="MCC_COM_S1_DIV" data-val=''></div></td>
									<td headers="n01_1 th04_1"><input type="checkbox" id="bditem_chk_yn" name="bditem_chk_yn"/><label for="bditem_chk_yn"></label></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- pagination -->
					<div class="pagination" style="margin-top:10px;">
						<a href="#" class="page first"></a>
						<a href="#" class="page prev"></a>
						<a href="#" class="on">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<!--
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						-->
						<a href="#" class="page next"></a>
						<a href="#" class="page last"></a>
					</div>
					<!-- //pagination -->

					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2" onclick="javascript:fn_pop_createBdInspList(createBdInspList);">확인</a>
						<a href="#none" class="popcancel_btn btn_type2" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="javascript:fn_layer_hide();" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
	</div>
	<!-- // layer_popup -->


	</div>
	<!-- //container -->
	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>
