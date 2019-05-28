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
function deletedata(SEQ) {
    var tableth = document.getElementById('tr_' + SEQ); // 테이블지정
    $('#tr_' + SEQ).remove();
}
function AddData() {
    var bum_table = document.getElementById('KS03table'); // 테이블지정
    var row_length = bum_table.rows.length;    // 테이블 row 개수(Tr의 개수
    var lastTr = bum_table.rows[row_length-1].cells[0].innerHTML;
    var bum_tbody = bum_table.getElementsByTagName('tbody')[0];    // table의 첫번째 차일드 즉 tbody를 지정한다.
    var bum_tr, bum_td1, bum_td2, bum_td3, bum_td4, bum_td5;
    bum_tr = document.createElement('TR');     // Tr을 하나 생성한다.
    bum_tbody.appendChild(bum_tr);      // tbody에 자식노드를 하나 추가한다.
    bum_td1 = document.createElement('TD');    // Td를 생성한다.
    bum_td1.style.textAlign = "center";
    var No = '';
    if (lastTr != "No") {
        No = Number(lastTr);
        No = No + 1;
    }else{
    	No = 1;
    }
    bum_tr.id = 'tr_' + No;
    bum_td1.innerHTML = No;
    bum_td2 = document.createElement('TD');    // Td를 생성한다.
    bum_td2.innerHTML = "<input name='JJDKJK_WAY' type='text' class='textfield' value=''><label for='JJDKJK_WAY'></label>";
    bum_td3 = document.createElement('TD');    // Td를 생성한다.
    bum_td3.innerHTML = "<input name='JJDKJK_PART' type='text' class='textfield' value=''><label for='JJDKJK_PART'></label>";
    bum_td4 = document.createElement('TD');    // Td를 생성한다.
    bum_td4.innerHTML = "<input name='JJDKJK_RSLT' type='text' class='textfield' value=''><label for='JJDKJK_RSLT'></label>";
    bum_td5 = document.createElement('TD');    // Td를 생성한다.
    bum_td5.innerHTML = "<a href='javascript:deletedata(\"" + No + "\");' class='cancel_btn' style='width: 80px;margin-left:0px;border:solid 1px #397516;background:#4d9721;color:#fff !important;'>삭제</a>";
    bum_tr.appendChild(bum_td1);      // Tr에 td를 하나 추가한다.
    bum_tr.appendChild(bum_td2);      // Tr에 td를 하나 추가한다.
    bum_tr.appendChild(bum_td3);      // Tr에 td를 하나 추가한다.
    bum_tr.appendChild(bum_td4);      // Tr에 td를 하나 추가한다.
    bum_tr.appendChild(bum_td5);      // Tr에 td를 하나 추가한다.
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
        form.action = "/treat/0406/InspctMgr_K03_Save.do";
        form.submit();
    }
}
function prc_delete() {
    var form = document.jinryoFrom;
    if (confirm("삭제 하시겠습니까 ?")) {
        form.action = "/treat/0406/InspctMgr_K03_Delete.do";
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
                    <p class="contents_title">진균검사</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <c:choose>
                        <c:when test="${MenuType == 'J'}">
							<li>> 동물진료</li>
                        	<li>> 검사관리</li>
                        	<li>> 진균검사</li>
						</c:when>
						<c:otherwise>
							<li>> 병리방역업무</li>
                        	<li>> 부검결과서</li>
                        	<li>> 검사관리</li>
                        	<li>> 진균검사</li>
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
							<c:if test="${PMS0406 == 'Y'}">
							<div class="sys_btn_box" style="margin-bottom:5px;">
							<span>
								<a href="javascript:AddData();" class="cha_btn" style="margin-left:10px;">추가</a>
							</span>	
							</div>	
							</c:if>
						</div>								
						<table class="aniinfo_add table_view2"  id="KS03table">
							<caption>상세검사내용</caption>
							<colgroup>
							<col style="width:10%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="width:40%;">
							<col style="width:10%;">
							</colgroup>
							<thead>
							<tr align="center">
								<th scope="col">No</th>
								<th scope="col">검사방법</th>
								<th scope="col">검사부위</th>
								<th scope="col">검사결과</th>
								<th scope="col">삭제</th>
							</tr>
							</thead>
							<tbody>
							<c:choose>
							<c:when test="${PMS0406 == 'Y'}">
							<c:forEach var="KS03INFO" items="${KS03INFO}" varStatus="st">
						    <tr id = 'tr_${KS03INFO.SEQ}'>
						    	<td>${KS03INFO.SEQ}</td>
						    	<td><input name='JJDKJK_WAY' type='text' class='textfield' value='${KS03INFO.JJDKJK_WAY}'><label for='JJDKJK_WAY'></label></td>
						    	<td><input name='JJDKJK_PART' type='text' class='textfield' value='${KS03INFO.JJDKJK_PART}'><label for='JJDKJK_PART'></label></td>
						    	<td><input name='JJDKJK_RSLT' type='text' class='textfield' value='${KS03INFO.JJDKJK_RSLT}'><label for='JJDKJK_RSLT'></label></td>
						    	<td>
									<a href='javascript:deletedata("${KS03INFO.SEQ}");' class='cancel_btn' style='width: 80px;margin-left:0px;border:solid 1px #397516;background:#4d9721;color:#fff !important;'>
										삭제
									</a>
						    	</td>
						    </tr>
							</c:forEach>
							</c:when>
							<c:otherwise>	
							<c:forEach var="KS03INFO" items="${KS03INFO}" varStatus="st">
						    <tr id = 'tr_${KS03INFO.SEQ}'>
						    	<td>${KS03INFO.SEQ}</td>
						    	<td>${KS03INFO.JJDKJK_WAY}</td>
						    	<td>${KS03INFO.JJDKJK_PART}</td>
						    	<td>${KS03INFO.JJDKJK_RSLT}</td>
						    	<td></td>
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
