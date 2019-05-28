<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        form.action = "/treat/0406/InspctMgr_K01_Save.do";
        form.submit();
    }
}
function prc_delete() {
    var form = document.jinryoFrom;
    if (confirm("삭제 하시겠습니까 ?")) {
        form.action = "/treat/0406/InspctMgr_K01_Delete.do";
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

//////////////////////////////////////////
function dsp_RsltCmnt(CODE, ag_Mean, ag_Devi) {

    var wk_L = "낮음";
    var wk_M = "정상";
    var wk_H = "높음";
    var wk_DspMsg = "";
    var wk_RsltFlnNm = CODE + "_Rslt";
    var wk_CmntFlnNm = CODE + "_Cmnt";
    //
    var wk_InVal = document.getElementById(wk_RsltFlnNm).value;
    if (wk_InVal == "") {
        document.getElementById(wk_CmntFlnNm).value = "";
        return;
    }
    //
    var wk_Dif = wk_InVal - ag_Mean; //검사결과 입력값 - 평균값
    if (wk_Dif > 0)
    {
        if (wk_Dif > ag_Devi) { wk_DspMsg = wk_H; } //검사결과 입력값 - 평균값이 허용오차 보다 큰경우. 높음.
        else { wk_DspMsg = wk_M; } //아닐경우 정상
    }
    else 
    {
        wk_Dif = (-1) * wk_Dif;
        if(wk_Dif > ag_Devi) { wk_DspMsg = wk_L; }
        else                 { wk_DspMsg = wk_M; }
    }

    // 
    document.getElementById(wk_CmntFlnNm).value = wk_DspMsg;
}

/////////////////////////////////////////////
// 숫자만 입력하도록 처리함.
function chk_Number(ag_InpFld) {
    var data = ag_InpFld.value;
    var CommaChk = 0;
    var MinusChk = 0;
    for (var i = 0; i < data.length; ++i) {
        if (!('0' <= data.charAt(i) && data.charAt(i) <= '9' || data.charAt(i) == '.' || data.charAt(i) == '-')) {
            alert("숫자또는 '.' 만 입력하실 수 있습니다.");
            data = "0";
            return data;
        }
        else if (data.charAt(i) == '.') {
            CommaChk++;
        }
        else if (data.charAt(i) == '-') {
            MinusChk++;
        }
    }
    if (CommaChk > 1 || MinusChk > 1) {//'.'이 두번이상 들어간경우.
        alert("정상정인 숫자가 아닙니다. ");
        data = "0";
        return data;
    }
    return data;
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
                    <p class="contents_title">혈액검사</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <c:choose>
                        <c:when test="${MenuType == 'J'}">
							<li>> 동물진료</li>
                        	<li>> 검사관리</li>
                        	<li>> 혈액검사</li>
						</c:when>
						<c:otherwise>
							<li>> 병리방역업무</li>
                        	<li>> 부검결과서</li>
                        	<li>> 검사관리</li>
                        	<li>> 혈액검사</li>
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
						<table class="aniinfo_search table_view2" >
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
							<p class="sub_title">상세검사내용</p>
							<table class="aniinfo_search table_view4" >
								<caption>상세검사내용</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:20%;">
							</colgroup>
                            <thead>
								<tr align="center">
      							  <th scope="col">No</th>
      							  <th scope="col">검사항목</th>
      							  <th scope="col">검사단위</th>
      							  <th scope="col">검사결과</th>
      							  <th scope="col">Mean</th>
      							  <th scope="col">Standard Devi.</th>
      							  <th scope="col">비고</th>
      							</tr>
						   </thead>
						   <tbody>
						   
						   <c:forEach var="KS01INFO" items="${KS01INFO}" varStatus="st">
						    <tr align="center">
						    	<td>${KS01INFO.SEQ}</td>
						    	<td>${KS01INFO.MCC_S_NAME}</td>
						    	<td>${KS01INFO.MCC_COM_S1}</td>
						    	<td>
									<input <c:if test="${PMS0406 != 'Y'}">disabled="disabled"</c:if> onblur="dsp_RsltCmnt('${KS01INFO.MBI_BDINSPCODE}', '${KS01INFO.MBI_MEAN}', '${KS01INFO.MBI_STDDEVI}' );" onkeyup="this.value=chk_Number(this)" name="${KS01INFO.MBI_BDINSPCODE}_Rslt" type="text" id="${KS01INFO.MBI_BDINSPCODE}_Rslt" class="textfield" value="${KS01INFO.JJDKBL_RSLT}"><label for="${KS01INFO.MBI_BDINSPCODE}_Rslt"></label>
								</td>
						    	<td>${KS01INFO.MBI_MEAN}</td>
						    	<td>${KS01INFO.MBI_STDDEVI}</td>
						    	<td>
									<input <c:if test="${PMS0406 != 'Y'}">disabled="disabled"</c:if> readonly="readonly" name="${KS01INFO.MBI_BDINSPCODE}_Cmnt" type="text" id="${KS01INFO.MBI_BDINSPCODE}_Cmnt" class="textfield" value="${KS01INFO.JJDKBL_CMNT}"><label for="${KS01INFO.MBI_BDINSPCODE}_Cmnt"></label>
								</td>
						    </tr>
						   </c:forEach>	
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
