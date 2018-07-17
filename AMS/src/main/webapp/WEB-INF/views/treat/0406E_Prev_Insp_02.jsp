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
	fn_MSG();
});
function prc_Save() {
    var form = document.jinryoFrom;
    // 보존확인
    if (confirm("저장 하시겠습니까 ?"))
    {
        form.action = "/treat/0406/InspctMgrRes_Save.do";
        form.submit();
    }
}
//////////////////////////////////////////
function prc_KSInq(ag_KSNo) {
    var form = document.jinryoFrom;
    var wk_URL = "InspctMgr_" + ag_KSNo + ".do?RetURL=" + "/treat/0406/InspctMgrRes.do";
    //
    //InspctMgr_K01(FormCollection ag_Collect, string JrBuType, string JYSelDocNo, string SelDocNo, string DtlDate, string SubDocNo)
    //
    form.action = wk_URL;
    //
    form.submit();
}

//////////////////////////////////////////
function prc_Return() {
	document.getElementById('DTLDay').value = '';
	var form = document.jinryoFrom;
	form.action="/treat/0403/CareJnlAdd.do";
	form.submit();
}
function fn_MSG(){
	var msg = document.getElementById('msg').value;
	if (msg != null && msg != "") {
		alert(msg);
	}
	document.getElementById('msg').value = "";
}
/////////////////////////////////////////////

</script>
<title>동물진료 &gt; 검사관리</title>
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
                    <p class="contents_title">검사관리</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <c:choose>
							<c:when test="${MenuType == 'J'}">
								<li>> 동물진료</li>
                        		<li>> 진료일지</li>
                        		<li>> 상세내용</li>
                        		<li>> 검사관리</li>
							</c:when>
							<c:otherwise>
								<li>> 병리방역업무</li>
                        		<li>> 부검결과서</li>
                        		<li>> 검사관리</li>
							</c:otherwise>
						</c:choose>

                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="jinryoFrom" id="jinryoFrom" >
					<input type="hidden" id="DOCNO" name="DOCNO" value='${jinryoINFO.JJR_DOCNO}' />
					<input type="hidden" id="JRNO" name="JRNO" value='${jinryoINFO.JJJ_DOCNO}' />
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<input type="hidden" id="DTLDay" name="DTLDay" value="${DTLDay}" />
					<input type="hidden" id="KSDOCNO" name="KSDOCNO" value="${KSINFO.JJDKY_DOCNO}" />
					<input type="hidden" id="MenuType" name="MenuType" value="${MenuType}" />

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
								<tr>
									<th scope="row">검사문서번호</th>
									<td colspan="3">
										${KSINFO.JJDKY_DOCNO}
									</td>
								</tr>
								<tr>
									<th scope="row">예약일자</th>
									<td colspan="3">
										${KSINFO.JJDKY_KSDATEYY}
									</td>
								</tr>
								<c:choose>
								<c:when test="${MenuType == 'J'}">
								<tr>
									<th scope="row">진료번호</th>
									<td>
										${jinryoINFO.JJJ_DOCNO}
									</td>
									<th scope="row">진단명</th>
									<td>
										${jinryoINFO.JJJ_JRDZZNAME}
									</td>
								</tr>
								<tr>
									<th scope="row">임상증상</th>
									<td colspan="3">
										<input name="JRCMNT" type="text" id="JRCMNT" disabled="disabled" class="textfield" value="${jinryoINFO.JJJ_JRCMNT}"/>
										<label for="JRCMNT"></label>
									</td>
								</tr>
								</c:when>
								<c:otherwise>
								<tr>
									<th scope="row">부검번호</th>
									<td>
										${jinryoINFO.PBR_DOCNO}
									</td>
									<th scope="row">진단명</th>
									<td>
										${jinryoINFO.PBR_BUDZZNAME}
									</td>
								</tr>
								<tr>
									<th scope="row">병리검사결과</th>
									<td colspan="3">
										<input name="JRCMNT" type="text" id="JRCMNT" disabled="disabled" class="textfield" value="${jinryoINFO.PBR_KSRESLT}"/>
										<label for="JRCMNT"></label>
									</td>
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
					
					<!-- 처방내역 -->			
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">검사요청 및 완료상황[${DTLDay}]</span>
						</div>
						<table class="aniinfo_search" >
							<caption>처방내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:10%;">
							</colgroup>
                            <thead>
								<tr>
									<th scope="col" id="th01">선택</th>
									<th scope="col" id="th02">검사번호</th>
									<th scope="col" id="th03">검사명</th>
									<th scope="col" id="th04">특기사항</th>
									<th scope="col" id="th05">상태</th>
									<th scope="col" id="th06">완료일</th>
									<th scope="col" id="th07">결과보기</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="wk_DspSts" value=""/>
								<c:forEach var="KSLIST" items="${KSLIST}" varStatus="st">	
								<c:choose>
								<c:when test="${KSLIST.JJDKY_KSSTS == 'X'}">
									<c:set var="wk_DspSts" value=""/>
								</c:when>
								<c:when test="${KSLIST.JJDKY_KSSTS == '0'}">
									<c:set var="wk_DspSts" value="예약"/>
								</c:when>
								<c:when test="${KSLIST.JJDKY_KSSTS == '1'}">
									<c:set var="wk_DspSts" value="검사중"/>
								</c:when>
								<c:otherwise>
									<c:set var="wk_DspSts" value="완료"/>
								</c:otherwise>
								</c:choose>	
								<tr>
									<td headers="n01 th01" style="text-align: center;">
										<c:if test="${KSLIST.JJDKY_KSSTS != '2'}">
											<input type="checkbox" id = "KS_${KSLIST.JJDKY_KSNO}" name = "KS_${KSLIST.JJDKY_KSNO}" value = "true" <c:if test="${KSLIST.KSSELSTS == 'true'}">checked="checked"</c:if>>
											<label for="KS_${KSLIST.JJDKY_KSNO}"></label>
										</c:if>
									</td>
									<td headers="n01 th02" style="text-align: center;">${KSLIST.JJDKY_KSNO}</td>
									<td headers="n01 th03" style="text-align: center;">${KSLIST.KSNONAME}</td>
									<td headers="n01 th04" style="text-align: center;">
										<input name="CMNT_${KSLIST.JJDKY_KSNO}" type="text" id="CMNT_${KSLIST.JJDKY_KSNO}" class="textfield" value="${KSLIST.JJDKY_CMNT}"/>
										<label for="CMNT_${KSLIST.JJDKY_KSNO}"></label>
									</td>
									<td headers="n01 th05" style="text-align: center;">${wk_DspSts}</td>
									<td headers="n01 th06" style="text-align: center;">
										<c:if test="${KSLIST.JJDKY_KSDATE != '1900-01-01'}">
											${KSLIST.JJDKY_KSDATE}
										</c:if>
									</td>
									<td headers="n01 th07" style="text-align: center;">
										<c:if test="${KSLIST.JJDKY_KSSTS == '2'}">
											<a href="javascript:prc_KSInq('${KSLIST.JJDKY_KSNO}');" class="cancel_btn" style="margin-left:0px; width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">조회</a>
										</c:if>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- //처방내역 -->
					
					<!-- //문서정보 -->
					<div class="table_title_box" style= "margin-top: 20px;">
						<div class="sys_btn_box">
							<a href="javascript:prc_Save();" class="cancel_btn" style="width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">저장</a>
							<a href="javascript:prc_Return();" class="cancel_btn" style="width: 80px">목록</a>
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