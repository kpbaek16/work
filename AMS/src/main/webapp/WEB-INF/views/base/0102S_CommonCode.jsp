<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html>
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

<script type="text/javascript">
function ShowTable(wtable) {
	eval(wtable).style.display="";
	}

function HideTable(wtable) {
	eval(wtable).style.display="none";
}

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
}
</script>

<title>공통항목관리</title>
</head>
<script type="text/javascript">

function selectCategory(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#category_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("category_tbody"); 
			
			var iRow = (i+1);
			$("#category_tbody div#MCC_L_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#category_tbody div#MCC_L_NAME_DIV").eq(iRow).html(data.MCC_L_NAME + "(" + data.MCC_L_CODE + ")"); 
			$("#category_tbody div#MCC_L_CODE_DIV").eq(iRow).attr('data-val', data.MCC_L_CODE); 
			$("#section_tbody div#MCC_L_CODE_DIV").eq(iRow).attr('data-val', data.MCC_L_CODE)
			$("#division_tbody td#MCC_M_CODE").eq(iRow).attr('data-val', data.MCC_M_CODE);
			$("#category_tbody td#MCC_L_CODE").eq(iRow).attr('data-val', data.MCC_L_CODE);
			
		}
		$("#category_tbody tr:first").attr('style',"display:none");	
 	}
}

function selectDivision(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#division_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("division_tbody");
			
			var iRow = (i+1);
			$("#division_tbody div#MCC_M_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#division_tbody div#MCC_M_NAME_DIV").eq(iRow).html(data.MCC_M_NAME + "(" + data.MCC_M_CODE + ")"); 
			$("#division_tbody div#MCC_L_CODE_DIV").eq(iRow).attr('data-val', data.MCC_L_CODE); 
			$("#division_tbody div#MCC_M_CODE_DIV").eq(iRow).attr('data-val', data.MCC_M_CODE); 
			$("#section_tbody div#MCC_M_CODE_DIV").eq(iRow).attr('data-val', data.MCC_M_CODE);
			$("#division_tbody td#MCC_M_CODE").eq(iRow).attr('data-val', data.MCC_M_CODE); 
			$("#div_layer div#test2").html(data.MCC_L_CODE + "(" + data.MCC_L_NAME + ")"); 
		}
		$("#division_tbody tr:first").attr('style',"display:none");
 	}
}

function selectSection(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#section_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("section_tbody");
			
			var iRow = (i+1);
			$("#section_tbody div#MCC_S_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#section_tbody div#MCC_S_NAME_DIV").eq(iRow).html(data.MCC_S_NAME + "(" + data.MCC_S_CODE + ")"); 
			$("#section_tbody div#MCC_L_CODE_DIV").eq(iRow).attr('data-val', data.MCC_L_CODE); 
			$("#section_tbody div#MCC_M_CODE_DIV").eq(iRow).attr('data-val', data.MCC_M_CODE); 
			$("#section_tbody div#MCC_S_CODE_DIV").eq(iRow).attr('data-val', data.MCC_S_CODE); 
			$("#sec_layer div#sec_L_div").html(data.MCC_L_CODE + "(" + data.MCC_L_NAME + ")"); 
			$("#sec_layer div#sec_M_div").html(data.MCC_M_CODE + "(" + data.MCC_M_NAME + ")"); 
			
		}
		$("#section_tbody tr:first").attr('style',"display:none");
 	}
}

