<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script> <!-- Lnb 스크립트-->
<script src="/js/contents/base.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<script type="text/javascript">
function ShowTable(wtable) {
	eval(wtable).style.display="";
	}

function HideTable(wtable) {
	eval(wtable).style.display="none";
}
</script>

<script type="text/javascript">

function selectClassList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#class_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("class_tbody"); 
			
			var iRow = (i+1);
			
			$("#class_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#class_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			
			$("#class_tbody div#MAC_ANICODE1_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
		}
		$("#class_tbody tr:first").attr('style',"display:none");
 	}
}

function selectClassList_P(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#p_body tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("p_body"); 
			
			var iRow = (i+1);

			$("#p_body div#MAC_NAME_DIV_P").eq(iRow).attr('data-val', iRow); 
			$("#p_body div#MAC_NAME_DIV_P").eq(iRow).html(data.MAC_NAME); 
			$("#p_body div#MAC_ANICODE1_DIV_P").eq(iRow).attr('data-val', data.MAC_ANICODE1);
		}
		$("#p_body tr:first").attr('style',"display:none");
 	}
}

function selectOrderList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#order_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("order_tbody");
			
			var iRow = (i+1);
			$("#order_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#order_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#order_tbody div#MAC_ANICODE1_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
			$("#order_tbody div#MAC_ANICODE2_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE2); 
		}
		$("#order_tbody tr:first").attr('style',"display:none");
 	}
}

function selectOrderList_P(result){
	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#m_body tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("m_body");
			
			var iRow = (i+1);
			$("#m_body div#MAC_NAME_DIV_P").eq(iRow).attr('data-val', iRow); 
			$("#m_body div#MAC_NAME_DIV_P").eq(iRow).html(data.MAC_NAME); 
			$("#m_body div#MAC_ANICODE1_DIV_P").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
			$("#m_body div#MAC_ANICODE2_DIV_P").eq(iRow).attr('data-val', data.MAC_ANICODE2); 
		}
		$("#m_body tr:first").attr('style',"display:none");
 	} 
}

function selectFamilyList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#family_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("family_tbody");
			
			var iRow = (i+1);
			$("#family_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#family_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#family_tbody div#MAC_ANICODE1_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
			$("#family_tbody div#MAC_ANICODE2_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE2); 
			$("#family_tbody div#MAC_ANICODE3_DIV").eq(iRow).attr('data-val', data.MAC_ANICODE3); 
		}
		$("#family_tbody tr:first").attr('style',"display:none");
 	}
}

function selectFamilyList_P(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#g_body tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("g_body");
			
			var iRow = (i+1);
			$("#g_body div#MAC_NAME_DIV_P").eq(iRow).attr('data-val', iRow); 
			$("#g_body div#MAC_NAME_DIV_P").eq(iRow).html(data.MAC_NAME); 
			$("#g_body div#MAC_ANICODE1_DIV_P").eq(iRow).attr('data-val', data.MAC_ANICODE1); 
			$("#g_body div#MAC_ANICODE2_DIV_P").eq(iRow).attr('data-val', data.MAC_ANICODE2); 
			$("#g_body div#MAC_ANICODE3_DIV_P").eq(iRow).attr('data-val', data.MAC_ANICODE3); 
		}
		$("#g_body tr:first").attr('style',"display:none");
 	}
}


function selectSpeciesList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#species_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("species_tbody");
			
			var iRow = (i+1);
			$("#species_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#species_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			$("#species_tbody div#MAC_ANICLSCODE_DIV").eq(iRow).attr('data-val', data.MAC_ANICLSCODE); 
		}
		$("#species_tbody tr:first").attr('style',"display:none");
 	}
}

