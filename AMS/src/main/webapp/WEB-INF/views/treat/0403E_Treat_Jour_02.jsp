<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>

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
<script type="text/javascript">
$(document).ready(function(){
	function readURL(input) {
		if (input.files && input.files[0]) {
            var FileSize = input.files[0].size; //파일용량
            var MaxFileSize = 1024 * 3072; //제한용량
            if(FileSize > MaxFileSize){
            	return false;
            }
            else{
            	return true;
            }
        }
    }
	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	$("#biz_file").change(function(){
		var input_value = this.value.replace("C:\\fakepath\\", "");
		$("#filePath").val(input_value);
		if(this.value != ''){
			if(!readURL(this)){
				alert("제한용량을 초과하였습니다.");
				this.value = '';
				$("#filePath").val('');
			}
		}
	});
	fn_MSG();
});
function fn_MSG(){
	var msg = document.getElementById('msg').value;
	if (msg != null && msg != "") {
		alert(msg);
	}
	document.getElementById('msg').value = "";
}
//////////////////////////////////////////
// 진료내역조회
function prc_Search() {
    var form = document.jinryoFrom;
    if (confirm("이전 진료내역 정보를 조회/수정 하시겠습니까 ?")) {
    	document.getElementById('DTLDay').value = document.getElementById('SeqDay').value;
    	form.action="/treat/0403/CareJnlAdd.do";
        form.submit();
    }
}
function delete_File() {
    var form = document.jinryoFrom;
    var filename = document.getElementById('filePath').value;
    var DTLDay = document.getElementById('DTLDay').value;
    if (filename == "" || filename == null) {
        alert("첨부파일이 없습니다.");
    }
    else {
        if (confirm("[" + DTLDay + "] 첨부파일을 삭제 하시겠습니까?")) {
            form.action="/treat/0403/deleteFileInfo.do";
            form.submit();
        }
    }
}
function DownFile() {
    var form = document.jinryoFrom;
    var filename = document.getElementById('filePath').value;
    var DTLDay = document.getElementById('DTLDay').value;
    //
    if (filename == "" || filename == null) {
        alert("첨부파일이 없습니다.");
    }
    else {
        if (confirm("[" + DTLDay + "] 첨부파일을 다운로드 하시겠습니까?")) {
    		form.action = "/treat/0403/Filedownload.do";
    		form.submit();
        }
    }
}
//////////////////////////////////////////
// 처방전 작성
function prc_CheBang(ag_Date) {
    var form = document.jinryoFrom;
    var DTLDay = document.getElementById('DTLDay').value;
    document.getElementById('PageType').value = "CB";
    var wk_Date = (ag_Date == "") ? DTLDay : ag_Date;
    if (ag_Date == "") {
        confirmMemo = "보존하지 않은 데이터는 자동저장됩니다.\n[" + wk_Date + "] 처방전 작성으로 이동하시겠습니까 ?";
    }
    else {
        confirmMemo = "[" + wk_Date + "] 처방전 작성으로 이동하시겠습니까?";
    }
    //
    if (confirm(confirmMemo)) {
    	document.getElementById('CBDATE').value = wk_Date;
    	form.action="/treat/0403/CareJnlAdd_Save.do";
        form.submit();
    }
}
//////////////////////////////////////////
// 검사예약
function prc_KSRes() {
    var form = document.jinryoFrom;
    var DTLDay = document.getElementById('DTLDay').value;
    document.getElementById('PageType').value = "KS";
    if (confirm("보존하지 않은 데이터는 자동저장됩니다.\n[" + DTLDay + "] 검사예약으로 이동하시겠습니까 ?")) {
    	document.getElementById('KSDATE').value = DTLDay;
    	form.action="/treat/0403/CareJnlAdd_Save.do";
        form.submit();
    }
}
//////////////////////////////////////////
// 검사조회
function prc_KSInq(ag_Date) {
    var form = document.jinryoFrom;
    var DTLDay = document.getElementById('DTLDay').value;
    document.getElementById('PageType').value = "KS";
    var wk_Date = (ag_Date == "") ? DTLDay : ag_Date;
    //
    if (confirm("[" + wk_Date + "] 검사조회로 이동하시겠습니까 ?")) {
    	document.getElementById('KSDATE').value = wk_Date;
    	form.action="/treat/0403/CareJnlAdd_Save.do";
        form.submit();
    }
}

