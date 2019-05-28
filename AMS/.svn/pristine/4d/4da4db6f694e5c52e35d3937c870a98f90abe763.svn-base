<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
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
<script src="/js/jquery.form.min.js"/></script>
<script src="/js/common/json2.js"></script>
<script type="text/javascript">

function animal_select(MAI_ANICODE){	
	var sendData = "MAI_ANICODE=" + MAI_ANICODE;
	var targetUrl = "/jour/0304/getAnimalInfo.do";

	$.ajax({
		type : "POST",
		data : sendData,
		url : targetUrl,
		success : function(result) {
				if($('#ani_trade').val() == '' || $('#ani_trade').val() != '' ){
					$("#base_tbody input[name=ani_trade]").val(result.MAI_ANICODE);
					fn_layer_hide();
				}
				/* else if($('#ani_ft').val() == '' || $('#ani_ft').val() != '' ){
					$("#born_tbody input[name=ani_ft]").val(result.MAI_ANICODE);
					fn_layer_hide();
				}
				else if($('#ani_mt').val() == '' || $('#ani_mt').val() != '' ){
					$("#born_tbody input[name=ani_mt]").val(result.MAI_ANICODE);
					fn_layer_hide();
				} */
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	});
}

function fn_layer_show() {
	$("#layer03").show();
	$(".layer_popup").show();
	var width_size = $("#layer03").innerWidth()/2;
	$("#layer03").css("margin-left",-width_size);
}

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
	
	$("#sch_tbody #codeSearch").val("");
	$("#sch_tbody #schKeyword").val("");
	$("#sch_tbody #selbox").val("");
	$("input:radio[name='pyeType']:radio[value='All']").attr("checked",true);
	fc_clearRow("schRst_tbody");
}

function fn_AniInfo_view0107E(MAI_AniCode){
	var targetUrl = "/base/0107/view0107E.do";
	location.href = targetUrl + "?MAI_AniCode=" +MAI_AniCode;
}

function fn_layer_show2() {
	var tt = '<c:out value="${aniInfo.MAI_ANICODE}"/>';
	
	$("#layer01").show();
	$(".layer_popup").show();
	var width_size = $("#layer01").innerWidth()/2;
	$("#layer01").css("margin-left",-width_size);
}

function fn_layer_hide2() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
}

function print(){
	alert('테스트 중입니다.');
}

function getFileMap(result){
	console.log("---------getFileMap--------");
 	if(result!=null){
		if(result.fileMap){
			console.log("fileMap==> " + JSON.stringify(result.fileMap));
		}
 	}
}
 
function fn_base_upload_Img() {
	var file_ids = [];
	if($('#uploadForm #file1').val()!=''){
		file_ids.push("1");
	}
	if($('#uploadForm #file2').val()!=''){
		file_ids.push("2");
	}
	if($('#uploadForm #file3').val()!=''){
		file_ids.push("3");
	}
	if($('#uploadForm #file4').val()!=''){
		file_ids.push("4");
	}
	if($('#uploadForm #file5').val()!=''){
		file_ids.push("5");
	}
	$("#uploadForm #file_ids").val(file_ids);
	console.log("file_ids:" + $("#uploadForm #file_ids").val());
	
	var param = {
			bzcls1 : 'ST',
			rpsnttype_chkId : $('#img_tbody input:radio[name=ani_img]:checked').val(),
			mai_anicode:'${aniInfo.MAI_ANICODE}'
	}
	fc_uploadAjax(param, getFileMap);
}

function fn_base_save_Img() {
	fn_base_upload_Img();
}

/* function go_pop(){
 
 window.open("/base/0107/animalCard.do?MAI_AniCode=${aniInfo.MAI_ANICODE}","new","width=1050, height=800, resizable=no, scrollbars=no, status=no, location=no, directories=no;");
} */

function go_gunzip(){
	window.open("/base/0107/showGunzip.do?MAI_AniCode=${aniInfo.MAI_ANICODE}","resizable=no, scrollbars=no, status=no, location=no, directories=no;");
}

function selectPyeAll(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++)
		{
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
			
			$("#schRst_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_DETHTYPE);
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schKeyword').value = "";
 		return;
 	}
}

function selectPyeAli(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
						
			$("#schRst_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_DETHTYPE);
			
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schKeyword').value = "";
 		return;
 	}
}

function selectPyeDea(result){
 	if(result!=null){
		console.log("test:" + JSON.stringify(result));
		console.log("result.length==>" + result.length);
		$("#schRst_tbody tr:first").attr('style',"display:");
		for(var i=0; i<result.length; i++){
			var data = result[i];
			fc_addRow("schRst_tbody"); 
			
			var iRow = (i+1);
						
			$("#schRst_tbody div#INDEX_DIV").eq(iRow).html(iRow); 
			$("#schRst_tbody div#ANIMAL_NUMBER_DIV").eq(iRow).html(data.MAI_ANICODE);
			if(data.MAI_BNAME == null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME); 
			}else if(data.MAI_BNAME != null){
				$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).html(data.MAC_NAME + "(" + data.MAI_BNAME + ")"); 
			}
			$("#schRst_tbody div#MAC_NAME_DIV").eq(iRow).attr('data-val', data.MAI_ANICODE); 
			$("#schRst_tbody div#VVRMNAME_DIV").eq(iRow).html(data.MVI_VVRMNAME);
			$("#schRst_tbody div#ANIMAL_GENDER_DIV").eq(iRow).html(data.MAI_GENDER); 
			$("#schRst_tbody div#RegType_DIV").eq(iRow).html(data.MAI_DETHTYPE);
			
		}
		$("#schRst_tbody tr:first").attr('style',"display:none");
 	}
 	if(result == 0){
 		alert('조회된 결과가 없습니다.');
 		document.getElementById('schKeyword').value = "";
 		return;
 	}
}