function selectAniClsInfo(mac_aniclscode, callback, retObj){
	var param = {
			mac_aniclscode:mac_aniclscode
	};
	$.ajax({
		type : "POST",
		url : "/base/0106/selectAniClsInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#aniClsInfo_tbody div#CLS1_NAME_DIV").html(data.CLS1_NAME); 
			$("#aniClsInfo_tbody div#CLS2_NAME_DIV").html(data.CLS2_NAME); 
			$("#aniClsInfo_tbody div#CLS3_NAME_DIV").html(data.CLS3_NAME); 
			$("#aniClsInfo_tbody div#MAC_ANICLSCODE_DIV").html(data.MAC_ANICLSCODE); 
			$("#aniClsInfo_tbody #CLS4_NAME").val(data.MAC_NAME); 
			$("#aniClsInfo_tbody #MAC_ENAME").val(data.MAC_ENAME); 
			$("#aniClsInfo_tbody #MAC_SNAME").val(data.MAC_SNAME); 
			$("#aniClsInfo_tbody #MAC_CITES").val(data.MAC_CITES);
			$("#aniClsInfo_tbody #MAC_ENDANG").val(data.MAC_ENDANG);
			$("#aniClsInfo_tbody #MAC_NATMON").val(data.MAC_NATMON); 
			$("#aniClsInfo_tbody #MAC_RANK").val(data.MAC_RANK);
			$("#aniClsInfo_tbody #MAC_ORGPLACE").val(data.MAC_ORGPLACE); 
			$("#aniClsInfo_tbody #MAC_GESTPERID").val(data.MAC_GESTPERID); 
			$("#aniClsInfo_tbody div#MAC_BRDPERID_DIV").html(data.MAC_BRDPERID);
			
			$("#before_tbody div#CLS1_NAME_DIV_B").html(data.CLS1_NAME); 
			$("#before_tbody div#CLS2_NAME_DIV_B").html(data.CLS2_NAME); 
			$("#before_tbody div#CLS3_NAME_DIV_B").html(data.CLS3_NAME);
			$("#before_tbody div#MAC_NAME_DIV_B").html(data.MAC_NAME);
								
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


function fn_base_selectClassList(param, callback, retObj) {
	fc_clearRow("class_tbody");
	var targetUrl = "/base/0106/selectClassList.do";
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

function fn_base_selectClassList_P(param, callback, retObj) {
	fc_clearRow("p_body");
	var targetUrl = "/base/0106/selectClassList.do";
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

function fn_base_selectOrderList(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var anicode1 = "";
	if(targetRow!=""){
		anicode1 = $("#class_tbody div#MAC_ANICODE1_DIV").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("order_tbody");

	var targetUrl = "/base/0106/selectOrderList.do";
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

function fn_base_selectOrderList_P(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var anicode1 = "";
	if(targetRow!=""){
		anicode1 = $("#p_body div#MAC_ANICODE1_DIV_P").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("m_body");

	var targetUrl = "/base/0106/selectOrderList.do";
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

function fn_base_selectFamilyList(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var anicode1 = "";
	var anicode2 = "";
	if(targetRow!=""){
		anicode1 = $("#order_tbody div#MAC_ANICODE1_DIV").eq(targetRow).attr('data-val');	
		anicode2 = $("#order_tbody div#MAC_ANICODE2_DIV").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("family_tbody");

	var targetUrl = "/base/0106/selectFamilyList.do";
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

function fn_base_selectFamilyList_P(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var anicode1 = "";
	var anicode2 = "";
	if(targetRow!=""){
		anicode1 = $("#m_body div#MAC_ANICODE1_DIV_P").eq(targetRow).attr('data-val');	
		anicode2 = $("#m_body div#MAC_ANICODE2_DIV_P").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("g_body");

	var targetUrl = "/base/0106/selectFamilyList.do";
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

function fn_base_selectSpeciesList(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var anicode1 = "";
	var anicode2 = "";
	var anicode3 = "";
	if(targetRow!=""){
		anicode1 = $("#family_tbody div#MAC_ANICODE1_DIV").eq(targetRow).attr('data-val');	
		anicode2 = $("#family_tbody div#MAC_ANICODE2_DIV").eq(targetRow).attr('data-val');	
		anicode3 = $("#family_tbody div#MAC_ANICODE3_DIV").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("species_tbody");

	var targetUrl = "/base/0106/selectSpeciesList.do";
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

function fn_base_selectAniClsInfo(targetRow){
	console.log("targetRow====>" + targetRow);
	var param = {
			mac_aniclscode:$("#species_tbody div#MAC_ANICLSCODE_DIV").eq(targetRow).attr('data-val')
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
		fn_base_selectClassList(param, selectClassList);
	}else if(param.schType=="2"){
		fc_clearRow("class_tbody");
		fn_base_selectOrderList("", selectOrderList);
	}else if(param.schType=="3"){
		fc_clearRow("order_tbody");
		fn_base_selectFamilyList("", selectFamilyList);
	}else if(param.schType=="4"){
		fc_clearRow("family_tbody");
		fn_base_selectSpeciesList("", selectSpeciesList);
	}
}	

function fn_aniInfo_search(){
	
	fn_layer_show();
	
	var param = {
			schType : $('#sch_tbody input:radio[name=schType]:checked').val()
	};
	console.log(param.schType);
	if(param.schType=="1"){
		fn_base_selectClassList_P(param, selectClassList_P);
	}else if(param.schType=="2"){
		fc_clearRow("p_body");
		fn_base_selectOrderList_P("", selectOrderList_P);
	}else if(param.schType=="3"){
		fc_clearRow("m_body");
		fn_base_selectFamilyList_P("", selectFamilyList_P);
	}	
}

function test(){
	fc_clearRow("family_tbody");
	fc_clearRow("species_tbody");
	HideTable('ani_info_update');
}

function fn_layer_show() {
	$(".layer_box").show();
	$(".layer_popup").show();
	var width_size = $(".layer_box").innerWidth()/2;
	$(".layer_box").css("margin-left",-width_size);
}

$(document).ready(function() {
	HideTable('ani_info_update');
	
	if(fn_is_pms_upd('0106')){
		$(".add_btn").css("display","");
		$(".save_btn").css("display","");
		$(".cancel_btn").css("display","");
	}
});
</script>

<title>기본정보 &gt; 동물그룹</title>
</head>
<body>
<div id="sub_wrap">
	<!-- header -->
    <div id="header_wrap">
	<jsp:include page="/header.do"></jsp:include>
	</div>
	<!-- //header -->
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<div id="lnb_area">
				<!-- mypage -->
				<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">동물그룹</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 동물그룹</li>
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
								<col style="width:40%;">
								<col style="width:70%;">
							</colgroup>
                            <tbody id="sch_tbody">
                            <tr>
                                <th scope="row">분류 구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="schType" name="schType" value="1" class="search_radio" checked/>강</label>
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
					<!-- 분류검색표-->
					
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
							<tbody id="class_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
									<td onclick="javascript:test();">
										<div id="MAC_ANICODE1_DIV" data-val=''></div>
										<a href="javascript:;"><div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectOrderList($(this).attr('data-val'), selectOrderList);"></div></a>
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
								<tbody id="order_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICODE1_DIV" data-val=''></div>
											<div id="MAC_ANICODE2_DIV" data-val=''></div>
											<a href="javascript:;"><div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectFamilyList($(this).attr('data-val'), selectFamilyList);"></div></a>
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
								<tbody id="family_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICODE1_DIV" data-val=''></div>
											<div id="MAC_ANICODE2_DIV" data-val=''></div>
											<div id="MAC_ANICODE3_DIV" data-val=''></div>
											<a href="javascript:;">
											<div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectSpeciesList($(this).attr('data-val'), selectSpeciesList);"></div></a>
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
									<tr><th scope="col">종 
									<a href="javascript:fn_aniInfo_search();" class="add_btn" style="display: none;">변경</a>
									</th></tr>
								</thead>	
								<tbody id="species_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td onclick="ShowTable('ani_info_update')">
											<div id="MAC_ANICLSCODE_DIV" data-val=''></div>
											<a href="javascript:;"><div id="MAC_NAME_DIV" data-val='' onclick="javascript:fn_base_selectAniClsInfo($(this).attr('data-val'));"></div></a>
										</td>
									</tr>
								</tbody>
							</table>							
						</div>
						
						<!-- //그룹항목표-->
					
						<!-- 상세정보표-->
						<div class="ani_info_box">
							<!-- 종그룹보기-->				
							
							<table class="ani_info infotable" id="ani_info_update" > 

								<caption>동물그룹상세정보</caption>
								<colgroup>
									<col style="width:30%;">
									<col style="width:80%;">
								</colgroup>
								
								<thead>
									<tr><th colspan="3" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
									</th></tr>
								</thead>
								<tbody id="aniClsInfo_tbody">
									<tr><th scope="row">강정보</th><td><div id="CLS1_NAME_DIV" data-val=''></div></td>
									<tr><th scope="row">목정보</th><td><div id="CLS2_NAME_DIV" data-val=''></div></td>
									<tr><th scope="row">과정보</th><td><div id="CLS3_NAME_DIV" data-val=''></div></td>
									<tr><th scope="row">종번호</th><td><div id="MAC_ANICLSCODE_DIV" data-val=''></div></td>
									<tr><th scope="row">종명칭</th><td><input type="text" name="CLS4_NAME" id="CLS4_NAME" class="textfield" size="30"/></td></tr>
									<tr><th scope="row">영명</th><td><input type="text" name="MAC_ENAME" id="MAC_ENAME" class="textfield"/></td></tr>
									<tr><th scope="row">학명</th><td><input type="text" name="MAC_SNAME" id="MAC_SNAME" class="textfield" style="font-style: italic;"/></td></tr>
									<tr><th scope="row">CITES</th>
										<td>	
											<select name="MAC_CITES" id="MAC_CITES">
											<option value="">-- CITES 선택 --</option>
										<c:forEach var="citesList" items="${citesList }" varStatus="st" >
											<option value="${citesList.MCC_S_CODE}">${citesList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td>
									</tr>
									<tr><th scope="row">멸종위기</th>
										<td>			
											<select name="MAC_ENDANG" id="MAC_ENDANG">
											<option value="">-- 멸종위기 선택 --</option>
											<c:forEach var="endangList" items="${endangList }" varStatus="st" >
											<option value="${endangList.MCC_S_CODE}">${endangList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td>
									</tr>
									
									<tr><th scope="row">천연기념물</th><td>
									<input type="text" id="MAC_NATMON" name="MAC_NATMON" class="textfield" style="width: 150px;"></td></tr>
									
									<tr><th scope="row">등급</th><td> 		
											<select name='MAC_RANK' id="MAC_RANK">
											<option value="">-- 등급 선택 --</option>
											<c:forEach var="rankList" items="${rankList }" varStatus="st" >
											<option value="${rankList.MCC_S_CODE}">${rankList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
									</td></tr>
									
									<tr><th scope="row">평가내용</th><td>
											<select name="MAC_ESTM_TYPE" id="MAC_ESTM_TYPE">
											<option value="">-- 평가내용 선택 --</option>
											<c:forEach var="estmList" items="${estmList }" varStatus="st" >
											<option value="${estmList.MCC_S_CODE}">${estmList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
									</td></tr>
									
									<tr><th scope="row">원산지</th><td>
									<input type="text" id="MAC_ORGPLACE" name="MAC_ORGPLACE" class="textfield" style="width: 150px;"></td></tr>
									<tr><th scope="row">임신기간</th><td>
									<input type="number" id="MAC_GEST_MON" name="MAC_GEST_MON" class="textfield" style="width: 150px;"> 개월</td></tr>
									
									<tr><th scope="row">군집구분</th><td>		
											<select name="MAC_KJJ_TYPE" id="MAC_KJJ_TYPE">
											<option value="">-- 분류 선택 --</option>
											<c:forEach var="kjjList" items="${kjjList }" varStatus="st" >
											<option value="${kjjList.MCC_S_CODE}">${kjjList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
									</td></tr>
									<tr><th scope="row">개체수</th><td>
									<input type="number" id="day_text" name="num" class="textfield" style="width: 150px;"> 마리</td></tr>
									<tr><th scope="row">평균수명(사육)</th><td>
									<input type="number" id="MAC_SY_MEANLF" name="MAC_SY_MEANLF" style="width: 150px;"></td></tr>
									<tr><th scope="row">평균수명(야생)</th><td>
									<input type="number" id="MAC_WY_MEANLF" name="MAC_WY_MEANLF" style="width: 150px;"></td></tr>
								</tbody>
							</table>
							<!-- //상세정보수정-->
						</div>
						<!-- //상세정보표-->
					</div>
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
		
	<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer01 -->
		<div class="layer_box2" id="layer01" style="width:500px;">
			<div class="layer_tit">중복체크</div>
				<div class="layer_con">
					<div class="popuptext_box">
                        사용할 수 없는 강번호 입니다.<br>(강번호 A~Z 대문자 한자리 입력가능)
					</div>
					<div class="btn_area">
						<a href="#none" class="popent_btn">확인</a>
					</div>	
			</div>
			<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		
		<div class="layer_box" id="layer01_1" style="width:500px; margin-top:250px;">
			<div class="layer_tit">중복체크</div>
				<div class="layer_con">
					<div class="popuptext_box">
                        사용가능한 강번호 입니다.<br>계속하시겠습니까?

					</div>
					<div class="btn_area">
						<a href="#none" class="popent_btn">확인</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>	
			</div>
			<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01 -->	
		
		<!-- #layer02 -->
		<div class="layer_box" id="layer02" style="width:800px;">
			<div class="layer_tit">동물그룹 정보변경</div>
				<div class="layer_con">
					<div class="table_box">
						<table class="ani_list anigrouppop" style="width:760px;">
							<caption>동물그룹정보변경</caption>
							<colgroup>
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="info0"></th>
									<th scope="col" id="info1">강</th>
									<th scope="col" id="info2">목</th>
									<th scope="col" id="info3">과</th>
									<th scope="col" id="info4">종</th>
								</tr>
							</thead>
							<tbody id="before_tbody">
								<tr><th id="before" headers="info0">변경전</th>
								<td><div id="CLS1_NAME_DIV_B" data-val=''></div></td>
								<td><div id="CLS2_NAME_DIV_B" data-val=''></div></td>
								<td><div id="CLS3_NAME_DIV_B" data-val=''></div></td>	
								<td><div id="MAC_NAME_DIV_B" data-val=''></div></td>					
								</tr>
								
								<tr><th id="after" headers="info0">변경후</th>
								<td headers="after info1">조강</td>
								<td headers="after info2">타조목</td>
								<td headers="after info3"></td>
								<td headers="after info4"></td></tr>
							</tbody>
						</table>
					</div>
					
					<div class="table_box">
                       <table class="ani_list category">
							<caption>강그룹</caption>
							<colgroup>
								<col style="width:100%" />
							</colgroup>
							<thead>
								<tr><th scope="col">강</th></tr>
							</thead>
							<tbody id="p_body">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
								<td>
								<div id="MAC_ANICODE1_DIV_P" data-val=''></div>
								<a href="#"><div id="MAC_NAME_DIV_P" data-val='' onclick="javascript:fn_base_selectOrderList_P($(this).attr('data-val'), selectOrderList_P);"></div></a>
								</td>
								</tr>								
							</tbody>
						</table>
						<table class="ani_list category" >
								<caption>목그룹</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">목<a href="#" class="all_btn">전체</a></th></tr>
								</thead>
								<tbody id="m_body">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICODE1_DIV_P" data-val=''></div>
											<div id="MAC_ANICODE2_DIV_P" data-val=''></div>
											<a href="#"><div id="MAC_NAME_DIV_P" data-val='' onclick="javascript:fn_base_selectFamilyList_P($(this).attr('data-val'), selectFamilyList_P);"></div></a>
										</td>
									</tr>
								</tbody>
							</table>					
						<table class="ani_list category" >
								<caption>과그룹</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">과<a href="#" class="all_btn">전체</a></th></tr>
								</thead>
								<tbody id="g_body">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td>
											<div id="MAC_ANICODE1_DIV_P" data-val=''></div>
											<div id="MAC_ANICODE2_DIV_P" data-val=''></div>
											<div id="MAC_ANICODE3_DIV_P" data-val=''></div>
											<a href="#"><div id="MAC_NAME_DIV_P" data-val='' onclick="javascript:fn_base_selectAniClsInfo_P($(this).attr('data-val'));"></div></a>
										</td>
									</tr>
								</tbody>
							</table>							
					</div>
					<div class="btn_area">
						<a href="#layer03" class="popent_btn layer_open popnext">확인</a>
						<a href='#' class="popcancel_btn btn_type2">취소</a>
					</div>	
			</div>
			<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
	<!-- //#layer02 -->	
	
	<!-- #layer03 -->
		<div class="layer_box3" id="layer03" style="width:800px;">
			<div class="layer_tit">동물그룹 변경확인</div>
				<div class="layer_con">
					<div class="popuptext_box" style="margin-bottom:20px;">
                        동물그룹을 변경하시겠습니까?<br>변경시 관련 데이터가 자동으로 업데이트 됩니다.
					</div>
					
					<!-- 동물그룹 변경확인 레이어 -->
					<div class="table_box">
						<table class="ani_list anigrouppop" style="width:760px; margin-bottom:0;">
							<caption>동물그룹정보변경</caption>
							<colgroup>
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="info5"></th>
									<th scope="col" id="info6">강</th>
									<th scope="col" id="info7">목</th>
									<th scope="col" id="info8">과</th>
									<th scope="col" id="info9">종</th>
								</tr>
							</thead>
							<tbody>
								<tr><th id="before1" headers="info5">변경전</th>
								<td headers="before1 info6">조강</td><td headers="before1 info7">타조목</td>
								<td headers="before1 info8">타조과</td><td headers="before1 info9">타조종</td></tr>
								
								<tr><th id="after1" headers="info5">변경후</th>
								<td headers="after1 info6">조강</td><td headers="after1 info7">타조목</td>
								<td headers="after1 info8" class="change_text">레아과</td>
								<td headers="after1 info9" class="change_text">레아종</td></tr>
							</tbody>
						</table>
					</div>
					
					<div class="btn_area">
						<a href="#none" class="popent_btn">확인</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>	
			</div>
			<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
	<!-- //#layer03 -->	
	
	<!-- #layer04 -->
		<div class="layer_box4" id="layer04" style="width:500px;">
			<div class="layer_tit">동물그룹 삭제확인</div>
				<div class="layer_con">
					<div class="popuptext_box">
                        동물그룹을 삭제하시겠습니까?<br>삭제시 하위 그룹 및 관련 데이터가 자동 삭제 됩니다.
					</div>
					<div class="btn_area">
						<a href="#none" class="popent_btn">확인</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>	
			</div>
			<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
	<!-- //#layer04 -->
	</div>
	<!-- // layer_popup -->

	</div>
	<!-- //container -->
	<!-- footer -->
	<div id="footer_wrap">
		<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
</div>
</body>
</html>	