<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="ko">

<head>
<meta http-equiv="content-type" content="text/html; charset=<?=$g4['charset']?>">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<link rel="stylesheet" href="/css/common//multiple-select.css" />
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/common/multiple-select.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/jquery.form.min.js"/></script>
<script src="/js/common/json2.js"></script>
<script>

function updateSDJ_DocInfo(){
	var form = document.docInfo_form;
	
	var SDJ_USERINFO = document.getElementById("SDJ_USERINFO").value;
	var SDJ_WTHENO = document.getElementById("SDJ_WTHENO").value;
	
	if (confirm("저장 하시겠습니까 ?")) {
        form.action = "/jour/0301/updateSDJ_DocInfo.do";
        form.submit();
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
	
	function getTab3FileMap(result){
		console.log("---------getTab3FileMap--------");
		getFileMap(result);
	}
	 
	function fn_tab3_uploadAjax(param, callback, retObj){
	    $('#tab3_uploadForm').ajaxSubmit({
			url: "/common/file/upload.do", //컨트롤러 URL
			type : "POST",
			dataType : 'json',
			data : param,
			success : function(data) {
//				alert(JSON.stringify(data));
				console.log(JSON.stringify(data));
				if(typeof(callback)=="function"){
					callback.call(retObj, data);
				}
			},
			error : function(xmlHttpObj) {
				alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
			}
		});	
	}

	function fn_tab3_upload_Img() {
		var minus_ids = [];
		var bzseqno_list = [];
		if($('#ani_img1').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("1"); 
		}else{
			bzseqno_list.push("1"); 
		}
		if($('#ani_img2').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("2"); 
		}else{
			bzseqno_list.push("2"); 
		}
		if($('#ani_img3').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("3"); 
		}else{
			bzseqno_list.push("3"); 
		}
		if($('#ani_img4').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("4"); 
		}else{
			bzseqno_list.push("4"); 
		}
		if($('#ani_img5').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("5"); 
		}else{
			bzseqno_list.push("5"); 
		}

		var file_ids = [];
		if($('#tab3_uploadForm #file1').val()!=''){
			file_ids.push("1");
		}
		if($('#tab3_uploadForm #file2').val()!=''){
			file_ids.push("2");
		}
		if($('#tab3_uploadForm #file3').val()!=''){
			file_ids.push("3");
		}
		if($('#tab3_uploadForm #file4').val()!=''){
			file_ids.push("4");
		}
		if($('#tab3_uploadForm #file5').val()!=''){
			file_ids.push("5");
		}

		$("#tab3_uploadForm #minus_ids").val(minus_ids);
		$("#tab3_uploadForm #bzseqno_list").val(bzseqno_list);
		$("#tab3_uploadForm #file_ids").val(file_ids);

		console.log("minus_ids:" + $("#tab3_uploadForm #minus_ids").val());
		console.log("bzseqno_list:" + $("#tab3_uploadForm #bzseqno_list").val());
		console.log("file_ids:" + $("#tab3_uploadForm #file_ids").val());
		
		var param = {
				bzcls1 : 'SY',
				bii_docno:'${docInfo.SDJ_DOCNO}'
		}
		console.log(param);
		fn_tab3_uploadAjax(param, getTab3FileMap);
	}
	
	function fn_tab3_save_Img() {
		if(!confirm("저장하시겠습니까?")){
			return;	
		}
		fn_tab3_upload_Img();
	}

	function getTab2FileMap(result){
		console.log("---------getTab2FileMap--------");
		getFileMap(result);
	}
	 
	function fn_tab2_uploadAjax(param, callback, retObj){
	    $('#tab2_uploadForm').ajaxSubmit({
			url: "/common/file/upload.do", //컨트롤러 URL
			type : "POST",
			dataType : 'json',
			data : param,
			success : function(data) {
//				alert(JSON.stringify(data));
				console.log(JSON.stringify(data));
				if(typeof(callback)=="function"){
					callback.call(retObj, data);
				}
			},
			error : function(xmlHttpObj) {
				alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
			}
		});	
	}

	function fn_tab2_upload_Img() {
		
		var minus_ids = [];
		var bzseqno_list = [];
		if($('#tab2_img1').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("1"); 
		}else{
			bzseqno_list.push("1"); 
		}
		if($('#tab2_img2').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("2"); 
		}else{
			bzseqno_list.push("2"); 
		}
		if($('#tab2_img3').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("3"); 
		}else{
			bzseqno_list.push("3"); 
		}
		if($('#tab2_img4').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("4"); 
		}else{
			bzseqno_list.push("4"); 
		}
		if($('#tab2_img5').attr("src")=="/images/footer_logo.png"){
			minus_ids.push("5"); 
		}else{
			bzseqno_list.push("5"); 
		}

		var file_ids = [];
		if($('#tab2_uploadForm #file1').val()!=''){
			file_ids.push("1");
		}
		if($('#tab2_uploadForm #file2').val()!=''){
			file_ids.push("2");
		}
		if($('#tab2_uploadForm #file3').val()!=''){
			file_ids.push("3");
		}
		if($('#tab2_uploadForm #file4').val()!=''){
			file_ids.push("4");
		}
		if($('#tab2_uploadForm #file5').val()!=''){
			file_ids.push("5");
		}
		
		
		$("#tab2_uploadForm #minus_ids").val(minus_ids);
		$("#tab2_uploadForm #bzseqno_list").val(bzseqno_list);
		$("#tab2_uploadForm #file_ids").val(file_ids);

		console.log("minus_ids:" + $("#tab2_uploadForm #minus_ids").val());
		console.log("bzseqno_list:" + $("#tab2_uploadForm #bzseqno_list").val());
		console.log("file_ids:" + $("#tab2_uploadForm #file_ids").val());
		
		var param = {
				bzcls1 : 'SS',
				bii_docno:'${docInfo.SDJ_DOCNO}'
		}
		console.log(param);
		fn_tab2_uploadAjax(param, getTab2FileMap);
	}
	
	function fn_tab2_save_Img() {
		if(!confirm("저장하시겠습니까?")){
			return;	
		}
		fn_tab2_upload_Img();
	}

	function selectUserKjpList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#kjp_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("kjp_tbody");
				
				var iRow = (i+1);
				$("#kjp_tbody div#KJP_INDEX_DIV").eq(iRow).html(iRow); 
				$("#kjp_tbody div#MCC_S_NAME_DIV").eq(iRow).html(data.MCC_S_NAME); 
				$("#kjp_tbody div#MUK_KJSEQ_DIV").eq(iRow).html(data.MUK_KJSEQ); 
				$("#kjp_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#kjp_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#kjp_tbody div#TXT_MUI_JCCODE_DIV").eq(iRow).html(data.TXT_MUI_JCCODE); 
				$("#kjp_tbody div#MUI_DPTLVLNAME_DIV").eq(iRow).attr('data-val', data.MUI_DPTLVLNAME); 
			}
			$("#kjp_tbody tr:first").attr('style',"display:none");
	 	}
	}

	function fn_jour_selectUserKjpList(param, callback, retObj) {
		fc_clearRow("kjp_tbody");
	
		var targetUrl = "/jour/0301/selectUserKjpList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}
	
	function selectUserRcvTypeList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#rcv_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("rcv_tbody");
				
				var iRow = (i+1);
				$("#rcv_tbody div#RCV_INDEX_DIV").eq(iRow).html(iRow); 
				$("#rcv_tbody div#RCV_DEL_DIV").eq(iRow).attr('data-val', iRow); 

				$("#rcv_tbody div#MUK_KJID_DIV").eq(iRow).attr('data-val', data.MUK_KJID); 
				$("#rcv_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#rcv_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#rcv_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
				$("#rcv_tbody div#TXT_MUI_JCCODE_DIV").eq(iRow).html(data.TXT_MUI_JCCODE); 
			}
			$("#rcv_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function selectUserNotiTypeList(result){
	 	if(result!=null){
			console.log("test:" + JSON.stringify(result));
			console.log("teamTable.length==>" + result.length);
			$("#noti_tbody tr:first").attr('style',"display:");
			for(var i=0; i<result.length; i++){
				var data = result[i];
				fc_addRow("noti_tbody");
				
				var iRow = (i+1);
				$("#noti_tbody div#NOTI_INDEX_DIV").eq(iRow).html(iRow); 
				$("#noti_tbody div#NOTI_DEL_DIV").eq(iRow).attr('data-val', iRow); 
				
				$("#noti_tbody div#MUK_KJID_DIV").eq(iRow).attr('data-val', data.MUK_KJID); 
				$("#noti_tbody div#MUI_NAME_DIV").eq(iRow).html(data.MUI_NAME); 
				$("#noti_tbody div#MDI_DPTNAME_DIV").eq(iRow).html(data.MDI_DPTNAME); 
				$("#noti_tbody div#MTI_TEAMNAME_DIV").eq(iRow).html(data.MTI_TEAMNAME); 
				$("#noti_tbody div#TXT_MUI_JCCODE_DIV").eq(iRow).html(data.TXT_MUI_JCCODE); 
			}
			$("#noti_tbody tr:first").attr('style',"display:none");
	 	}
	}
	
	function fn_jour_selectUserRcvTypeList(param, callback, retObj) {
		param.muk_rcvtype = 'RCV';
		fc_clearRow("rcv_tbody");

		var targetUrl = "/jour/0301/selectUserRcvTypeList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_jour_selectUserNotiTypeList(param, callback, retObj) {
		param.muk_rcvtype = 'NOTI';
		fc_clearRow("noti_tbody");

		var targetUrl = "/jour/0301/selectUserRcvTypeList.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
	}

	function fn_pop_selectUserRcvTypeList(){
		var param = {
			muk_rcvtype : ""
		};
		fn_jour_selectUserRcvTypeList(param, selectUserRcvTypeList);
		fn_jour_selectUserNotiTypeList(param, selectUserNotiTypeList);
	}

	function fn_pop_deleteUserRcvType(rcvType, targetRow){
		if(!confirm("삭제하시겠습니까?")){
			return;	
		}
		var muk_kjid = "";
		if(rcvType=="NOTI"){
			muk_kjid = $("#noti_tbody div#MUK_KJID_DIV").eq(targetRow).attr('data-val');
		}else if(rcvType=="RCV"){
			muk_kjid = $("#rcv_tbody div#MUK_KJID_DIV").eq(targetRow).attr('data-val');
		}
		var param = {
				muk_kjid : muk_kjid
		};

		var targetUrl = "/jour/0301/deleteUserRcvType.do";
		$.getJSON(targetUrl, param, function(result) {
			console.log(JSON.stringify(result));
			if (typeof (callback) == "function") {
				callback.call(retObj, result);
			}
		});
		fn_pop_selectUserRcvTypeList();
	}
	
	$(document).ready(function() {
		var arrVvrmno = [];
		<c:forEach items="${vvrmList}" var="vvrm" varStatus="status">
		arrVvrmno[${status.index}] = '${vvrm.SVG_VVRMNO}';
		</c:forEach>
	    getMultiComboVvrm("#MVI_VVRMNAME", arrVvrmno);
		var data = {
				sch_dptno : ""
		};
		fn_jour_selectUserKjpList(data, selectUserKjpList);
		
		if(gb_ss_auth_grp=="SA" || fn_is_vm(0301)){
			$(".add_btn").css("display","");
			$(".info_add_btn").css("display","");
			$(".del2_btn").css("display","");
			$(".save_btn").css("display","");
			$(".excel_btn").css("display","");
			$(".popent_btn").css("display","");
			$(".popcancel_btn").css("display","");
			$(".cha_btn").css("display","");	
		}
	});
	
</script>

<title>동물사육 &gt; 사육일지</title>
</head>
<body>
<div id="sub_wrap">

	<jsp:include page="/header.do"></jsp:include>
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
                    <p class="contents_title">사육일지</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물사육</li>
                        <li>> 사육일지</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
				<!-- contents-->
				<div class="contents_table">
					<!-- 결재-->
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title">
							<img src="/images/btn_minus.gif" alt="">결재</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide">
								<a href="#layer01" class="add_btn" onclick="javascript:fn_pop_selectUserRcvTypeList();" style="display: none;">수정</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>결재</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">순서</th>
									<th scope="col" id="th04">이름</th>
									<th scope="col" id="th05">부서</th>
									<th scope="col" id="th06">직책</th>
									<th scope="col" id="th07">결재</th>
								</tr>
							</thead>
							<tbody id="kjp_tbody">
								<tr>
									<th scope="row" id="n01" headers="th01"><div id="KJP_INDEX_DIV" data-val=''></div></th>
									<td headers="n01 th02"><div id="MCC_S_NAME_DIV" data-val=''></div></td>
									<td headers="n01 th03"><div id="MUK_KJSEQ_DIV" data-val=''></div></td>
									<td headers="n01 th04"><div id="MUI_NAME_DIV" data-val=''></div></td>
									<td headers="n01 th05"><div id="MDI_DPTNAME_DIV" data-val=''></div></td>
									<td headers="n01 th06"><div id="TXT_MUI_JCCODE_DIV" data-val=''></div><div id="MUI_DPTLVLNAME_DIV" data-val=''></div></td>
									<td headers="n01 th07"></td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">수신</td>
									<td headers="n02 th03">2</td>
									<td headers="n02 th04">홍길동</td>
									<td headers="n02 th05">동물복지1과</td>
									<td headers="n02 th06">주임</td>
									<td headers="n02 th07"></td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">3</th>
									<td headers="n03 th02">참조</td>
									<td headers="n03 th03">1</td>
									<td headers="n03 th04">홍길동</td>
									<td headers="n03 th05">동물복지1과</td>
									<td headers="n03 th06">사원</td>
									<td headers="n03 th07"></td>
								</tr>
							</tbody>
						</table>
					
					</div>
					<!-- //결재-->

					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<img src="/images/btn_minus.gif">문서정보</span>
							<div class="sys_btn_box">
										<span class="align_right btn_hide2"> 
										<a href="javascript:history.back();" class="print_btn" >목록</a>&nbsp;
										<a href="javascript:updateSDJ_DocInfo();" class="add_btn" style="display: none;">저장</a>
										</span>
									</div>
						</div>
						<form method="POST" name="docInfo_form" id="docInfo_form">
						<input type="hidden" id="sdj_docno" name="sdj_docno" value="${docInfo.SDJ_DOCNO}" />
						<input type="hidden" id="mai_vvrmno" name="mai_vvrmno" value="${docInfo.SDJ_VVRMNO}" />
						<input type="hidden" id="sdj_jnldate" name="sdj_jnldate" value="${docInfo.TXT_SDJ_JNLDATE}" />
						<table class="aniinfo_search table_view2" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">문서번호</th>
									<c:if test="${docInfo.SDJ_DOCNO != null and param.c ne 'undefined' }">
									<td colspan="3">${docInfo.SDJ_DOCNO}</td>
									</c:if>	
									<c:if test="${docInfo.SDJ_DOCNO == null}">
									<td colspan="3"></td>	
									</c:if>
									<c:if test="${param.c eq 'undefined'}">
									<td colspan="3"></td>	
									</c:if>
								</tr>
								<tr>
									<th scope="row">작성자</th>
									<c:if test="${docInfo.SDJ_DOCNO != null }">
									<td>${docInfo.MUI_NAME }</td>
									</c:if>
									<c:if test="${docInfo.SDJ_DOCNO == null }">
									<td>${sessionScope['ss_gha_username']}</td>
									</c:if>
									<th scope="row">동물사</th><td><select id="MVI_VVRMNAME" name="MVI_VVRMNAME" multiple="multiple" style="width: 300px" class='textfield'></td>
								</tr>
								<tr>
									<th scope="row">구분</th>
									<td>
									<%-- <c:set var="text" value="${docInfo.SDJ_DOCNO}"/>
									<c:choose>
									<c:when test="${fn:substring(text, 0, 2) == 'SY'}">
									사육일지
									</c:when>
									</c:choose> --%>
									사육일지
									</td>
									<th scope="row">날씨</th><td>
									<select id="SDJ_WTHENO" name="SDJ_WTHENO">
									<option value="">-- 날씨 선택 --</option>
										<c:forEach var="weatherList" items="${weatherList }" varStatus="st" >
											<option value="${weatherList.MCC_S_CODE}" <c:if test="${docInfo.SDJ_WTHENO == weatherList.MCC_S_CODE}"> selected="selected"</c:if>>${weatherList.MCC_S_NAME }</option>
											</c:forEach>
									</select>
									</td>
								</tr>
								<tr>
									<th scope="row">근무자</th><td><input type="text" id="SDJ_USERINFO" name="SDJ_USERINFO" value="${docInfo.SDJ_USERINFO}" class="textfield"></td>
									<th scope="row">작성일</th>
									<c:if test="${docInfo.SDJ_DOCNO == null }">
									<td><fmt:formatDate value="<%=new Date() %>" pattern="yyyy. MM. dd."/>	</td>
									</c:if>
									<c:if test="${docInfo.SDJ_DOCNO != null }">
									<td>${docInfo.TXT_SDJ_JNLDATE }</td>
									</c:if>
								</tr>
						   </tbody>
						</table>
						</form>
					</div>
					<!-- //문서정보-->	
					
					<c:if test="${docInfo.SDJ_DOCNO != null }">
					<!-- tab_menu -->
					<div class="tab_menu">
						<ul>
							<li class="on"><a href="#tab01">동물현황</a></li>
							<li><a href="#tab03">동물 및 시설점검</a></li>
							<li><a href="#tab02">사육관리</a></li>
							<li><a href="#tab04">추진사항</a></li>
							<li><a href="#tab05">지시사항</a></li>
						</ul>
					</div>
					<!-- // tab_menu -->
					
						<!-- tab01 -->
						<jsp:include page="/jour/0301/tab01.do"></jsp:include>
						<!-- //tab01 -->

						<!-- tab02 -->
						<jsp:include page="/jour/0301/tab02.do"></jsp:include> 
						<!-- //tab02 -->

					 	<!-- tab03 -->
						<jsp:include page="/jour/0301/tab03.do"></jsp:include>
						<!-- tab03 -->

						<!-- tab04 -->
						<jsp:include page="/jour/0301/tab04.do"></jsp:include>
						<!-- //tab04 -->

						<!-- tab05 -->
						<jsp:include page="/jour/0301/tab05.do"></jsp:include> 
						<!-- //tab05 --> 
						</c:if>
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
		</div>

			<!-- layer_popup -->
			<div class="layer_popup">
				<div class="dimm"></div>
				<!-- #layer01 -->
				<div class="layer_box" id="layer01" style="width: 800px;">
					<div class="layer_tit">결재 정보</div>
					<div class="layer_con">
						<div class="table_box">
							<p class="sub_title" style="margin-bottom: 10px;">
								수신<a href="#layer02" class="table_add_btn layer_open popnext_je"
									style="margin-top: -5px; text-indent: 0;">추가</a>
							</p>
							<table class="aniinfo_add" style="width: 760px;">
								<caption>결재정보 수신</caption>
								<colgroup>
									<col style="width: 10%;">
									<col style="width: 15%;">
									<col style="width: 25%;">
									<col style="width: 20%;">
									<col style="width: 15%;">
									<col style="width: 15%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" id="th01_1">No</th>
										<th scope="col" id="th02_1">이름</th>
										<th scope="col" id="th03_1">부서</th>
										<th scope="col" id="th04_1">팀</th>
										<th scope="col" id="th05_1">직책</th>
										<th scope="col" id="th06_1">선택</th>
									</tr>
								</thead>
								<tbody id="rcv_tbody">
									<tr style="display: none">
										<th scope="row" id="n01_1" headers="th01_1"><div
												id="RCV_INDEX_DIV" data-val=''></div></th>
										<td headers="n01_1 th02_1"><div id="MUK_KJID_DIV"
												data-val=''></div>
											<div id="MUI_NAME_DIV" data-val=''></div></td>
										<td headers="n01_1 th03_1"><div id="MDI_DPTNAME_DIV"
												data-val=''></div></td>
										<td headers="n01_1 th04_1"><div id="MTI_TEAMNAME_DIV"
												data-val=''></div></td>
										<td headers="n01_1 th05_1"><div id="TXT_MUI_JCCODE_DIV"
												data-val=''></div></td>
										<td headers="n01_1 th06_1"><a href="#"
											class="del2_btn btn_type2">
											<div onclick="javascript:fn_pop_deleteUserRcvType('RCV', $(this).attr('data-val'));" id="RCV_DEL_DIV" data-val=''>삭제</div></a></td>
									</tr>
									<tr>
										<th scope="row" id="n01_1" headers="th01_1">1</th>
										<td headers="n01_1 th02_1">김길동</td>
										<td headers="n01_1 th03_1">동물복지2과</td>
										<td headers="n01_1 th04_1"></td>
										<td headers="n01_1 th05_1">과장</td>
										<td headers="n01_1 th06_1"><a href="#" class="del2_btn">삭제</a></td>
									</tr>

								</tbody>
							</table>
						</div>
						<!-- pagination -->
						<div class="pagination" style="margin-top: 10px;">
							<a href="#" class="page first"></a> <a href="#" class="page prev"></a>
							<a href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a>
							<a href="#">4</a> <a href="#">5</a>
							<!--
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						-->
							<a href="#" class="page next"></a> <a href="#" class="page last"></a>
						</div>
						<!-- //pagination -->

						<div class="table_box" style="margin-top: 20px;">
							<p class="sub_title" style="margin-bottom: 10px;">
								참조<a href="#layer02" class="table_add_btn layer_open popnext_je"
									style="margin-top: -5px; text-indent: 0;">추가</a>
							</p>
							<table class="aniinfo_add" style="width: 760px;">
								<caption>결재 정보 참조</caption>
								<colgroup>
									<col style="width: 10%;">
									<col style="width: 15%;">
									<col style="width: 25%;">
									<col style="width: 20%;">
									<col style="width: 15%;">
									<col style="width: 15%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" id="th01_2">No</th>
										<th scope="col" id="th02_2">이름</th>
										<th scope="col" id="th03_2">부서</th>
										<th scope="col" id="th04_2">팀</th>
										<th scope="col" id="th05_2">직책</th>
										<th scope="col" id="th06_2">선택</th>
									</tr>
								</thead>
								<tbody id="noti_tbody">
									<tr style="display: none">
										<th scope="row" id="n02_2" headers="th02_2"><div
												id="NOTI_INDEX_DIV" data-val=''></div></th>
										<td headers="n01_2 th02_2"><div id="MUK_KJID_DIV"
												data-val=''></div>
											<div id="MUI_NAME_DIV" data-val=''></div></td>
										<td headers="n01_2 th03_2"><div id="MDI_DPTNAME_DIV"
												data-val=''></div></td>
										<td headers="n01_2 th04_2"><div id="MTI_TEAMNAME_DIV"
												data-val=''></div></td>
										<td headers="n01_2 th05_2"><div id="TXT_MUI_JCCODE_DIV"
												data-val=''></div></td>
										<td headers="n01_2 th06_2"><a href="#"
											class="del2_btn btn_type2">
											<div id="NOTI_DEL_DIV" data-val='' onclick="javascript:fn_pop_deleteUserRcvType('NOTI', $(this).attr('data-val'));">삭제</div></a></td>
									</tr>
									<tr>
										<th scope="row" id="n01_2" headers="th01_2">1</th>
										<td headers="n01_2 th02_2">김길동</td>
										<td headers="n01_2 th03_2">동물복지2과</td>
										<td headers="n01_2 th04_2"></td>
										<td headers="n01_2 th05_2">과장</td>
										<td headers="n01_2 th06_2"><a href="#" class="del2_btn">삭제</a></td>
									</tr>
									<tr>
										<th scope="row" id="n02_2" headers="th01_2">2</th>
										<td headers="n02_2 th02_2"></td>
										<td headers="n02_2 th03_2"></td>
										<td headers="n02_2 th04_2"></td>
										<td headers="n02_2 th05_2"></td>
										<td headers="n02_2 th06_2"><a href="#" class="del2_btn">삭제</a></td>
									</tr>

								</tbody>
							</table>
						</div>
						<!-- pagination -->
						<div class="pagination" style="margin-top: 10px;">
							<a href="#" class="page first"></a> <a href="#" class="page prev"></a>
							<a href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a>
							<a href="#">4</a> <a href="#">5</a>
							<!--
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						-->
							<a href="#" class="page next"></a> <a href="#" class="page last"></a>
						</div>
						<!-- //pagination -->


						<div class="btn_area">
							<a href="#none" class="popent_btn btn_type2">확인</a> <a
								href="#none" class="popcancel_btn btn_type2">취소</a>
						</div>
					</div>
					<a href="#none" class="layer_close">레이어팝업 닫기</a>
				</div>
				<!-- //#layer01-->


				<!-- #layer02 -->
				<div class="layer_box" id="layer02" style="width: 800px;">
					<div class="layer_tit">직원목록</div>
					<div class="layer_con">
						<div class="search_box">
							<table class="search_table" style="width: 760px;">
								<caption>직원목록</caption>
								<colgroup>
									<col style="width: 20%;">
									<col style="width: 80%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">종류</th>
										<td>
											<p>
												<label><input type="radio" name="list" value="A"
													class="search_radio" />이름</label> <label><input
													type="radio" name="list" value="B" class="search_radio" />팀</label>
												<label><input type="radio" name="list" value="c"
													class="search_radio" />부서</label>
											</p>
										</td>
									</tr>
									<tr>
										<th scope="row">검색</th>
										<td><input name="textfield" type="text"
											id="popseach_text2" class="textfield" style="width: 90%" /><label
											for="popseach_text2"></label></td>
									</tr>
									<tr>
										<th colspan="2" scope="col" class="search_btn_area"><a
											href="#" class="search_btn">조회</a></th>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="table_box">
							<table class="aniinfo_add"
								style="width: 760px; margin-top: 20px;">
								<caption>종 정보</caption>
								<colgroup>
									<col style="width: 10%;">
									<col style="width: 15%;">
									<col style="width: 25%;">
									<col style="width: 20%;">
									<col style="width: 15%;">
									<col style="width: 15%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" id="th01_3">No</th>
										<th scope="col" id="th02_3">이름</th>
										<th scope="col" id="th03_3">부서</th>
										<th scope="col" id="th04_3">팀</th>
										<th scope="col" id="th05_3">직책</th>
										<th scope="col" id="th06_3">선택</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row" id="n01_3" headers="th01_3">1</th>
										<td headers="n01_3 th02_3">김길동</td>
										<td headers="n01_3 th03_3">동물복지2과</td>
										<td headers="n01_3 th04_3"></td>
										<td headers="n01_3 th05_3">과장</td>
										<td headers="n01_3 th06_3"><input type="checkbox"
											id="sel_chk"><label for="sel_chk"></label></td>
									</tr>
									<tr>
										<th scope="row" id="n02_3" headers="th01_3">2</th>
										<td headers="n02_3 th02_3">김길동</td>
										<td headers="n02_3 th03_3">동물복지2과</td>
										<td headers="n02_3 th04_3"></td>
										<td headers="n02_3 th05_3">과장</td>
										<td headers="n02_3 th06_3"><input type="checkbox"
											id="sel_chk2"><label for="sel_chk2"></label></td>
									</tr>
									<tr>
										<th scope="row" id="n03_3" headers="th01_3">3</th>
										<td headers="n03_3 th02_3"></td>
										<td headers="n03_3 th03_3"></td>
										<td headers="n03_3 th04_3"></td>
										<td headers="n03_3 th05_3"></td>
										<td headers="n03_3 th06_3"></td>
									</tr>
									<tr>
										<th scope="row" id="n04_3" headers="th01_3">4</th>
										<td headers="n04_3 th02_3"></td>
										<td headers="n04_3 th03_3"></td>
										<td headers="n04_3 th04_3"></td>
										<td headers="n04_3 th05_3"></td>
										<td headers="n04_3 th06_3"></td>
									</tr>
									<tr>
										<th scope="row" id="n05_3" headers="th01_3">5</th>
										<td headers="n05_3 th02_3"></td>
										<td headers="n05_3 th03_3"></td>
										<td headers="n05_3 th04_3"></td>
										<td headers="n05_3 th05_3"></td>
										<td headers="n05_3 th06_3"></td>
									</tr>

								</tbody>
							</table>
						</div>

						<!-- pagination -->
						<div class="pagination" style="margin-top: 10px;">
							<a href="#" class="page first"></a> <a href="#" class="page prev"></a>
							<a href="#" class="on">1</a> <a href="#">2</a> <a href="#">3</a>
							<a href="#">4</a> <a href="#">5</a>
							<!--
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						-->
							<a href="#" class="page next"></a> <a href="#" class="page last"></a>
						</div>
						<!-- //pagination -->

						<div class="btn_area">
							<a href="#none" class="popadd_btn btn_type2">추가</a> <a
								href="#none" class="popcancel_btn btn_type2">취소</a>
						</div>
					</div>
					<a href="#none" class="layer_close">레이어팝업 닫기</a>
				</div>
				<!-- //#layer02-->


				<!-- #layer03 
		<div class="layer_box" id="layer03" style="width:800px;">
			<div class="layer_tit">동물정보</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" style="width:760px;" >
							<caption>동물정보</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">종류</th>
                                <td>
                                <p>
                                  <label><input type="radio" name="list" value="A" class="search_radio" />종</label>
                                  <label><input type="radio" name="list" value="B" class="search_radio"/>동물사</label>
								  <label><input type="radio" name="list" value="c" class="search_radio"/>동물이름</label>
  								  <label><input type="radio" name="list" value="c" class="search_radio"/>동물번호</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">검색</th><td><input name="textfield" type="text" id="popseach_text3" class="textfield" style="width:90%"/><label for="popseach_text3"></label></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;" >
							<caption>종 정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="p3th01_1">No</th>
									<th scope="col" id="p3th02_1">동물종</th>
									<th scope="col" id="p3th03_1">동물번호</th>
									<th scope="col" id="p3th04_1">동물사</th>
									<th scope="col" id="p3th05_1">동물이름</th>
									<th scope="col" id="p3th06_1">선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="p3n01_1" headers="p3th01_1">1</th>
									<td headers="p3n01_1 p3th02_1">김길동</td>
									<td headers="p3n01_1 p3th03_1">동물복지2과</td>
									<td headers="p3n01_1 p3th04_1"></td>
									<td headers="p3n01_1 p3th05_1">과장</td>
									<td headers="p3n01_1 p3th06_1"><input type="checkbox" id="sel3_chk"><label for="sel3_chk"></label></td>
								</tr>
								<tr>
									<th scope="row" id="p3n01_2" headers="p3th01_1">2</th>
									<td headers="p3n01_2 p3th02_1">김길동</td>
									<td headers="p3n01_2 p3th03_1">동물복지2과</td>
									<td headers="p3n01_2 p3th04_1"></td>
									<td headers="p3n01_2 p3th05_1">과장</td>
									<td headers="p3n01_2 p3th06_1"><input type="checkbox" id="sel3_chk2"><label for="sel3_chk2"></label></td>
								</tr>
								<tr>
									<th scope="row" id="p3n01_3" headers="p3th01_1">3</th>
									<td headers="p3n01_3 p3th02_1"></td>
									<td headers="p3n01_3 p3th03_1"></td>
									<td headers="p3n01_3 p3th04_1"></td>
									<td headers="p3n01_3 p3th05_1"></td>
									<td headers="p3n01_3 p3th06_1"></td>
								</tr>
								<tr>
									<th scope="row" id="p3n01_4" headers="p3th01_1">4</th>
									<td headers="p3n01_4 p3th02_1"></td>
									<td headers="p3n01_4 p3th03_1"></td>
									<td headers="p3n01_4 p3th04_1"></td>
									<td headers="p3n01_4 p3th05_1"></td>
									<td headers="p3n01_4 p3th06_1"></td>
								</tr>
								<tr>
									<th scope="row" id="p3n01_5" headers="p3th01_1">5</th>
									<td headers="p3n01_5 p3th02_1"></td>
									<td headers="p3n01_5 p3th03_1"></td>
									<td headers="p3n01_5 p3th04_1"></td>
									<td headers="p3n01_5 p3th05_1"></td>
									<td headers="p3n01_5 p3th06_1"></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					
					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2">확인</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>	
		

		#layer03-->


			</div>
			<!-- // layer_popup -->
			
		</div>
		<!-- //container -->
		<!-- footer -->
		<jsp:include page="/footer.do"></jsp:include>
		<!-- //footer -->
</body>
</html>
