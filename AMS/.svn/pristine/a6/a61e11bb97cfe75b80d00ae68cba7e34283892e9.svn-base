<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>

<!doctype html>
<html lang="ko">
<head>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/html5shiv.js"></script>
<script type="text/javascript" src="/js/contents/base.js"></script>
<script src="/js/common/common.js"></script> 
<style>
a:focus { outline:none; }
</style>

<script type="text/javascript">

function ShowTable(wtable) {
	eval(wtable).style.display="";
	}

function HideTable(wtable) {
	eval(wtable).style.display="none";
}

function selectClsList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#cls_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("cls_tbody"); 
			
			var iRow = (i+1);
			/* alert(data.MDI_CLSCODE); */
			$("#cls_tbody div#MDI_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#cls_tbody div#MDI_NAME_DIV").eq(iRow).html(data.MDI_NAME);
			$("#cls_tbody td#MDI_CLSCODE").eq(iRow).attr('data-val', data.MDI_CLSCODE); 
		}
		$("#cls_tbody tr:first").attr('style',"display:none");
 	}
}

function selectDrugList(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		$("#drug_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("drug_tbody");
			
			var iRow = (i+1);
			$("#drug_tbody div#MDI_NAME_DIV").eq(iRow).attr('data-val', iRow); 
			$("#drug_tbody div#MDI_NAME_DIV").eq(iRow).html(data.MDI_NAME); 
			$("#drug_tbody div#MDI_DRUGCODE_DIV").eq(iRow).attr('data-val', data.MDI_DRUGCODE);
			$("#med_tbody div#mgrp_num").html(data.MDI_CLSCODE);
			$("#med_tbody div#mprd_num").html(data.SEQNUMBER);
		}
		$("#drug_tbody tr:first").attr('style',"display:none");
 	}
}