function getSectionInfo(o, callback, retObj){
	var param = {
			MCC_L_CODE:o.MCC_L_CODE,
			MCC_M_CODE:o.MCC_M_CODE,
			MCC_S_CODE:o.MCC_S_CODE
	};
	$.ajax({
		type : "POST",
		url : "/base/0102/getSectionInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#section_tbody_info div#MCC_L_CODE_DIV").attr('data-val', data.MCC_L_CODE); 
			$("#section_tbody_info div#MCC_M_CODE_DIV").attr('data-val', data.MCC_M_CODE); 
			$("#section_tbody_info div#MCC_S_CODE_DIV").attr('data-val', data.MCC_S_CODE); 
			$("#section_tbody_info div#section_number").html(data.MCC_S_CODE); 
			$("#section_tbody_info input[name=section_name]").val(data.MCC_S_NAME); 
			$("#section_tbody_info input[name=section_order]").val(data.MCC_SORT_ORDER); 
			$("#section_tbody_info input[name=section_tname1]").val(data.MCC_COM_S1); 
			$("#section_tbody_info input[name=section_tname2]").val(data.MCC_COM_S2); 
			$("#section_tbody_info input[name=section_tname3]").val(data.MCC_COM_S3); 
			$("#section_tbody_info input[name=section_num1]").val(data.MCC_COM_N1); 
			$("#section_tbody_info input[name=section_num2]").val(data.MCC_COM_N2); 
			
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
}

function Category_Info(MCC_L_CODE, callback, retObj){
	var param = {
			MCC_L_CODE:MCC_L_CODE
	};
	$.ajax({
		type : "POST",
		url : "/base/0102/getCategoryInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#cinfo_tbody div#CODE_DIV").html(data.MCC_L_CODE); 
			$("#cinfo_tbody #DIV_NAME").val(data.MCC_L_NAME); 
			
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
}

function division_Info(MCC_M_CODE, callback, retObj){
	var param = {
			MCC_M_CODE:MCC_M_CODE
	};
	$.ajax({
		type : "POST",
		url : "/base/0102/getDivisionInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#dinfo_tbody div#CODE_DIV").html(data.MCC_M_CODE); 
			$("#dinfo_tbody #DIV_NAME").val(data.MCC_M_NAME); 
			
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
}

function fn_base_selectCategory(param, callback, retObj) {
	fc_clearRow("category_tbody");
	var targetUrl = "/base/0102/selectCategory.do";
	var param = {
			schKeyword:$("#sch_tbody #schKeyword").val(),
			schType : "Category"
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectDivision(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var MCC_L_CODE = "";
	if(targetRow!=""){
		MCC_L_CODE = $("#category_tbody div#MCC_L_CODE_DIV").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("division_tbody");

	var targetUrl = "/base/0102/selectDivision.do";
	var param = {
			MCC_L_CODE:MCC_L_CODE,
			schKeyword:$("#sch_tbody #schKeyword").val(),
			schType : "Division"
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectSection(targetRow, callback, retObj) {
	console.log("targetRow====>" + targetRow);
	var MCC_L_CODE = "";
	var MCC_M_CODE = "";
	if(targetRow!=""){
		MCC_L_CODE = $("#division_tbody div#MCC_L_CODE_DIV").eq(targetRow).attr('data-val');	
		MCC_M_CODE = $("#division_tbody div#MCC_M_CODE_DIV").eq(targetRow).attr('data-val');	
	}

	fc_clearRow("section_tbody");

	var targetUrl = "/base/0102/selectSection.do";
	var param = {
			MCC_L_CODE : MCC_L_CODE,
			MCC_M_CODE : MCC_M_CODE,
			schKeyword:$("#sch_tbody #schKeyword").val(),
			schType : "Section"
	};
	console.log(JSON.stringify(param));
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_getSectionInfo(targetRow){
	console.log("targetRow====>" + targetRow);
	var param = {
			MCC_L_CODE:$("#section_tbody div#MCC_L_CODE_DIV").eq(targetRow).attr('data-val'),
			MCC_M_CODE:$("#section_tbody div#MCC_M_CODE_DIV").eq(targetRow).attr('data-val'),
			MCC_S_CODE:$("#section_tbody div#MCC_S_CODE_DIV").eq(targetRow).attr('data-val')
	};
	var validate = function validate(data){
		if(data!=null){
	 		return;
		}else{
	 	}
	}
	getSectionInfo(param, validate);
	HideTable('division_table');
}	

function fn_base_search(){
	var param = {
			schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
			schKeyword : $("#sch_tbody #schKeyword").val()
	};
	console.log(param.schType);
	if(param.schType=="Category"){
		fn_base_selectCategory(param, selectCategory);
	}else if(param.schType=="Division"){
		fc_clearRow("category_tbody");
		fn_base_selectDivision("", selectDivision);
	}else if(param.schType=="Section"){
		fc_clearRow("division_tbody");
		fn_base_selectSection("", selectSection);
	}
	fc_clearRow("section_tbody");
	fc_clearRow("division_tbody");
}	

function reset(){
	fc_clearRow("section_tbody");
	HideTable('comm_table_update');
}

function fn_base_division_Info(targetRow){
	console.log("targetRow====>" + targetRow);
	var param = {
			MCC_M_CODE:targetRow
	};
	var validate = function validate(data){
		if(data!=null){
	 		return;
		}else{
	 	}
	}
	division_Info(param.MCC_M_CODE, validate);
	ShowTable('division_table');
	HideTable('comm_table_update');
}

function fn_base_CategoryInfo(targetRow){
	console.log("targetRow====>" + targetRow);
	var param = {
			MCC_L_CODE:targetRow
	};
	var validate = function validate(data){
		if(data!=null){
	 		return;
		}else{
	 	}
	}
	Category_Info(param.MCC_L_CODE, validate);
	ShowTable('category_table');
	HideTable('division_table');
	fc_clearRow("section_tbody");
	HideTable('comm_table_update');
}
	$(document).ready(function() {
		HideTable('comm_table_update');
		
		if(fn_is_pms_upd(0102)){
			$(".add_btn").css("display","");
			$(".save_btn").css("display","");
			$(".cancel_btn").css("display","");
			$(".popent_btn").css("display","");
			$(".popcancel_btn").css("display","");
		}
	});
	
	function fn_layer_show() {
		$("#layer01").show();
		$(".layer_popup").show();
		var width_size = $("#layer01").innerWidth()/2;
		$("#layer01").css("margin-left",-width_size);
	}
	
	function fn_layer_show2() {
		$("#layer02").show();
		$(".layer_popup").show();
		var width_size = $("#layer02").innerWidth()/2;
		$("#layer02").css("margin-left",-width_size);
	}
	
	function fn_layer_show3() {
		$("#layer03").show();
		$(".layer_popup").show();
		var width_size = $("#layer03").innerWidth()/2;
		$("#layer03").css("margin-left",-width_size);
	}
</script>

<body>
<div id="sub_wrap">
<jsp:include page="/header.do"></jsp:include>
	<div id="container">
		<div id="contents">
			<div id="lnb_area">
				<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">공통코드</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home" style="margin-top: 10px;"></li>
                        <li>> 기본정보</li>
                        <li>> 공통코드</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="search_table" >
							<caption>분류구분 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
                            <tr>
                                <th scope="row">분류 구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="schType" name="schType" value="Category" class="search_radio" checked/>대분류</label>
                                  <label><input type="radio" id="schType" name="schType" value="Division" class="search_radio" />중분류</label>
                                  <label><input type="radio" id="schType" name="schType" value="Section" class="search_radio" />소분류</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류 명칭</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn" style="margin-top: 5px;">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<!-- //분류검색표-->
					
					<!-- 공통코드 일람-->
					<div class="table_wrap">
						<!-- 공통코드항목표-->
						<p class="sub_title"> 분류정보리스트</p>					
						<table class="ani_list category" >
							<caption>대분류</caption>
							<colgroup>
								<col style="width:100%" />
							</colgroup>
							<thead>
								<tr><th scope="col">대분류
								<a href="javascript:fn_layer_show();" class="add_btn" style="display: none;">추가</a></th></tr>
							</thead>
							<tbody id="category_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td id="MCC_L_CODE" data-val='' onclick="javascript:fn_base_CategoryInfo($(this).attr('data-val'));">
											<div id="MCC_L_CODE_DIV" data-val=''></div>
											<a href="javascript:;">
											<div id="MCC_L_NAME_DIV" data-val='' onclick="javascript:fn_base_selectDivision($(this).attr('data-val'), selectDivision);" ></div></a>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																														</div></a>
										</td>
									</tr>
							</tbody>
						</table>
					</div>
					<div>							
							<table class="ani_list" style="width:17%">
								<caption>중분류</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead id="test_thead">
									<tr><th scope="col" >중분류
									<a href="javascript:fn_layer_show2();" class="add_btn" style="display: none;">추가
									<div id="test" data-val='' onclick="javascript:test($(this).attr('data-val'));"></div></a></th></tr>
								</thead>
								<tbody id="division_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td id="MCC_M_CODE" data-val='' onclick="javascript:fn_base_division_Info($(this).attr('data-val'));">
											<div id="MCC_L_CODE_DIV" data-val=''></div>
											<div id="MCC_M_CODE_DIV" data-val=''></div>
											<a href="javascript:;"><div id="MCC_M_NAME_DIV" data-val='' onclick="javascript:fn_base_selectSection($(this).attr('data-val'), selectSection);"></div></a>
										</td>
									</tr>
								</tbody>
							</table>							
						</div>
						
						<div>							
							<table class="ani_list" style="width:22%">
								<caption>소분류</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">소뷴류
									<a href="javascript:fn_layer_show3();" class="add_btn" style="display: none;">추가</a></th></tr>
								</thead>
								<tbody id="section_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										<td onclick="ShowTable('comm_table_update')">
											<div id="MCC_L_CODE_DIV" data-val=''></div>
											<div id="MCC_M_CODE_DIV" data-val=''></div>
											<div id="MCC_S_CODE_DIV" data-val=''></div>
											<a href="javascript:;"><div id="MCC_S_NAME_DIV" data-val='' onclick="javascript:fn_base_getSectionInfo($(this).attr('data-val'));"></div></a>
										</td>
									</tr>
								</tbody>
							</table>							
						</div>		
						
						<!-- 상세정보표-->
						<div class="ani_info_box">
						<!-- 대분류 상세-->	
							<table class="ani_info infotable" id="category_table" > 
								<caption>대분류 상세</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
								</thead>
								<tbody id ="cinfo_tbody">
								<tr><th scope="row">대분류 번호</th><td><div id="CODE_DIV" data-val=''></div></td></tr>
								<tr><th scope="row">대분류 명칭</th><td><input type="text" id="DIV_NAME" name="DIV_NAME" class="textfield"></td></tr>	
							   </tbody>
							</table>
							<!-- 대분류 상세-->
						
						<!-- 중분류 상세-->
							<table class="ani_info infotable" id="division_table" > 
								<caption>중분류 상세</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
								</thead>
								<tbody id ="dinfo_tbody">
								<tr><th scope="row">중분류 번호</th><td><div id="CODE_DIV" data-val=''></div></td></tr>
								<tr><th scope="row">중분류 명칭</th><td><input type="text" id="DIV_NAME" name="DIV_NAME" class="textfield"></td></tr>	
							   </tbody>
							</table>
							<!-- 중분류 상세-->
							
							<!-- 소분류 상세 -->
							<table class="ani_info infotable" id="comm_table_update" > 
								<caption>공통코드상세정보</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
								</thead>
								<tbody id ="section_tbody_info">
								<tr><th scope="row">소분류 번호</th><td><div id="section_number" data-val=''></div></td></tr>
								<tr><th scope="row">소분류 명칭</th><td><input type="text" id="section_name" name="section_name" class="textfield"></td></tr>
								<tr><th scope="row">정렬 순서</th><td><input type="text" id="section_order" name="section_order" class="textfield"></td></tr>
								<tr><th scope="row">문자값 1</th><td><input type="text" id="section_tname1" name="section_tname1" class="textfield"></td></tr>
								<tr><th scope="row">문자값 2</th><td><input type="text" id="section_tname2" name="section_tname2" class="textfield"></td></tr>
								<tr><th scope="row">문자값 3</th><td><input type="text" id="section_tname3" name="section_tname3" class="textfield"></td></tr>
								<tr><th scope="row">숫자값 1</th><td><input type="text" id="section_num1" name="section_num1" class="textfield"></td></tr>
								<tr><th scope="row">숫자값 2</th><td><input type="text" id="section_num2" name="section_num2" class="textfield"></td></tr>
							   </tbody>
							</table>
							<!-- 소분류 상세 -->
						</div>
						<!-- //상세정보표-->
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
			<div class="layer_tit">대분류 추가</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search table_view" style="width:760px;" >
							<caption>대분류 추가</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">대분류 번호</th><td><input type="text" class="textfield" style="width:50%"> 
									<a href="#javascript:;" class="check_btn">중복체크</a></td>
								</tr>
								<tr>
									<th scope="row">대분류 명칭</th><td><input type="text" class="textfield" style="width:50%">
								</td>
								</tr>
                            </tbody>
                        </table>
					</div>
					
					<div class="btn_area">
						<a href="#javascript:;" class="popent_btn">저장</a>&nbsp;
						<a href="#javascript:;" class="popcancel_btn" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="javascript:;" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
		
		<!-- #layer02 -->
		<div class="layer_box" id="layer02" style="width:800px;">
			<div class="layer_tit">중분류 추가</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search table_view" style="width:760px;" >
							<caption>중분류 추가</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody id="div_layer">
								<tr>
									<th scope="row">대분류 정보</th><td><div id="test2" data-val=''></div></td>
								</tr>
								<tr>
								<th scope="row">중분류 번호</th><td><input type="text" class="textfield" style="width:50%">
									<a href="#javascript:;" class="check_btn">중복체크</a></td>
								</tr>
								<tr>
								<th scope="row">중분류 명칭</th><td><input type="text" class="textfield" style="width:50%">
								</tr>
                            </tbody>
                        </table>
					</div>
					
					<div class="btn_area">
						<a href="#javascript:;" class="popent_btn">저장</a>&nbsp;
						<a href="#javascript:;" class="popcancel_btn" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="javascript:;" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer02-->
		
		<!-- layer03 -->
		<div class="layer_box" id="layer03" style="width:800px;">
			<div class="layer_tit">소분류 추가</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search table_view" style="width:760px;" >
							<caption>소분류 추가</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody id="sec_layer">
                            	<tr>
									<th scope="row">대분류 정보</th><td><div id="sec_L_div" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">중분류 정보</th><td><div id="sec_M_div" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">소분류 번호</th><td><input type="text" class="textfield" style="width:50%">
									<a href="#javascript:;" class="check_btn">중복체크</a></td>
								</tr>
								<tr>
									<th scope="row">소분류 명칭</th><td><input type="text" class="textfield" style="width:50%"></td>
								</tr>
								<tr>
									<th scope="row">정렬 순서</th><td><input type="text" class="textfield" style="width:50%" value="0"></td>
								</tr>
								<tr>
									<th scope="row">문자값 1</th><td><input type="text" class="textfield" style="width:50%"></td>
								</tr>
								<tr>
									<th scope="row">문자값 2</th><td><input type="text" class="textfield" style="width:50%"></td>
								</tr>
								<tr>
									<th scope="row">문자값 3</th><td><input type="text" class="textfield" style="width:50%"></td>
								</tr>
								<tr>
									<th scope="row">숫자값 1</th><td><input type="text" class="textfield" style="width:50%" value="0"></td>
								</tr>
								<tr>
									<th scope="row">숫자값 2</th><td><input type="text" class="textfield" style="width:50%" value="0"></td>
								</tr>
                            </tbody>
                        </table>
					</div>
					
					<div class="btn_area">
						<a href="#javascript:;" class="popent_btn">저장</a>&nbsp;
						<a href="#javascript:;" class="popcancel_btn" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="javascript:;" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
		<!-- //layer03-->
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