function fn_base_selectPyeAll(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/jour/0304/selectAllList.do";
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			pyeType : "All",
			selbox : $("#sch_tbody #selbox").val()
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectPyeAli(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/jour/0304/selectAliveList.do";
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			pyeType : "Alive",
			selbox : $("#sch_tbody #selbox").val()
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

function fn_base_selectPyeDea(param, callback, retObj) {
	fc_clearRow("schRst_tbody");
	var targetUrl = "/jour/0304/selectDeathList.do";
	var param = {
			codeSearch:$("#sch_tbody #codeSearch").val(),
			schKeyword:$("#sch_tbody #schKeyword").val(),
			pyeType : "Death",
			selbox : $("#sch_tbody #selbox").val()
			
	};
	$.getJSON(targetUrl, param, function(result) {
		console.log(JSON.stringify(result));
		if (typeof (callback) == "function") {
			callback.call(retObj, result);
		}
	});
}

/* cal_1 */
	function check(){
	var chk= $("input:checkbox[id='nbirth']").is(":checked"); // 체크상태면
	if(!chk){
	     $('#cal_1').css('visibility', 'hidden' ); // 체크상태가 아니면 
	}else{
		$('#cal_1').val('');
		$('#cal_1').css('visibility', 'visible' ); 
	}
	}
	
	$(document).ready(function() {
		
		$('#cal_1').css('visibility', 'hidden' );
		
		if(fn_is_pms_upd('0107')){
			$(".excel_btn").css("display","");
			$(".save_btn").css("display","");
			$(".cancel_btn").css("display","");
			$(".table_add_btn layer_open popnext_je").css("display","");
			$(".table_view_btn").css("display","");
			$(".cha_btn layer_open").css("display","");
			$(".save2_btn").css("display","");
			$(".list_btn").css("display","");
			}
	});
	
	function fn_base_search(){
		var code = document.getElementById("codeSearch").value;
		var name = document.getElementById("schKeyword").value;
		var selc = document.getElementById("selbox").value;
		
		if(code == '' & name == '' & selc == ''){
			alert('검색어가 없습니다.');
			return;
		}
		
		var param = {
				pyeType : $('#sch_tbody input:radio[name=pyeType]:checked').val(),
				selbox : $("#sch_tbody #selbox").val()
		};
		console.log(param.pyeType);
		if(param.pyeType=="All"){
			fn_base_selectPyeAll(param, selectPyeAll);
		}else if(param.pyeType=="Alive"){
			fn_base_selectPyeAli("", selectPyeAli);
		}else if(param.pyeType=="Death"){
			fn_base_selectPyeDea("", selectPyeDea);
		}
	}
	
	function getFileMap(result){
		console.log("---------getFileMap--------");
	 	if(result!=null){
			if(result.fileMap){
				console.log("fileMap==> " + JSON.stringify(result.fileMap));
				alert("저장되었습니다.");
			}
	 	}
	}
	 
	function fn_base_upload_Img() {
		var minus_ids = [];
		if($('#ani_img1').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("1"); 
		}
		if($('#ani_img2').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("2"); 
		}
		if($('#ani_img3').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("3"); 
		}
		if($('#ani_img4').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("4"); 
		}
		if($('#ani_img5').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("5"); 
		}
		
		var file_ids = [];
		if($('#uploadForm #file1').val()!=''){
			file_ids.push("1");
		}
		if($('#uploadForm #file2').val()!=''){
			file_ids.push("2");
		}
		if($('#uploadForm #file3').val()!=''){
			file_ids.push("3");
		}
		if($('#uploadForm #file4').val()!=''){
			file_ids.push("4");
		}
		if($('#uploadForm #file5').val()!=''){
			file_ids.push("5");
		}
		
		$("#uploadForm #minus_ids").val(minus_ids);
		$("#uploadForm #file_ids").val(file_ids);
		
		console.log("minus_ids:" + $("#uploadForm #minus_ids").val());
		console.log("file_ids:" + $("#uploadForm #file_ids").val());
		
		var param = {
				bzcls1 : 'ST',
				rpsnttype_chkId : $('#img_tbody input:radio[name=ani_img]:checked').val(),
				mai_anicode:'${aniInfo.MAI_ANICODE}'
		}
		fc_uploadAjax(param, getFileMap);
	}

	function fn_base_save_Img() {
		if(confirm("저장 하시겠습니까")){
			fn_base_upload_Img();
		}
	}
	
</script>

<%-- 마우스 오버시 커서 활성화 --%>
<style>
#MAC_NAME_DIV {cursor: pointer;}
#lbanip_tbody {cursor: pointer;}
</style>

<title>기본정보 &gt; 동물정보</title>
</head>
<body>
<div id="sub_wrap" style="position: relative;">

	<!-- accessibility -->
	<ul class="accessibility">
		<li><a href="#lnb">메뉴바로가기</a></li>
		<li><a href="#contents_area">본문바로가기</a></li>
		<li><a href="#footer">하단바로가기</a></li>
	</ul>
	<!-- //accessibility-->
	
	<!-- header -->
    <jsp:include page="/header.do"></jsp:include>
	<!-- //header -->
	
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<jsp:include page="/lnb.do"></jsp:include>
			<!-- //left-->
			
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">동물정보</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 동물정보</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
				<!-- contents-->
				<div class="contents_table">
					<!-- 그룹정보-->
					<div class="aniinfo_search_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="#"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>그룹정보</span>
						</div>
                         <table class="aniinfo_search table_view" >
							<caption>그룹정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">동물명</th><td>${clsInfo.MAC_NAME } (${clsInfo.MAC_ANICLSCODE})</td>
									<th scope="row">영명</th><td>${clsInfo.MAC_ENAME }</td>
								</tr>
								<tr>
									<th scope="row">동물그룹명</th><td>${clsInfo.CLS1_NAME } - ${clsInfo.CLS2_NAME } - ${clsInfo.CLS3_NAME }</td>
									<th scope="row">학명</th><td style="font-style: italic;">${clsInfo.MAC_SNAME }</td>
								</tr>
								<tr>
									<th scope="row">CITES</th><td>${clsInfo.MAC_CITES }</td>
									<th scope="row">천연기념물</th><td>${clsInfo.MAC_NATMON }</td>
								</tr>
								<tr>
									<th scope="row">멸종위기</th><td>${clsInfo.MAC_ENDANG }</td>
									<th scope="row">전략종</th><td>${clsInfo.MAC_ESTM_TYPE }</td>
								</tr>
								<tr>
									<th scope="row">등급</th><td>${clsInfo.MAC_RANK }</td>
									<th scope="row">원산지</th><td>${clsInfo.MAC_ORGPLACE }</td>
								</tr>
								<tr>
									<th scope="row">군집구분</th>
									<td>${clsInfo.MAC_KJJ_TYPE } 
									 <c:if test="${clsInfo.MAC_KJJ_TYPE == '군집'}">
									<a href="javascript:go_gunzip()" class="save_btn">보기</a>
									</c:if> 
									</td>
									
									<th scope="row">군집 개체수</th><td></td>
								</tr>
								<tr>
									<th scope="row">평균수명(사육)</th><td>${clsInfo.MAC_SY_MEANLF }</td>
									<th scope="row">평균수명(야생)</th><td>${clsInfo.MAC_WY_MEANLF }</td>
								</tr>
								<tr>
								<th scope="row">임신기간</th>
								<c:if test="${clsInfo.MAC_GestPerid == null}">
								<td>${clsInfo.MAC_GestPerid }</td>
								</c:if>
								<c:if test="${clsInfo.MAC_GEST_MON != null}">
								<td>${clsInfo.MAC_GestPerid } 개월</td>
								</c:if>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //그룹정보-->

					<!-- 기본정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<img src="/images/btn_minus.gif" alt="">기본정보</span>
							<div class="sys_btn_box">
							<span class="align_right"> 
							<a href="javascript:;" class="save_btn" style="display: none;">저장</a> 
							<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a> </span>
							</div>
						</div>
						<table class="aniinfo_search table_view2" >
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody id="base_tbody">
								<tr>
									<th scope="row">등록구분</th>
									<td><div class="select_box">			
										<select name="regselbox" id="regselbox">
											<option value="">-- 등록 구분 선택 --</option>
										<c:forEach var="regList" items="${regList }" varStatus="st" >
											<option value="${regList.MCC_S_CODE}" <c:if test="${basicInfo.MAI_REGTYPE == regList.MCC_S_CODE}"> selected="selected"</c:if>>${regList.MCC_S_NAME }</option>
											</c:forEach>
											</select>
										</div>
									</td><th scope="row">아명</th><td><input type="text" id="amyung" name="amyung" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row">별명</th><td>
									<input type="text" id="bname" name="bname" value="${basicInfo.MAI_BNAME}" class="textfield"></td>
									<th scope="row">교환대상 동물<td>
									<input type="text" class="textfield" style="width: 60%" disabled="disabled" id="ani_trade" name="ani_trade">
									<a href="javascript:;" class="table_view_btn" onclick="javascript:fn_layer_show();">보기</a></td>
								</tr>
								<tr>
									<th scope="row">현재 상태</th>
									<td>
										<div class="select_box">			
										<select name="stsselbox" id="stsselbox">
											<option value="">-- 현재 상태  선택 --</option>
										<c:forEach var="stsList" items="${stsList }" varStatus="st" >
											<option value="${stsList.MCC_S_CODE}" <c:if test="${basicInfo.MAI_CURSTS == stsList.MCC_S_CODE}"> selected="selected"</c:if>>${stsList.MCC_S_NAME }</option>
											</c:forEach>
										</select>
										</div>
									</td>
									<th scope="row">동물사</th><td>${basicInfo.MVI_VVRMNAME }</td>
								</tr>
								<tr>
									<th scope="row">국내혈통번호</th><td><input type="text" id="nat" name="nat" class="textfield"></td>
									<th scope="row">국제혈통번호</th><td><input type="text" id="int" name="int" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row">칩인식기</th><td><input type="checkbox" value="Y" ${basicInfo.MAI_CHIP_INO == "Y" ? "CHECKED" : "" }/> <input type="text"></td>
									<th scope="row">링인식기</th><td><input type="checkbox" value="Y" ${basicInfo.MAI_RING_INO == "Y" ? "CHECKED" : "" }> <input type="text"></td>
									
								</tr>
								<tr>
									<th scope="row">이표인식기</th><td><input type="checkbox" value="Y" ${basicInfo.MAI_EAR_INO == "Y" ? "CHECKED" : "" }> <input type="text"></td>
									<th scope="row">기타</th><td></td>
								</tr>
								<tr>
									
								</tr>
								<tr>
									<th style="height:80px">특이사항</th>
									<td style="text-align:left" colspan="3">
									<textarea rows="4" cols="130" style="resize:none;"></textarea>
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //기본정보-->
					
					<!-- 출생정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="#"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>출생정보</span>
							<div class="sys_btn_box">
							<span class="align_right"> 
							<input type="button" class="save_btn" value="저장" style="display: none;">
							<a href="#" class="cancel_btn" style="display: none;">취소</a> </span>
							</div>
						</div>
						
                        <table class="aniinfo_search table_view3" >
							<caption>출생정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							
                            <tbody id="born_tbody">
								<tr>
									<th scope="row">번식보고서</th><td>
									<c:if test="${bornInfo.BBR_DOCNO != null}">
									<a href="#" class="table_view_btn">보기</a>
									</c:if>
									</td>
									<th scope="row">출생지</th><td><input type="text" class="textfield"><div id="test"></div></td>
								</tr>
								<tr>
									<th scope="row">생년월일</th>
									<td>
									<c:choose>
									<c:when test="${bornInfo.MAI_BIRTHDAY != null}">
										<input type="text" class="calendar1" id="cal_2" name="cal_2" value="${bornInfo.MAI_BIRTHDAY }">
									</c:when>
									<c:when test="${bornInfo.MAI_BIRTHDAY == null}">
										<input type="text" class="calendar1" id="cal_1" name="cal_1" value="${bornInfo.MAI_BIRTHDAY }">
										<label><input type="checkbox" id="nbirth" name="nbirth" onclick="javascript:check();">추정</label>
									</c:when>
									</c:choose>
									</td>
									<th scope="row">출생동물사</th>
									<td>	
									<select id="BVvrm" name="BVvrm">
									<option value="">-- 출생 동물사 선택 --</option>
										<c:forEach var="vvrmList" items="${vvrmList }" varStatus="st" >
											<option value="${bornInfo.MAI_BIRTHVVRMNO}" <c:if test="${bornInfo.MAI_BIRTHVVRMNO == vvrmList.MVI_VVRMNO}"> selected="selected"</c:if>>${vvrmList.MVI_VVRMNAME }</option>
											</c:forEach>
									</select>
									</td>
									
								</tr>
								<tr>
									<th scope="row">원수 등록일</th><td><input type="text" class="calendar1" id="cal_3" name="cal_3" value="${bornInfo.MAI_OSREGDATE }"></td>
									<th scope="row">성별</th>
									<td>
										<div class="select_box">			
										<select name="gender" id="gender">
											<option value="">-- 성별 선택 --</option>
										<c:forEach var="genList" items="${genList }" varStatus="st">
											<option value="${genList.MCC_S_CODE}" <c:if test="${bornInfo.MAI_SEX == genList.MCC_S_CODE}"> selected="selected"</c:if>>${genList.MCC_S_NAME }</option>
											</c:forEach>
										</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">부 동물</th>
										<c:choose>
											<c:when test="${bornInfo.MAI_FTANINO != null}">
											<td>${aniInfo.MAC_NAME} (${bornInfo.MAI_FTANINO })</td>
											</c:when>
											<c:otherwise>
												<td>
													<input type="text" class="textfield" style="width: 60%" disabled="disabled" id="ani_ft" name="ani_ft">
													<a href="javascript:;" class="table_view_btn" onclick="javascript:fn_layer_show();">보기</a>
												</td>
											</c:otherwise>
										</c:choose>
										
										<th scope="row">모 동물</th>
										<c:choose>
											<c:when test="${bornInfo.MAI_MMANINO != null}">
											<td>${aniInfo.MAC_NAME} (${bornInfo.MAI_MMANINO })</td>
											</c:when>
											<c:otherwise>
												<td>
													<input type="text" class="textfield" style="width: 60%" disabled="disabled" id="ani_mt" name="ani_mt">
													<a href="javascript:;" class="table_view_btn" onclick="javascript:fn_layer_show();">보기</a>
												</td>
											</c:otherwise>
										</c:choose>
								</tr>
								<tr>
									<th scope="row">잡종여부</th>
									<td>
										<input type="radio" id="jabjong" name="jab" value="jabjong" class="search_radio" ${bornInfo.MAI_HBRDTYPE == "잡종" ? "CHECKED" : ""}/>잡종 	
										<input type="radio" id="sunjong" name="jab" value="sunjong" class="search_radio" ${bornInfo.MAI_HBRDTYPE == "순종" ? "CHECKED" : ""}/>순종						
									</td>
									<th scope="row">양육형태</th>
									<td>
										<input type="radio" id="jayeon" name="yang" value="jayeon" class="search_radio" ${bornInfo.MAI_NRTUTYPE == "자연포육" ? "CHECKED" : ""}/>자연포육 	
										<input type="radio" id="ingong" name="yang" value="ingong" class="search_radio" ${bornInfo.MAI_NRTUTYPE == "인공포육" ? "CHECKED" : ""}/>인공포육						
									</td>
								</tr>
								<tr>
									<th scope="row">출생타입</th>
									<td>
										<input type="radio" id="zoo" name="chul"  class="search_radio" ${bornInfo.MAI_BORNTYPE == "동물원" ? "CHECKED" : ""}/>동물원	
										<input type="radio" id="yaseng" name="chul"  class="search_radio" ${bornInfo.MAI_BORNTYPE == "야생" ? "CHECKED" : ""}/>야생									
									</td>
									<th scope="row"></th><td></td>
								</tr>
								
						   </tbody>
						</table>
					</div>
					<!-- //출생정보-->
					
					<!-- 폐사정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="#"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus4"><img src="/images/btn_minus.gif" alt=""></a>폐사정보</span>
							<div class="sys_btn_box">
							<span class="align_right"> 
							<a href="javascript:;" class="save_btn" style="display: none;">저장</a>
							<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a> </span>
							</div>
						</div>
						<table class="aniinfo_search table_view2" >
							<caption>폐사정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">폐사보고서</th><td>${deadInfo.PDR_DOCNO }
									<c:if test="${deadInfo.PDR_DOCNO != null}">
									<a href="/jour/0304/view0304E.do?docno=${deadInfo.PDR_DOCNO }" class="table_view_btn">보기</a>
									</c:if>
									</td>
									<th scope="row">폐사경위</th><td>${deadInfo.PDR_DETHPROC }</td>
								</tr>
								<tr>
									<th scope="row">폐사 일시</th><td><input type="text" class="calendar1" id="cal_4" name="cal_4" value="${deadInfo.PDR_PSDATE }"></td>
									<th scope="row">폐사장소</th><td><input type="text" value="${deadInfo.PDR_PSPLACE }" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row">부검요청여부</th>
									<td>
										<div class="select_box">		
										<select name="bureq" id="bureq">
											<option value="0" ${deadInfo.PDR_BUKMREQ == "" ? "SELECTED" : ""}>-- 요청 여부 선택 --</option>
											<option value="1" ${deadInfo.PDR_BUKMREQ == "1" ? "SELECTED" : ""}>요청</option>
											<option value="2" ${deadInfo.PDR_BUKMREQ == "0" ? "SELECTED" : ""}>미요청</option>
										</select>
										</div>
									</td>
									<th scope="row">비고</th><td>${deadInfo.PDR_CMNT}</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //폐사정보-->
					
					<!-- 임신정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<img src="/images/btn_minus.gif" alt="">임신정보</span>
						</div>
						<table class="aniinfo_search table_view3" >
							<caption>임신정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
                            <c:forEach var="getImsin" items="${getImsin }">	
								<tr>
									<%-- <th scope="row">임신상태</th><td>${getImsin.MAI_IMSINSTS }</td> --%>
									<%-- <th scope="row">임신일자</th><td>${getImsin.MAI_IMSINDATE }</td> --%>
									<th scope="row">분만횟수</th><td>${getImsin.MAI_BNMNCNT }</td>
									<th scope="row">사산횟수</th><td></td>
								</tr>
								<tr>
									<%-- <th scope="row">분만일자</th><td>${getImsin.MAI_BNMNDATE}</td> --%>
									<th scope="row">출생수</th><td></td>
									<th scope="row">사산수</th><td></td>
								</tr>
								</c:forEach>
						   </tbody>
						</table>
						
						<table class="aniinfo_add table_view3">
							<caption>임신정보</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:18%;">
								<col style="width:13%;">
								<col style="width:25%;">
								<col style="width:13%;">
								<col style="width:13%;">
								<col style="width:13%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">번식보고서</th>
									<th scope="col" id="th03">출산일</th>
									<th scope="col" id="th04">임신기간(추정)</th>
									<th scope="col" id="th05">출산</th>
									<th scope="col" id="th06">생존</th>
									<th scope="col" id="th07">사산</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01_1" headers="th01_1">1</th>
									<td headers="n01_1 th02_1">BS2016080100001</td>
									<td headers="n01_1 th03_1">2016.08.01</td>
									<td headers="n01_1 th04_1">2016.01.01 ~ 2016.07.31</td>
									<td headers="n01_1 th05_1">수(1), 암(1)</td>
									<td headers="n01_1 th06_1">수(1), 암(1)</td>
									<td headers="n01_1 th07_1"></td>
								</tr>
								<tr>
									<th scope="row" id="n02_1" headers="th01_1">2</th>
									<td headers="n02_1 th02_1">BS2016080100001</td>
									<td headers="n02_1 th03_1">2015.08.01</td>
									<td headers="n02_1 th04_1">2015.01.01 ~ 2015.07.31</td>
									<td headers="n02_1 th05_1">수(2), 암(1)</td>
									<td headers="n02_1 th06_1">수(1)</td>
									<td headers="n02_1 th07_1">수(1), 암(1)</td>
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //임신정보-->
					
					<!-- 가계도 -->
					 <%-- <div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="btn_minus9"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="#"><img src="/images/btn_minus.gif" alt=""></a>가계도(예시)</span>
							<!-- <div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys9">수정</a></span>
								<span class="sys_btn_area9"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div> -->
						</div>
                        <table class="aniinfo_search table_view3" >
							<caption>가계도</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">	
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">부</th><td>M7-2-3-1(생존)</td>
									<th scope="row">모</th><td>M7-2-3-2(폐사)</td>
								</tr>
								<tr>
									<th scope="row">자식</th><td>M7-2-3-7(생존)</td>
								</tr>
						   </tbody>
						</table>
					</div>  --%>
					<!-- 가계도-->
					&nbsp;&nbsp;&nbsp;&nbsp;
					<!-- 반출입 정보-->
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title">
							<img src="/images/btn_minus.gif" alt="">반출입 정보</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide">
								<a href="javascript:fn_layer_show2();" class="save_btn" style="display: none;">추가</a>
								<a href="javascript:;" class="cancel_btn" style="display: none;">취소</a> </span>
							</div>
						</div>				
						<table class="aniinfo_add table_view" >
							<caption>반출입 정보</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:17%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">일자</th>
									<th scope="col" id="th04">종료일자</th>
									<th scope="col" id="th05">사유</th>
									<th scope="col" id="th06">나이</th>
									<th scope="col" id="th07">국가</th>
									<th scope="col" id="th08">반출입처</th>
								</tr>
								</thead>
							<tbody id="lbanip_tbody">
							<c:forEach var="banipInfo" items="${banipInfo }">	
								<tr onclick="javascript:fn_layer_show2();">
									<th scope="row" id="n01" headers="th01">${banipInfo.RNUM }</th>
									<td headers="n01 th02">${banipInfo.DAIO_IOTYPE }</td>
									<td headers="n01 th03">${banipInfo.DAIO_IODATE }</td>
									<td headers="n01 th04">${banipInfo.DAIO_RENTEDATE }</td>
									<td headers="n01 th05">${banipInfo.DAIO_RESN }</td>
									<td headers="n01 th06">${banipInfo.DAIO_AGE }</td>
									<td headers="n01 th07">${banipInfo.DAIO_NATION }</td>
									<td headers="n01 th08">${banipInfo.DAIO_PLACE }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- //반출입 정보-->
					&nbsp;&nbsp;&nbsp;&nbsp;
					
					<form id="uploadForm" enctype="multipart/form-data" method="POST" action="/common/file/upload.do">
						<div style="display:none">
							<input type="file" id="file1" name="ani_file" onchange="javascript:fc_chgImgFile(this, $('#ani_img1'));">
							<input type="file" id="file2" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#ani_img2'));"/>
							<input type="file" id="file3" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#ani_img3'));"/>
							<input type="file" id="file4" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#ani_img4'));"/>
							<input type="file" id="file5" name="ani_file" required="required" onchange="javascript:fc_chgImgFile(this, $('#ani_img5'));"/>
						</div>
						<input type="hidden" id="minus_ids" name="minus_ids"/>
						<input type="hidden" id="file_ids" name="file_ids"/>
						<input type="hidden" id="bzseqno_list" name="bzseqno_list"/>
						<div id="fileMap" data-val=''></div>


					<!-- 대표 이미지-->
					<!-- 경로-->
					<c:set var="img1" value="/images/footer_logo.png" />
					<c:set var="img2" value="/images/footer_logo.png" />
					<c:set var="img3" value="/images/footer_logo.png" />
					<c:set var="img4" value="/images/footer_logo.png" />
					<c:set var="img5" value="/images/footer_logo.png" />
					
					<!-- 타이틀-->
					<c:set var="img1_ttl" value="" />
					<c:set var="img2_ttl" value="" />
					<c:set var="img3_ttl" value="" />
					<c:set var="img4_ttl" value="" />
					<c:set var="img5_ttl" value="" />
					
					<!-- 대표 이미지 인덱스-->
					<c:set var="idx_rpsnttype" value="" />
			
					<c:forEach var="stFileList" varStatus="status" items="${stFileList}">
					<c:if test="${stFileList.BII_RPSNTTYPE == '1'}"><c:set var="idx_rpsnttype" value="${stFileList.BII_BZSEQNO}" /></c:if>
					<c:choose>
						<c:when test="${stFileList.BII_BZSEQNO == '1'}">
							<c:if test="${!empty stFileList.BII_IMGFILENM}"><c:set var="img1" value="/${uploadPath}/${stFileList.BII_IMGFILENM}" /></c:if>
							<c:set var="img1_ttl" value="${stFileList.BII_IMGFILETTL}" />
						</c:when>
						<c:when test="${stFileList.BII_BZSEQNO == 2}">
							<c:if test="${!empty stFileList.BII_IMGFILENM}"><c:set var="img2" value="/${uploadPath}/${stFileList.BII_IMGFILENM}" /></c:if>
							<c:set var="img2_ttl" value="${stFileList.BII_IMGFILETTL}" />
						</c:when>
						<c:when test="${stFileList.BII_BZSEQNO == 3}">
							<c:if test="${!empty stFileList.BII_IMGFILENM}"><c:set var="img3" value="/${uploadPath}/${stFileList.BII_IMGFILENM}" /></c:if>
							<c:set var="img3_ttl" value="${stFileList.BII_IMGFILETTL}" />
						</c:when>
						<c:when test="${stFileList.BII_BZSEQNO == 4}">
							<c:if test="${!empty stFileList.BII_IMGFILENM}"><c:set var="img4" value="/${uploadPath}/${stFileList.BII_IMGFILENM}" /></c:if>
							<c:set var="img4_ttl" value="${stFileList.BII_IMGFILETTL}" />
						</c:when>
						<c:when test="${stFileList.BII_BZSEQNO == 5}">
							<c:if test="${!empty stFileList.BII_IMGFILENM}"><c:set var="img5" value="/${uploadPath}/${stFileList.BII_IMGFILENM}" /></c:if>
							<c:set var="img5_ttl" value="${stFileList.BII_IMGFILETTL}" />
						</c:when>
					</c:choose>
					</c:forEach>

					<!-- <div class="aniinfo_add_box" style="margin-top:0px;"> -->

						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="#"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus7"><img src="/images/btn_minus.gif" alt=""></a>대표 이미지</span>
							<div class="sys_btn_box">
								<!-- <span class="align_right"><a href="#" class="cha_btn cha_btn_sys">수정</a></span> -->
								<span class="align_right"><a href="javascript:fn_base_save_Img();" class="save_btn" style="display: none;">저장</a></span>
								<span class="sys_btn_area7"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_search">
							<thead>
								<tr>
									<th scope="col"><img id="ani_img1" src="${img1}" alt="" style="width: 180px; height: 120px;"></th>
									<th scope="col"><img id="ani_img2" src="${img2}" alt="" style="width: 180px; height: 120px;"></th>
									<th scope="col"><img id="ani_img3" src="${img3}" alt="" style="width: 180px; height: 120px;"></th>
									<th scope="col"><img id="ani_img4" src="${img4}" alt="" style="width: 180px; height: 120px;"></th>
									<th scope="col"><img id="ani_img5" src="${img5}" alt="" style="width: 180px; height: 120px;"></th>
								</tr>
							</thead>
						</table>
						<table class="aniinfo_search table_view">
							<caption>대표 이미지</caption>
							<colgroup>
								<col style="width:20%r;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">								
							</colgroup>
                            <tbody id="img_tbody">
								<tr>
									<td><input type=text id="imgfilettl_1" name="imgfilettl_1" value='${img1_ttl}' class="textfield"></td>
									<td><input type=text id="imgfilettl_2" name="imgfilettl_2" value='${img2_ttl}' class="textfield"></td>
									<td><input type=text id="imgfilettl_3" name="imgfilettl_3" value='${img3_ttl}' class="textfield"></td>
									<td><input type=text id="imgfilettl_4" name="imgfilettl_4" value='${img4_ttl}' class="textfield"></td>
									<td><input type=text id="imgfilettl_5" name="imgfilettl_5" value='${img5_ttl}' class="textfield"></td>
								</tr>
								<tr class="td_btn_box">
									<td><p><label><input type="radio" name="ani_img" value="1" class="search_radio" <c:if test="${idx_rpsnttype == '1'}">checked</c:if>/>대표 이미지</label></p></td>
									<td><p><label><input type="radio" name="ani_img" value="2" class="search_radio" <c:if test="${idx_rpsnttype == '2'}">checked</c:if>/>대표 이미지</label></p></td>
									<td><p><label><input type="radio" name="ani_img" value="3" class="search_radio" <c:if test="${idx_rpsnttype == '3'}">checked</c:if>/>대표 이미지</label></p></td>
									<td><p><label><input type="radio" name="ani_img" value="4" class="search_radio" <c:if test="${idx_rpsnttype == '4'}">checked</c:if>/>대표 이미지</label></p></td>
									<td><p><label><input type="radio" name="ani_img" value="5" class="search_radio" <c:if test="${idx_rpsnttype == '5'}">checked</c:if>/>대표 이미지</label></p></td>
								</tr>
								<tr class="td_btn_box" id="img_choice" style="display:;">
									<th scope="col">
									<a href="javascript:;"><img src="/images/ico_minus.png" style="vertical-align:middle;" onclick="javascript:fc_base_unload_img($('#uploadForm #file1'), $('#ani_img1'));"></a>
									<a href="javascript:;"><img src="/images/ico_plus.png" style="vertical-align:middle;" onclick="javascript:$('#uploadForm #file1').click();"></a></th>
									
									<th scope="col">
									<a href="javascript:;"><img src="/images/ico_minus.png"  style="vertical-align:middle;" onclick="javascript:fc_base_unload_img($('#uploadForm #file2'), $('#ani_img2'));"></a>
									<a href="javascript:;"><img src="/images/ico_plus.png"  style="vertical-align:middle;" onclick="javascript:$('#uploadForm #file2').click();"></a></th>
									
									<th scope="col">
									<a href="javascript:;"><img src="/images/ico_minus.png"  style="vertical-align:middle;" onclick="javascript:fc_base_unload_img($('#uploadForm #file3'), $('#ani_img3'));"></a>
									<a href="javascript:;"><img src="/images/ico_plus.png"  style="vertical-align:middle;" onclick="javascript:$('#uploadForm #file3').click();"></a></th>
									
									<th scope="col">
									<a href="javascript:;"><img src="/images/ico_minus.png"  style="vertical-align:middle;" onclick="javascript:fc_base_unload_img($('#uploadForm #file4'), $('#ani_img4'));"></a>
									<a href="javascript:;"><img src="/images/ico_plus.png"  style="vertical-align:middle;" onclick="javascript:$('#uploadForm #file4').click();"></a></th>
									
									<th scope="col">
									<a href="javascript:;"><img src="/images/ico_minus.png"  style="vertical-align:middle;" onclick="javascript:fc_base_unload_img($('#uploadForm #file5'), $('#ani_img5'));"></a>
									<a href="javascript:;"><img src="/images/ico_plus.png"  style="vertical-align:middle;" onclick="javascript:$('#uploadForm #file5').click();"></a></th>
								</tr>
								<tr class="td_btn_box">
									<td><a href="${img1}" class="down_btn">다운로드</a></td>
									<td><a href="${img2}" class="down_btn">다운로드</a></td>
									<td><a href="${img3}" class="down_btn">다운로드</a></td>
									<td><a href="${img4}" class="down_btn">다운로드</a></td>
									<td><a href="${img5}" class="down_btn">다운로드</a></td>
								</tr>
						   </tbody>
						</table>
					</form>
						
						
					<div class="btn_area_bottom">
						<a href="#layer02" class="del_btn layer_open" style="width:150px;">자력카드 팝업</a>
						<!-- <a href="#" class="save2_btn" onclick="go_pop()" style="display: none;">자력카드</a> -->
						<a href="#" class="save2_btn" style="display: none;">저장</a>
						<a href="/base/0107/main.do" class="list_btn">목록</a>
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
		<div class="layer_box" id="layer01" style="width:840px;">
			<div class="layer_tit">반출입 정보</div>
				<div class="layer_con">
					<div class="table_box">
						<table class="aniinfo_search" style="width:800px;">
							<caption>반출입 정보</caption>
							<colgroup>
								<col style="width:20%" />
								<col style="width:30%" />
								<col style="width:20%" />
								<col style="width:30%" />
							</colgroup>
							<thead>
									<tr>
										<th colspan="4" scope="col" class="popup_th">
											<a href="#" class="back_btn">초기화</a>
											<a href="#" class="del2_btn">삭제</a>
										</th>
									</tr>
							</thead>					
							<tbody>
								<tr>
									<th scope="row">구분</th>
									<td>
										<div class="select_box">			
										<!-- lybanipList -->
										<select name="LybanipSelbox" id="LybanipSelbox">
											<option value="">-- 구분 선택 --</option>
											<c:forEach var="lybanipList" items="${lybanipList }" varStatus="st" >
											<option value="${lybanipList.MCC_S_CODE}"<c:if test="${banInfo.DAIO_IOTYPE == lybanipList.MCC_S_CODE}"> selected="selected"</c:if>>${lybanipList.MCC_S_NAME }</option>
											</c:forEach>
										</select>
										</div>
									
									</td>
									<th scope="row">사유</th>
									<td>
										<div class="select_box">			
										<select name="LRsnSelbox" id="LRsnSelbox">
											<option value="">-- 사유 선택 --</option>
											<c:forEach var="LRsnList" items="${LRsnList }" varStatus="st" >
											<option value="${LRsnList.MCC_S_CODE}">${LRsnList.MCC_S_NAME }</option>
											</c:forEach>
										</select>
										</div>
									
									</td>
								</tr>
								<tr>
									<th scope="row">일자</th>
									<td><p><input type="text" class="calendar3" id="cal_1" value=""><label for="cal_1"></label></p></td>
									<th scope="row">종료일자(임대/보육)</th>
									<td><p><input type="text" class="calendar3" id="cal_2" value=""><label for="cal_2"></label></p></td>
								</tr>
								<tr>
									<th scope="row">동물나이</th>
									<td>
										<input name="textfield" type="text" id="table1_text1" class="textfield" value="" style="width:25%"/><label for="table1_text1">&nbsp;&nbsp;년&nbsp;&nbsp;</label> 
										<input name="textfield" type="text" id="table1_text2" class="textfield" value="" style="width:25%"/><label for="table1_text2">&nbsp;&nbsp;개월</label>
									
									</td>
									<th scope="row">출생지</th>
									<td><input name="textfield" type="text" id="table1_text3" class="textfield" value=""/><label for="table1_text3"></label></td>
								</tr>
								<tr>
									<th scope="row">국가</th>
									<td><input name="textfield" type="text" id="table1_text4" class="textfield" value=""/><label for="table1_text4"></label></td>
									<th scope="row">기관(반출입처)</th>
									<td><input name="textfield" type="text" id="table1_text5" class="textfield" value="가금사"/><label for="table1_text5"></label></td>
								</tr>
								<tr>
									<th scope="row">반입보육실시</th>
									<td>
										<div class="select_box">			
										<select name="sel_table3" id="sel_table3">
											<option value="실시">실시</option>
											<option value="실시">실시</option>
										</select>
										</div>									
									</td>
									<th scope="row">보육건강일지</th>
									<td><input name="textfield" type="text" id="table1_text6" class="textfield" value=""/><label for="table1_text6"></label></td>
								</tr>
								<tr>
									<th scope="row">가격</th>
									<td><input name="textfield" type="text" id="table1_text7" class="textfield" value=""/><label for="table1_text7"></label></td>
									<th scope="row">특기사항</th>
									<td><input name="textfield" type="text" id="table1_text8" class="textfield" value=""/><label for="table1_text8"></label></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="btn_area">
						<a href="javascript:;" class="popent_btn btn_type2">저장</a>
						<a href="javascript:;" class="popcancel_btn btn_type2" onclick="javascript:fn_layer_hide2();">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
		
		<!-- #layer02 -->
		<div class="layer_box" id="layer02" style="width:1020px; top: 80px; height: 600px;">
			<div class="layer_tit">동물자력카드</div>
				<div class="layer_con">
					<div class="sys_btn_box" style="margin-bottom:5px;">
						<span>
						<%-- <a href="#" class="excel_btn">엑셀</a> --%>
						<a href="javascript:;" onclick="javascript:print();" class="print_btn btn_type2">프린트</a></span>	
					</div>
					<table class="aniinfo_search">
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:16%;">
								<col style="width:20%;">
								<col style="width:17%;">
								<col style="width:16%;">
								<col style="width:17%;">
								<col style="width:17%;">
							</colgroup>	
                            <tbody>
								<tr>
									<th scope="row">동물명</th><td>${clsInfo.MAC_NAME } (${basicInfo.MAI_BNAME})</td>
									<th scope="row">학명</th><td style="font-style: italic;">${clsInfo.MAC_SNAME }</td>
									<th scope="row">영명</th><td>${clsInfo.MAC_ENAME }</td>
								</tr>
								<tr>
									<th scope="row">동물번호</th>
									<td>${basicInfo.MAI_ANICODE}</td>
									<th scope="row">강/목/과</th>
									<td colspan="3">${clsInfo.CLS1_NAME } - ${clsInfo.CLS2_NAME } - ${clsInfo.CLS3_NAME }</td>
								</tr>
								<tr>
									<th scope="row">링인식기</th><td></td>
									<th scope="row">귀인식기</th><td></td>
									<th scope="row">칩인식기</th><td></td>
								</tr>
								<tr>
									<th scope="row">천연기념물</th><td>${clsInfo.MAC_NATMON }</td>
									<th scope="row">등급</th><td>${clsInfo.MAC_RANK }</td>
									<th scope="row">CITES</th><td>${clsInfo.MAC_CITES }</td>
								</tr>
								<tr>
									<th colspan="6" scope="col">반입정보</th>
								</tr>
								<tr>
									<th scope="row">반입일</th>
									<td colspan="2"></td>
									<th scope="row">반입처</th>
									<td colspan="2"></td>									
								</tr>
								<tr>
									<th scope="row">반입사유</th><td colspan="2"></td>	
									<th scope="row">반입시 나이</th><td colspan="2"></td>							
								</tr>
								<tr>
									<th colspan="6" scope="col">반출정보</th>
								</tr>
								<tr>
									<th scope="row">반출일</th><td colspan="2"></td>
									<th scope="row">반출처</th><td colspan="2"></td>
								</tr>	
								<tr>
									<th scope="row">반출사유</th><td colspan="2"></td>
									<th scope="row">반출시 나이</th><td colspan="2"></td>
								</tr>	
								<tr>
									<th scope="row" style="vertical-align: middle;">이미지</th>
									<td class="img_td"><img src="/images/ex_img.gif" alt="사진"></td>
									<td class="img_td"><img src="/images/ex_img.gif" alt="사진"></td>
									<td class="img_td"><img src="/images/ex_img.gif" alt="사진"></td>
									<td class="img_td"><img src="/images/ex_img.gif" alt="사진"></td>
									<td class="img_td"><img src="/images/ex_img.gif" alt="사진"></td>
								</tr>		
						   </tbody>
						</table>
			</div>
			<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
	<!-- //#layer02 -->	
	
	<!-- #layer03 -->
		<div class="layer_box" id="layer03" style="width:1020px; top: 80px; height: 650px;overflow:auto;">
			<div class="layer_tit">동물검색</div>
				<div class="layer_con">
					 <table class="aniinfo_search" >
							<caption>동물정보조회</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:40%;">
								<col style="width:10%;">
								<col style="width:40%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr><th scope="row">동물번호</th>
									<td><input name="codeSearch" type="text" id="codeSearch" class="textfield" style="width:90%"/></td>
									<th scope="row">동물사</th>
									<td>
										<div class="select_box">			
											<select name="selbox" id="selbox">
												<option value="">-- 출생 동물사 선택 --</option>
												<c:forEach var="vvrmList" items="${vvrmList }" varStatus="st" >
												<option value="${vvrmList.MVI_VVRMNO}">${vvrmList.MVI_VVRMNAME }</option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr><th scope="row">동물명</th>
									<td>
									<input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/>
									</td>
									<th scope="row">폐사구분</th>
									<td>
										<p>
										  <label><input type="radio" id="pyeType" name="pyeType" value="All" class="search_radio" checked="checked"/>전체</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Alive" class="search_radio"/>생존</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Death" class="search_radio"/>폐사</label>
										</p>
									</td>
								</tr>
								<tr>
								<tr><th colspan="4" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
						
						<!-- 동물정보추가-->
					<div class="aniinfo_add_box">					
						<table class="aniinfo_add" >
						<caption>동물정보내역</caption>
							<colgroup>
								<col style="width:2%;">
								<col style="width:10%;">
								<col style="width:3%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="num">No</th>
									<th scope="col" id="ani_name">동물명</th>
									<th scope="col" id="ani_sex">성별</th>
									<th scope="col" id="ani_num">동물번호</th>
									<th scope="col" id="ani_vvrm">동물사</th>			
									<th scope="col" id="ani_status">상태</th>					
								</tr>
							</thead>
							<tbody id="schRst_tbody">
								<tr style="display:none">
								<th><div id="INDEX_DIV" data-val=''></div></th>
								<td><div id="MAC_NAME_DIV" onclick="javascript:animal_select($(this).attr('data-val'));"></div></td>
								<td><div id="ANIMAL_GENDER_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_NUMBER_DIV" data-val=''></div></td>
								<td><div id="VVRMNAME_DIV" data-val=''></div></td>
								<td><div id="RegType_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보추가-->
			</div>
			<a href="javascript:;" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
	<!-- //#layer03 -->	
		
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