<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
function DataChk(SEQ,SCODE) {
	$('#tr_' + SEQ).find('input[type="hidden"][name="JJDKSB_RSLTDC"]').val(SCODE);
	//alert($('#tr_' + SEQ).find('input[type="hidden"][name="S_CODE"]').val() + " , " + $('#tr_' + SEQ).find('input[type="hidden"][name="JJDKSB_RSLTDC"]').val());
}
function fn_MSG(){
	var msg = document.getElementById('msg').value;
	if (msg != null && msg != "") {
		alert(msg);
	}
	document.getElementById('msg').value = "";
}
function prc_Save() {
    var form = document.jinryoFrom;
    if (confirm("저장 하시겠습니까 ?")) {
        form.action = "/treat/0406/InspctMgr_K08_Save.do";
        form.submit();
    }
}
function prc_delete() {
    var form = document.jinryoFrom;
    if (confirm("삭제 하시겠습니까 ?")) {
        form.action = "/treat/0406/InspctMgr_K08_Delete.do";
        form.submit();
    }
}
//////////////////////////////////////////
function prc_Return() {
    //  alert("--돌아가기--");
    var form = document.jinryoFrom;
    var wk_RetURL = (form.RetURL.value == null) ? "" : form.RetURL.value;
    //
    if (wk_RetURL == "") {
        form.action = "/treat/0406/main.do";
    } else {
        form.action = wk_RetURL;
    }
    form.submit();

}
$(document).ready(function() {
	fn_MSG();
}); 
/////////////////////////////////////////////
</script>
<title>동물진료 &gt; 검사관리</title>
</head>
<body>
<div id="sub_wrap">
	<!-- header -->