function selectClsInfo(MDI_CLSCODE, callback, retObj){
	var param = {MDI_CLSCODE:MDI_CLSCODE};
	$.ajax({
		type : "POST",
		url : "/base/0110/selectClsInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#clsinfo_tbody div#MDI_CLSCODE_DIV").html(data.MDI_CLSCODE); 
			$("#clsinfo_tbody input[name=gname]").val(data.MDI_NAME); 
			
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
	/* ShowTable('group_table'); */
	HideTable('drug_table');
}		

function selectDrugInfo(MDI_DRUGCODE, callback, retObj){
	var param = {MDI_DRUGCODE:MDI_DRUGCODE};
	$.ajax({
		type : "POST",
		url : "/base/0110/selectDrugInfo.do",
		dataType : 'json',
		data : param,
		success : function(data) {
//			alert(JSON.stringify(data));
			console.log(JSON.stringify(data));
			$("#drugInfo_tbody input[name=dname]").val(data.MDI_NAME);	
			$("#drugInfo_tbody #MDI_TYPE").val(data.MDI_TYPE);
			$("#drugInfo_tbody #MDI_UNIT").val(data.MDI_UNIT);
			$("#drugInfo_tbody #MDI_CMNT").val(data.MDI_CMNT);
			$("#drugInfo_tbody input[name=dpurpose").val(data.MDI_PURPOSE);
			$("#drugInfo_tbody input[name=cmnt]").val(data.MDI_CMNT);
			
			if(typeof(callback)=="function"){
				callback.call(retObj, data);
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});	
	ShowTable('drug_table');
}

function fn_base_selectClsList(param, callback, retObj) {
	fc_clearRow("cls_tbody");
	var targetUrl = "/base/0110/selectClsList.do";
	
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectDrugList(MDI_CLSCODE, callback, retObj) {
	console.log("targetRow====>" + MDI_CLSCODE);
	fc_clearRow("drug_tbody");
	
	var targetUrl = "/base/0110/selectDrugList.do";
	var param = {
			schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
			schKeyword : $("#sch_tbody #schKeyword").val(),
			MDI_CLSCODE : MDI_CLSCODE
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectClsInfo(targetRow){
	console.log("targetRow====>" + targetRow);
	var param = {
			MDI_CLSCODE : $("#cls_tbody td#MDI_CLSCODE").eq(targetRow).attr('data-val')
	};
	var validate = function validate(data){
		if(data!=null){
	 		return;
		}else{
	 	}
	}
	selectClsInfo(param.MDI_CLSCODE, validate);
	ShowTable('group_table');
}	

function fn_base_selectDrugInfo(targetRow){
	console.log("targetRow====>" + targetRow);
	var param = {
			MDI_DRUGCODE:$("#drug_tbody div#MDI_DRUGCODE_DIV").eq(targetRow).attr('data-val')
	};
	var validate = function validate(data){
		if(data!=null){
	 		return;
		}else{
	 	}
	}
	selectDrugInfo(param.MDI_DRUGCODE, validate);
}	

function fn_base_search(){
	var param = {
			schType : $('#sch_tbody input:radio[name=schType]:checked').val(),
			schKeyword : $("#sch_tbody #schKeyword").val()
	};
	console.log(param);
	if(param.schType=="grp"){
		fn_base_selectClsList(param, selectClsList);
	}else if(param.schType=="dru"){
		fc_clearRow("cls_tbody");
		fn_base_selectDrugList("", selectDrugList);
	}
}	
$(document).ready(function() {
	
	if(fn_is_pms_upd(0110)){
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

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
	
	// 레이어 닫기 후 셀렉트 박스 옵션 초기화
	$("#med_tbody #MDI_TYPE_L").find('option:first').attr('selected','selected');
	$("#med_tbody #MDI_UNIT_L").find('option:first').attr('selected','selected');
	
	$("#med_tbody #drug_name").val("");
	$("#med_tbody #drug_purpose").val("");
	$("#med_tbody #drug_spec").val("");
}
	</script>
</head>

<body>
<div id="sub_wrap">
	<!-- header -->
	<jsp:include page="/header.do"></jsp:include>
	</div>
	<!-- header -->
	
	<!-- container-->
	<div id="container">
		<div id="contents">
			<div id="lnb_area">
			<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">약품정보</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 약품정보</li>
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
                                <th scope="row">분류구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" id="schType" name="schType" value="grp" class="search_radio" checked="checked"/>그룹</label>
                                  <label><input type="radio" id="schType" name="schType" value="dru" class="search_radio"/>약품</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류명칭</th><td><input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/><label for="schKeyword"></label></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<!-- //분류검색표-->
					
					<!-- 약품 관리-->
					<div class="table_wrap">
						<!-- 약품 관리표-->
						<p class="sub_title">약품 관리</p>					
							<table class="ani_list" style="width:190px;">
							<caption>그룹정보</caption>
							<colgroup>
								<col style="width:100%" />
							</colgroup>
							<thead>
								<tr><th scope="col">그룹정보
								<a href="javascript:;" onclick="javascript:fn_layer_show();" class="add_btn" style="display: none;">추가</a></th></tr>
							</thead>
							<tbody id="cls_tbody">
								<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');" >
								<td id="MDI_CLSCODE" data-val='' onclick="javascript:fn_base_selectClsInfo($(this).attr('data-val'));">
								<a href="javascript:;">
								<div id="MDI_NAME_DIV" data-val='' onclick="javascript:fn_base_selectDrugList($(this).attr('data-val'), selectDrugList);"></div></a>
								</td></tr>
							</tbody>
						</table>

						<div>							
							<table class="ani_list" style="width:350px;">
								<caption>약품명칭</caption>
								<colgroup>
								 	<col style="width:100%" />
								</colgroup>
									<thead>
									<tr><th scope="col">약품명칭
									<a href="javascript:;" onclick="javascript:fn_layer_show2();" class="add_btn" style="display: none;">추가</a></th></tr>
								</thead>
								<tbody id="drug_tbody">
									<tr style="display:none" onClick="fc_HighLightTR(this, '#c9cc99','cc3333');">
										 <td onclick="HideTable('group_table');">
											<div id="MDI_DRUGCODE_DIV" data-val=''></div>
											<a href="javascript:;">
											<div id=MDI_NAME_DIV data-val='' onclick="javascript:fn_base_selectDrugInfo($(this).attr('data-val'));"></div></a>
										</td>
									</tr>
								</tbody>
							</table>					
						</div>
						
						<div class="ani_info_box">
							<!-- 그룹 관리상세정보-->
							<table class="ani_info infotable" id="group_table" style="display:none;" >
							<caption>그룹 관리상세정보</caption>
								<colgroup>
									<col style="width:30%" />
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">그룹정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
								</thead>
								<tbody id="clsinfo_tbody">
									<tr><th scope="row">그룹번호</th><td><div id="MDI_CLSCODE_DIV"></div></td></tr>
									<tr><th scope="row">그룹이름</th><td>
									<input type="text" name = "gname" id="gname" class="textfield"/></td></tr>
								</tbody>
							</table>
							
							<table class="ani_info infotable"id="drug_table" style="display:none;">
							<caption>약품 관리상세정보</caption>
								<colgroup>
									<col style="width:30%" />
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col">
									<span class="info_title">상세정보</span>
									<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
									<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a>
									</th></tr>
								</thead>
								<tbody id="drugInfo_tbody">
									<tr><th scope="row">약품명</th><td>
									<input type="text" name = "dname" id="dname" class="textfield"/></td></tr>
									<tr><th scope="row">구분</th>
										<td>	
											<select name="MDI_TYPE" id="MDI_TYPE">
											<option value="">-- 약품구분 선택  --</option>	
											<c:forEach var="typeList" items="${typeList }" varStatus="st">
											<option value="${typeList.MCC_S_CODE}">${typeList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td>
									</tr>
									<tr><th scope="row">단위</th>
										<td>			
											<select name="MDI_UNIT" id="MDI_UNIT">
											<option value="">-- 약품단위 선택 --</option>
											<c:forEach var="unitList" items="${unitList }" varStatus="st">
											<option value="${unitList.MCC_S_CODE}">${unitList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td>
									</tr>
									<tr><th scope="row">용도</th><td>
									<input type="text" id="dpurpose" name="dpurpose" class="textfield"/></td></tr>
									
									<tr><th scope="row">특기사항</th><td>
									<input type="text" id="cmnt" name="cmnt" class="textfield"/></td></tr>
								</tbody>
									</table>
						</div>
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
		<div class="layer_box" id="layer01" style="width:800px;">
			<div class="layer_tit">약품 그룹 추가</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search table_view" style="width:760px;" >
							<caption>약품 그룹 추가</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							
                            <tbody id="vcn_layer">
								<tr>
									<th scope="row">약품 그룹 번호</th><td>${Number.MAXNUM }</td>
								</tr>
								<tr>
									<th scope="row">약품 그룹 명칭</th><td><input type="text" class="textfield" style="width:50%" id='vcn_name'></td>
								</tr>
                            </tbody>
                        </table>
					</div>
					
					<div class="btn_area">
						<a href="#javascript:;" class="popent_btn">저장</a>&nbsp;
						<a href="#javascript:;" class="popcancel_btn" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
		
		<!-- #layer02 -->
		<div class="layer_box" id="layer02" style="width:800px;">
			<div class="layer_tit">약품 정보 추가</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search table_view" style="width:760px;" >
							<caption>약품 정보 추가</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							
                            <tbody id="med_tbody">
								<tr>
									<th scope="row">약품 그룹 번호</th><td><div id="mgrp_num" data-val=''></div></td>
								</tr>
								<tr>
									<th scope="row">약품 번호</th><td><div id="mprd_num"></div></td>
								</tr>
								<tr>
									<th scope="row">약품 명칭</th><td><input type="text" class="textfield" style="width:50%" id='drug_name'></td>
								</tr>
								<tr><th scope="row">구분</th>
										<td>	
											<select name="MDI_TYPE_L" id="MDI_TYPE_L">
											<option value="">-- 약품구분 선택 --</option>	
											<c:forEach var="typeList" items="${typeList }" varStatus="st">
											<option value="${typeList.MCC_S_CODE}">${typeList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td>
									</tr>
								<tr><th scope="row">단위</th>
										<td>			
											<select name="MDI_UNIT_L" id="MDI_UNIT_L">
											<option value="">-- 약품단위 선택 --</option>
											<c:forEach var="unitList" items="${unitList }" varStatus="st">
											<option value="${unitList.MCC_S_CODE}">${unitList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</td>
									</tr>
								<tr>
									<th scope="row">용도</th><td><input type="text" class="textfield" style="width:50%" id='drug_purpose'></td>
								</tr>
								<tr>
									<th scope="row">특기사항</th><td><input type="text" class="textfield" style="width:50%" id='drug_spec'></td>
								</tr>
                            </tbody>
                        </table>
					</div>
					
					<div class="btn_area">
						<a href="#javascript:;" class="popent_btn">저장</a>&nbsp;
						<a href="#javascript:;" class="popcancel_btn" onclick="javascript:fn_layer_hide();">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer02-->
	</div>
	<!-- // layer_popup -->
	</div>
	<!-- //container -->
	<!-- footer -->
	<div id="footer_wrap">
		<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
</body>
</html>