//////////////////////////////////////////
// 진료일지 저장
function prc_Save() {
    var form = document.jinryoFrom;
    document.getElementById('PageType').value = "";
    if (confirm("저장 하시겠습니까 ?")) {
    	form.action="/treat/0403/CareJnlAdd_Save.do";
        form.submit();
    }
}

//////////////////////////////////////////
// 진료일지 삭제 (개시상신 또는 진료내역이 있는 진료일지는 삭제 불가..)
function prc_Del() {
    var form = document.jinryoFrom;
    if (confirm("삭제 하시겠습니까? ")) {
        form.action = "/treat/0403/CareJnlAdd_Delete.do";
        form.submit();
    }
}
// 처치혹은 치료내역 삭제.
function prc_Del2() {
    var form = document.jinryoFrom;
    if (confirm("삭제 하시겠습니까? ")) {
        form.action = "/treat/0403/CareJnlDate_Delete.do";
        form.submit();
    }
}
/////////////////////////////////////////////

function fn_treat_view0701S(jbj_docno, type){
	var targetUrl = "/sign/0701/insSIGN.do";
	location.href = targetUrl + "?DOCTYPE=" + type + "&DOCNO=" +jbj_docno;
}

</script>
<title>동물진료 &gt; 진료일지</title>
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
			<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">진료일지</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물진료</li>
                        <li>> 진료일지</li>
                        <li>> 추가</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="jinryoFrom" id="jinryoFrom" enctype="multipart/form-data" >
					<input type="hidden" id="DOCNO" name="DOCNO" value='${jinryoINFO.JJR_DOCNO}' />
					<input type="hidden" id="JRNO" name="JRNO" value='${jinryoINFO.JJJ_DOCNO}' />
					<input type="hidden" id="RCDATE" name="RCDATE" value='${jinryoINFO.JJR_RCDATE}' />
					<input type="hidden" id="JJR_JRType" name="JJR_JRType" value='${jinryoINFO.JJR_JRTYPE}' />
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<input type="hidden" id="DTLDay" name="DTLDay" value="${DTLDay}" />
					<input type="hidden" id="CBDATE" name="CBDATE" value="" />
					<input type="hidden" id="KSDATE" name="KSDATE" value="" />
					<input type="hidden" id="PageType" name="PageType" value="" />
					
					<c:choose>
					<c:when test="${GESI_CHK == true}">
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">게시결재</span>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>게시결재</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">구분</th>
									<th scope="col" id="th02">순서</th>
									<th scope="col" id="th03">이름</th>
									<th scope="col" id="th04">부서</th>
									<th scope="col" id="th05">직책</th>
									<th scope="col" id="th06">결재</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="GESI_SIGN_USER" items="${GESI_SIGN_USER}" varStatus="st">
									<c:if test="${GESI_SIGN_USER.BSU_RCVTYPE == 'RCV'}">
									<tr>
										<td headers="n01 th01">수신</td>
										<td headers="n01 th02">${GESI_SIGN_USER.BSU_ORDER}</td>
										<td headers="n01 th03">${GESI_SIGN_USER.BSU_KJ_USERNAME}</td>
										<td headers="n01 th04">${GESI_SIGN_USER.BSU_DPT_NAME}</td>
										<td headers="n01 th05">${GESI_SIGN_USER.BSU_JC_NAME}</td>
										<td headers="n01 th06">${GESI_SIGN_USER.BSU_KJDATE}</td>
									</tr>
									</c:if>
								</c:forEach>
								<tr>
									<td headers="n01 th01">기안</td>
									<td headers="n01 th02"></td>
									<td headers="n01 th03">${GESI_SIGN_INFO.BSL_USER_NAME}</td>
									<td headers="n01 th04">${GESI_SIGN_INFO.BSL_DPT_NAME}</td>
									<td headers="n01 th05">${GESI_SIGN_INFO.BSL_JCCODE_NAME}</td>
									<td headers="n01 th06">${GESI_SIGN_INFO.CMN_MAK_DATE}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<c:choose>
					<c:when test="${JONGLYO_CHK == true}">
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">종료결재</span>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>종료결재</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">구분</th>
									<th scope="col" id="th02">순서</th>
									<th scope="col" id="th03">이름</th>
									<th scope="col" id="th04">부서</th>
									<th scope="col" id="th05">직책</th>
									<th scope="col" id="th06">결재</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="JONGLYO_SIGN_USER" items="${JONGLYO_SIGN_USER}" varStatus="st">
									<c:if test="${JONGLYO_SIGN_USER.BSU_RCVTYPE == 'RCV'}">
									<tr>
										<td headers="n01 th01">수신</td>
										<td headers="n01 th02">${JONGLYO_SIGN_USER.BSU_ORDER}</td>
										<td headers="n01 th03">${JONGLYO_SIGN_USER.BSU_KJ_USERNAME}</td>
										<td headers="n01 th04">${JONGLYO_SIGN_USER.BSU_DPT_NAME}</td>
										<td headers="n01 th05">${JONGLYO_SIGN_USER.BSU_JC_NAME}</td>
										<td headers="n01 th06">${JONGLYO_SIGN_USER.BSU_KJDATE}</td>
									</tr>
									</c:if>
								</c:forEach>
								<tr>
									<td headers="n01 th01">기안</td>
									<td headers="n01 th02"></td>
									<td headers="n01 th03">${JONGLYO_SIGN_INFO.BSL_USER_NAME}</td>
									<td headers="n01 th04">${JONGLYO_SIGN_INFO.BSL_DPT_NAME}</td>
									<td headers="n01 th05">${JONGLYO_SIGN_INFO.BSL_JCCODE_NAME}</td>
									<td headers="n01 th06">${JONGLYO_SIGN_INFO.CMN_MAK_DATE}</td>
								</tr>
							</tbody>
						</table>
					</div>
					</c:when>
					<c:otherwise>
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">종료결재</span>
							<div class="sys_btn_box" style="margin-bottom:5px;">
							<span>
								<a href="javascript:fn_treat_view0701S('${jinryoINFO.JJJ_DOCNO}','4');" class="cancel_btn" style="width: 80px;margin-left:10px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">종료결재</a>
							</span>	
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>종료결재</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">구분</th>
									<th scope="col" id="th02">순서</th>
									<th scope="col" id="th03">이름</th>
									<th scope="col" id="th04">부서</th>
									<th scope="col" id="th05">직책</th>
									<th scope="col" id="th06">결재</th>
								</tr>
							</thead>
						</table>
					</div>
					</c:otherwise>
					</c:choose>
					</c:when>
					<c:otherwise>
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">게시결재</span>
							<div class="sys_btn_box" style="margin-bottom:5px;">
							<span>
								<a href="javascript:fn_treat_view0701S('${jinryoINFO.JJJ_DOCNO}','3');" class="cancel_btn" style="width: 80px;margin-left:10px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">게시결재</a>
							</span>	
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>게시결재</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">구분</th>
									<th scope="col" id="th02">순서</th>
									<th scope="col" id="th03">이름</th>
									<th scope="col" id="th04">부서</th>
									<th scope="col" id="th05">직책</th>
									<th scope="col" id="th06">결재</th>
								</tr>
							</thead>
						</table>
					</div>
					</c:otherwise>
					</c:choose>
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">문서정보</span>
						</div>
						<table class="aniinfo_search" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
                            	<c:choose>
                            	<c:when test="${PMS0403 == 'Y'}">
								<tr>
									<th scope="row">진료 개시 일자</th>
									<td colspan="3">
										<input name="SDay" type="text" id="SDay" class="calendar1" value="${jinryoINFO.JJJ_SDATE}"/>
										<label for="SDay"></label>
									</td>
								</tr>
								<tr>
									<th scope="row">진료 개시 일자</th>
									<td colspan="3">
										<input name="EDay" type="text" id="EDay" class="calendar2" value="${jinryoINFO.JJJ_EDATE}"/>
										<label for="EDay"></label>
									</td>
								</tr>
								</c:when>
								<c:otherwise>
								<tr>
									<th scope="row">진료 개시 일자</th>
									<td colspan="3">${jinryoINFO.JJJ_SDATE}</td>
								</tr>
								<tr>
									<th scope="row">진료 개시 일자</th>
									<td colspan="3">${jinryoINFO.JJJ_EDATE}</td>
								</tr>
								</c:otherwise>
								</c:choose>
								<tr>
									<th scope="row">진료구분</th>
									<td>
										${jinryoINFO.JJJ_JRTYPE}
									</td>
									<th scope="row">접수번호</th>
									<td>
										[${jinryoINFO.JJR_JRTYPE}]${jinryoINFO.JJR_DOCNO}
									</td>
								</tr>
								<tr>
									<th scope="row">진료번호</th>
									<td>
										${jinryoINFO.JJJ_DOCNO}
									</td>
									<th scope="row">접수일자</th>
									<td>
										${jinryoINFO.JJR_RCDATE}
									</td>
								</tr>
						   </tbody>
						</table>

					</div>
					<!-- //문서정보-->
					<!-- 동물정보 -->
					
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">동물정보</span>
						</div>
						<table class="aniinfo_search" >
							<caption>동물정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:17%;">
								<col style="width:11%;">
								<col style="width:15%;">
							</colgroup>
                            <thead>
								<tr>
									<th scope="col" id="th01">동물명</th>
									<th scope="col" id="th02">영명</th>
									<th scope="col" id="th03">동물번호</th>
									<th scope="col" id="th04">성별</th>
									<th scope="col" id="th05">동물사</th>
									<th scope="col" id="th06">생년월일(나이)</th>
									<th scope="col" id="th07">반입일자</th>
									<th scope="col" id="th08">반입처</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="text-align: center;">${m_AniTmp.MAC_NAME}</td>
									<td style="text-align: center;">${m_AniTmp.MAC_ENAME}</td>
									<td style="text-align: center;">${m_AniTmp.MAI_ANICODE}</td>
									<td style="text-align: center;">${m_AniTmp.SEXNAME}</td>
									<td style="text-align: center;">${m_AniTmp.VVRMNAME}</td>
									<td style="text-align: center;">${m_AniTmp.MAI_BIRTHDAY}(${m_AniTmp.CURAGE})</td>
									<td style="text-align: center;">${m_AniTmp.DAIO_IODATE}</td>
									<td style="text-align: center;">${m_AniTmp.DAIO_PLACE}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보 -->
					<!-- 진료공통 정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">진료 공통 정보</span>
						</div>
						<table class="aniinfo_search" >
							<caption>진료 공통 정보</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            	<c:choose>
                            	<c:when test="${PMS0403 == 'Y'}">
								<tr>
									<th scope="row">진단명</th>
									<td>
										<input name="JRDZZNAME" type="text" id="JRDZZNAME" class="textfield" value="${jinryoINFO.JJJ_JRDZZNAME}"/>
										<label for="JRDZZNAME"></label>
									</td>
								</tr>
								<tr>
									<th scope="row">임상증상</th>
									<td>
										<input name="JRCMNT" type="text" id="JRCMNT" class="textfield" value="${jinryoINFO.JJJ_JRCMNT}"/>
										<label for="JRCMNT"></label>
									</td>
								</tr>
								<tr>
									<th scope="row">질병구분</th>
									<td>
                                		<select name="DZZTYPE" id="DZZTYPE">
											<option value="">-- 질병 구분 선택 --</option>
											<c:forEach var="DZZList" items="${DZZList}" varStatus="st">							
												<option value="${DZZList.MCC_S_CODE}" <c:if test="${jinryoINFO.JJJ_JRDZZTYPE == DZZList.MCC_S_CODE}"> selected="selected"</c:if>>${DZZList.MCC_S_NAME}</option>
											</c:forEach>
										</select>	
									</td>
								</tr>
								<tr>
									<th scope="row">진료상태</th>
									<td>
                                		<p>
											<c:forEach var="JRSTSList" items="${JRSTSList}" varStatus="st">
												<c:choose>
													<c:when test="${jinryoINFO.JJJ_JRSTS == JRSTSList.MCC_S_CODE}">
														<label><input type="radio" name="JRSTS" value="${JRSTSList.MCC_S_CODE}" class="search_radio" checked="checked" />${JRSTSList.MCC_S_NAME}</label>
													</c:when>
													<c:otherwise>
														<label><input type="radio" name="JRSTS" value="${JRSTSList.MCC_S_CODE}" class="search_radio"/>${JRSTSList.MCC_S_NAME}</label>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">야생조수인수증</th>
									<td>
										<input name="INSU" type="text" id="INSU" class="textfield" value="${jinryoINFO.JJJ_INSU}"/>
										<label for="INSU"></label>
									</td>
								</tr>
								<tr>
									<th scope="row">의뢰처</th>
									<td>
										<input name="REQORGA" type="text" id="REQORGA" class="textfield" value="${jinryoINFO.JJJ_REQORGA}"/>
										<label for="REQORGA"></label>
									</td>
								</tr>
								</c:when>
								<c:otherwise>
								<tr>
									<th scope="row">진단명</th>
									<td>${jinryoINFO.JJJ_JRDZZNAME}</td>
								</tr>
								<tr>
									<th scope="row">임상증상</th>
									<td>${jinryoINFO.JJJ_JRCMNT}</td>
								</tr>
								<tr>
									<th scope="row">질병구분</th>
									<td>
										<c:forEach var="DZZList" items="${DZZList}" varStatus="st">							
										<c:if test="${jinryoINFO.JJJ_JRDZZTYPE == DZZList.MCC_S_CODE}">
											${DZZList.MCC_S_NAME}
										</c:if>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row">진료상태</th>
									<td>
										<c:forEach var="JRSTSList" items="${JRSTSList}" varStatus="st">
										<c:if test="${jinryoINFO.JJJ_JRSTS == JRSTSList.MCC_S_CODE}">
											${JRSTSList.MCC_S_NAME}
										</c:if>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row">야생조수인수증</th>
									<td>${jinryoINFO.JJJ_INSU}</td>
								</tr>
								<tr>
									<th scope="row">의뢰처</th>
									<td>${jinryoINFO.JJJ_REQORGA}</td>
								</tr>
								</c:otherwise>
								</c:choose>
						   </tbody>
						</table>
					</div>
					<!-- //진료공통 정보 -->
					<!--처치 혹은 치료내역 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">처치 혹은 치료내역</span>
						</div>
						<table class="aniinfo_search" style="text-align: center;">
							<caption>처치 혹은 치료내역</caption>
							<colgroup>
								<col style="width:21%;">
								<col style="width:65%;">
								<col style="width:14%;">
							</colgroup>
                            <thead>
								<tr>
									<th scope="row">일자 / 진료의</th>
									<th scope="row">처치 혹은 치료내용</th>
									<th scope="row">처방전/검사정보</th>
								</tr>
						   </thead>
						   <tbody>
						   		<c:if test="${m_JRDtlSize > 0}">
						   		<c:forEach var="m_JRDtl" items="${m_JRDtl}" varStatus="st">		
								<tr>
									<td style="line-height:20px;vertical-align: middle;padding-left: 0px;">${m_JRDtl.JJD_JRDATE}<br />[${m_JRDtl.USERNAME}]</td>
									<td style="line-height:20px;vertical-align: middle;padding-left: 0px;">
										<div style="text-align: center;">
											<textarea cols="20"  maxlength="500" rows="2" style="width:98%;min-height:75px;overflow:auto;" disabled="disabled">${m_JRDtl.JJD_CMNT}</textarea>
											<c:if test="${m_JRDtl.CBDATACHK == '1'}">
											<table class="aniinfo_search" >
												<caption>처방약리스트</caption>
												<colgroup>
													<col style="width:5%;">
													<col style="width:20%;">
													<col style="width:10%;">
													<col style="width:10%;">
													<col style="width:55%;">
												</colgroup>
                            					<thead>
													<tr>
														<th scope="row">No</th>
														<th scope="row">처방약</th>
														<th scope="row">용량</th>
														<th scope="row">단위</th>
														<th scope="row">용법</th>
													</tr>
						   						</thead>
						   						<tbody>
						   						<c:set var="CBCnt" value="0"/>
												<c:forEach var="m_CBData" items="${m_CBData}" varStatus="st">
													<c:if test="${m_JRDtl.JJD_JRDATE == m_CBData.JJDCB_CBDATE}">
													<c:set var="CBCnt" value="${CBCnt + 1}"/>
						   							<tr>
						   								<td>${CBCnt}</td>
						   								<td style="LINE-HEIGHT: 1.5;">${m_CBData.MDI_NAME}</td>
						   								<td>${m_CBData.JJDCB_USEVOL}</td>
						   								<td>${m_CBData.UNITNAME}</td>
						   								<td style="LINE-HEIGHT: 1.5;">${m_CBData.JJDCB_CMNT}</td>
						   							</tr>
						   							</c:if>
												</c:forEach>
												</tbody>
											</table>
											</c:if>
											<c:if test="${m_JRDtl.KYLSTCHK == '1'}">
											<table class="aniinfo_search" >
												<caption>검사리스트</caption>
												<colgroup>
													<col style="width:5%;">
													<col style="width:10%;">
													<col style="width:20%;">
													<col style="width:55%;">
													<col style="width:10%;">
												</colgroup>
                            					<thead>
													<tr>
														<th scope="row">No</th>
														<th scope="row">검사번호</th>
														<th scope="row">검사명</th>
														<th scope="row">특기사항</th>
														<th scope="row">상태</th>
													</tr>
						   						</thead>
						   						<tbody>
												<c:forEach var="m_KYLst" items="${m_KYLst}" varStatus="st">
													<c:if test="${m_JRDtl.JJD_JRDATE == m_KYLst.JJDKY_KSDATEYY}">
						   							<tr>
						   								<td>${m_KYLst.SEQ}</td>
						   								<td>${m_KYLst.JJDKY_KSNO}</td>
						   								<td>${m_KYLst.KSNAME}</td>
						   								<td style="LINE-HEIGHT: 1.5;">${m_KYLst.JJDKY_CMNT}</td>
						   								<td>
						   									<c:choose>
						   									<c:when test="${m_KYLst.JJDKY_KSSTS == '0'}">
						   										예약
						   									</c:when>
						   									<c:when test="${m_KYLst.JJDKY_KSSTS == '1'}">
						   										검사중
						   									</c:when>
						   									<c:otherwise>
						   										완료
						   									</c:otherwise>
						   									</c:choose>
						   								</td>
						   							</tr>
						   							</c:if>
												</c:forEach>
												</tbody>
											</table>
											</c:if>
											<c:if test="${m_JRDtl.FILECHK == '1'}">
												<c:forEach var="m_JRFileData" items="${m_JRFileData}" varStatus="st">
													<c:if test="${m_JRDtl.JJD_JRDATE == m_JRFileData.BDA_BZDATE}">
						   								<samp>첨부파일 : ${m_JRFileData.BDA_CMNT}</samp>
						   							</c:if>
												</c:forEach>
											</c:if>
										</div>
									</td>
									<td style="line-height:20px;vertical-align: middle;padding-left: 0px;">
										<c:if test="${PMS0403 == 'Y'}">
										<a href="javascript:prc_CheBang('${m_JRDtl.JJD_JRDATE}');" class="cancel_btn" style="margin-left:0px; width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">처방전</a>
										<br/>
										<a href="javascript:prc_KSInq('${m_JRDtl.JJD_JRDATE}');" class="cancel_btn" style="margin-left:0px; width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">검사조회</a>
										</c:if>
									</td>
								</tr>
								</c:forEach>
								</c:if>
								<c:if test="${PMS0403 == 'Y'}">
								<tr>
									<td style="line-height:20px;vertical-align: middle;padding-left: 0px;">
										${DTLDay}<br/>
										<input name="SeqDay" type="text" id="SeqDay" class="calendar1" value="${DTLDay}"/>
										<label for="DTLDay"></label>
										<br/>
										<a href="javascript:prc_Search();" class="cancel_btn" style="margin-left:0px; width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">검색</a>
									</td>
									<td style="line-height:20px;vertical-align: middle;padding-left: 0px;" class="filebox">
										<textarea cols="20"  maxlength="500" rows="2" style="width:98%;min-height:75px;overflow:auto;border: solid 1px gray;" name="J_CMNT">${J_CMNT}</textarea>
										<br/>
										<input type="text" id="filePath" name="filePath" class="upload-name" value="${fileNAME}" disabled="disabled" style="width:40%;">
										<c:choose>
											<c:when test="${not empty fileNAME}">
												<label id="label_file" for="biz_file" style="display: none;">첨부하기</label> 
												<input type="file" id="biz_file" name="biz_file" class="upload-hidden" style="display: none;">
												<a id="file_del" href="javascript:delete_File();" class="btn_search">삭제하기</a>
												<a href="javascript:DownFile();" class="btn_search">다운로드</a>
											</c:when>
											<c:otherwise>
												<label id="label_file" for="biz_file">첨부하기</label>
												<input type="file" id="biz_file" name="biz_file" class="upload-hidden">
												<a id="file_del" href="javascript:delete_File();" class="btn_search" style="display: none;">삭제하기</a>
											</c:otherwise>
										</c:choose>
									</td>
									<td style="line-height:20px;vertical-align: middle;padding-left: 0px;">
										<a href="javascript:prc_CheBang('');" class="cancel_btn" style="margin-left:0px; width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">처방전</a>
										<br/>
										<a href="javascript:prc_KSRes();" class="cancel_btn" style="margin-left:0px; width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">검사예약</a>
										<br/>
										<a href="javascript:prc_Del2();" class="cancel_btn" style="margin-left:0px; width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">삭제</a>
									</td>
								</tr>
								</c:if>
						   </tbody>
						</table>
					</div>
					<!-- //처치 혹은 치료내역 -->
					<!-- //문서정보 -->
					<div class="table_title_box" style= "margin-top: 20px;">
						<div class="sys_btn_box">
							<c:if test="${PMS0403 == 'Y'}">
							<a href="javascript:prc_Save();" class="cancel_btn" style="width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">저장</a>
							<a href="javascript:prc_Del();" class="save_btn" style="width: 80px;margin-left:10px;border:solid 1px #FF0000;background:#F15F5F;color:#fff !important;">삭제</a>
							</c:if>
							<a href="/treat/0403/main.do" class="cancel_btn" style="width: 80px">목록</a>
						</div>
					</div>
					</form>
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>
	<!-- //container -->
	<!-- footer -->
	<div id="footer_wrap">
		<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
	</div>
</div>
</body>
</html>