<jsp:include page="/header.do"></jsp:include>
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
                    <p class="contents_title">소변검사</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <c:choose>
                        <c:when test="${MenuType == 'J'}">
							<li>> 동물진료</li>
                        	<li>> 검사관리</li>
                        	<li>> 소변검사</li>
						</c:when>
						<c:otherwise>
							<li>> 병리방역업무</li>
                        	<li>> 부검결과서</li>
                        	<li>> 검사관리</li>
                        	<li>> 소변검사</li>
						</c:otherwise>
						</c:choose>
                    </ol>
				</div>
				<!-- //contents_title-->
				<form method="POST" name="jinryoFrom" id="jinryoFrom">
				<input type="hidden" id="DOCNO" name="DOCNO" value="${DOCNO}" />
				<input type="hidden" id="JRNO" name="JRNO" value="${JRNO}" />
				<input type="hidden" id="DTLDay" name="DTLDay" value="${DTLDay}" />
				<input type="hidden" id="KSDOCNO" name="KSDOCNO" value="${KSDOCNO}" />
				<input type="hidden" id="MenuType" name="MenuType" value="${MenuType}" />
				<input type="hidden" id="RetURL" name="RetURL" value="${RetURL}" />
				<input type="hidden" id="msg" name="msg" value="${msg}" />
				<!-- contents-->
				<div class="contents_table">
					<!-- 공통정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">공통정보</p>
						</div>
						<table class="aniinfo_search" >
							<caption>공통정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:30%;">
								<col style="width:10%;">
							</colgroup>
                            <tbody>
                            	<c:choose>
                            	<c:when test="${MenuType == 'J'}">
								<tr>
									<th scope="row">진료번호</th><td>[${jinryoINFO.JJJ_JRTYPE}]${jinryoINFO.JJJ_DOCNO}</td>
								</tr>
								<tr>
									<th scope="row">진단명</th><td>${jinryoINFO.JJJ_JRDZZNAME}</td>
								</tr>
								<tr>
									<th scope="row">임상증상</th><td>${jinryoINFO.JJJ_JRCMNT}</td>
								</tr>
								</c:when>
								<c:otherwise>
								<tr>
									<th scope="row">부검번호</th><td>[부검]${jinryoINFO.PBR_DOCNO}</td>
								</tr>
								<tr>
									<th scope="row">진단명</th><td>${jinryoINFO.PBR_BUDZZNAME}</td>
								</tr>
								<tr>
									<th scope="row">병리검사결과</th><td>${jinryoINFO.PBR_KSRESLT}</td>
								</tr>
								</c:otherwise>
								</c:choose>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보-->
					
					<!-- 동물정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">동물정보</p>
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
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.MAC_NAME}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.MAC_ENAME}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.MAI_ANICODE}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.SEXNAME}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.VVRMNAME}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.MAI_BIRTHDAY}(${m_AniTmp.CURAGE})</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.DAIO_IODATE}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.DAIO_PLACE}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보-->
					
					<!-- 기본검사내용 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">기본검사내용</p>
						</div>
						<table class="aniinfo_search table_view4" >
							<caption>기본검사내용</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">검사일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" name = "cal_1" value="${DTLDay}">
									<th scope="row">검사구분</th>
									<td>
										<c:choose>
										<c:when test="${MenuType == 'J'}">
											진료
										</c:when>
										<c:otherwise>
											부검
										</c:otherwise>
										</c:choose>
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //기본검사내용 -->
					
					<!-- 향후계획 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>상세검사내용</span>
						</div>								
						<table class="aniinfo_add table_view2"  id="KS08table">
							<caption>상세검사내용</caption>
							<colgroup>
							<col style="width:6%;">
							<col style="width:25%;">
							<col style="width:40%;">
							<col style="width:29%;">
							</colgroup>
							<thead>
							<tr align="center">
								<th scope="col">No</th>
								<th scope="col">검사명</th>
								<th scope="col">검사결과</th>
								<th scope="col">비 고</th>
							</tr>
							</thead>
							<tbody>
							<c:choose>
							<c:when test="${PMS0406 == 'Y'}">
							<c:forEach var="KS08INFO" items="${KS08INFO}" varStatus="st">
						    <tr id = 'tr_${KS08INFO.SEQ}'>
						    	<td>${KS08INFO.SEQ}</td>
						    	<td>${KS08INFO.MCC_S_NAME}<input type='hidden' name='S_CODE' value='${KS08INFO.MCC_S_CODE}'/></td>
						    	<td>
						    		<c:forEach var="KS504LIST" items="${KS504LIST}" varStatus="st">
						    			<c:choose>
						    				<c:when test="${KS08INFO.JJDKSB_RSLTDC == KS504LIST.MCC_S_CODE}">
						    					<label><input type='radio' onclick='javascript:DataChk("${KS08INFO.SEQ}","${KS504LIST.MCC_S_CODE}");' name='RSLTDC_${KS08INFO.SEQ}' value='${KS504LIST.MCC_S_CODE}' class='search_radio' checked='checked' />${KS504LIST.MCC_S_NAME}</label>
						    				</c:when>
						    				<c:otherwise>
						    					<label><input type='radio' onclick='javascript:DataChk("${KS08INFO.SEQ}","${KS504LIST.MCC_S_CODE}");' name='RSLTDC_${KS08INFO.SEQ}' value='${KS504LIST.MCC_S_CODE}' class='search_radio' />${KS504LIST.MCC_S_NAME}</label>
						    				</c:otherwise>
						    			</c:choose>
						    		</c:forEach>
						    		<input type='hidden' name='JJDKSB_RSLTDC' value='${KS08INFO.JJDKSB_RSLTDC}'/>
						    	</td>
						    	<td><input name='JJDKSB_RSLT' type='text' class='textfield' value='${KS08INFO.JJDKSB_RSLT}'><label for='JJDKSB_RSLT'></label></td>
						    </tr>
							</c:forEach>	
							</c:when>
							<c:otherwise>
							<c:forEach var="KS08INFO" items="${KS08INFO}" varStatus="st">
						    <tr id = 'tr_${KS08INFO.SEQ}'>
						    	<td>${KS08INFO.SEQ}</td>
						    	<td>${KS08INFO.MCC_S_NAME}<input type='hidden' name='S_CODE' value='${KS08INFO.MCC_S_CODE}'/></td>
						    	<td>
						    		<c:forEach var="KS504LIST" items="${KS504LIST}" varStatus="st">
						    			<c:choose>
						    				<c:when test="${KS08INFO.JJDKSB_RSLTDC == KS504LIST.MCC_S_CODE}">
						    					<label><input type='radio' disabled="disabled" onclick='javascript:DataChk("${KS08INFO.SEQ}","${KS504LIST.MCC_S_CODE}");' name='RSLTDC_${KS08INFO.SEQ}' value='${KS504LIST.MCC_S_CODE}' class='search_radio' checked='checked' />${KS504LIST.MCC_S_NAME}</label>
						    				</c:when>
						    				<c:otherwise>
						    					<label><input type='radio' disabled="disabled" onclick='javascript:DataChk("${KS08INFO.SEQ}","${KS504LIST.MCC_S_CODE}");' name='RSLTDC_${KS08INFO.SEQ}' value='${KS504LIST.MCC_S_CODE}' class='search_radio' />${KS504LIST.MCC_S_NAME}</label>
						    				</c:otherwise>
						    			</c:choose>
						    		</c:forEach>
						    		<input type='hidden' name='JJDKSB_RSLTDC' value='${KS08INFO.JJDKSB_RSLTDC}'/>
						    	</td>
						    	<td>${KS08INFO.JJDKSB_RSLT}</td>
						    </tr>
							</c:forEach>
							</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="btn_area">
							<c:if test="${PMS0406 == 'Y'}">
							<a href="javascript:prc_delete();" class="popent_btn btn_type2">삭제</a>
							<a href="javascript:prc_Save();" class="popcancel_btn btn_type2">저장</a>
							</c:if>
							<a href="javascript:prc_Return();" class="popcancel_btn btn_type2">돌아가기</a>
							</div>
						</div>
				<!-- //contents-->
				</div>
				</form>
			</section>
			<!-- //right-->
		</div>
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
