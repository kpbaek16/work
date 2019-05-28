<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  <!-- 달력 스크립트-->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/json2.js"></script>
<script src="/js/common/common.js"></script>

<title>전자결재 &gt; 문서관리</title>
</head>

<script type="text/javascript">
	function SignDel() {
		if (confirm("삭제 하시겠습니까?")) {
			var form = document.signFrom;
			form.action="/sign/0701/deleteSIGNInfo.do";
			form.submit();
		}
	}
	function fn_MSG() {
		var msg = document.getElementById('msg').value;
		if (msg != null && msg != "") {
			alert(msg);
		}
		document.getElementById('msg').value = "";
	}
	function fn_SIGN_ACTION(type){
		document.getElementById('TYPE').value = type;
		var form = document.signFrom;
		form.action="/sign/0701/setSIGN_Action.do";
		form.submit();
	}
	function fn_SIGN_Modify(){
		var form = document.signFrom;
		form.action="/sign/0701/modifySIGN.do";
		form.submit();
	}
	$(document).ready(function() {
		fn_MSG();
	});
</script>
<body>
<div id="sub_wrap">
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
                    <p class="contents_title">문서관리</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 전자결재</li>
                        <li>> 문서관리</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="signFrom" id="signFrom">
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<input type="hidden" id="DOCNO" name="DOCNO" value="${DOCNO}" />
					<input type="hidden" id="DOCTYPE" name="DOCTYPE" value="${DOCTYPE}" />
					<input type="hidden" id="KJPTYPE" name="KJNO" value="${KJNO}" />
					<input type="hidden" id="TYPE" name="TYPE" value="" />
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>결재</span>
						</div>
						<div id="KJP_DIV">
						<table id="KJP_TABLE" class="aniinfo_add table_view" >
							<caption>결재</caption>
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
								<c:forEach var="SIGN_USERList" items="${SIGN_USERList}" varStatus="st">
									<c:if test="${SIGN_USERList.BSU_RCVTYPE == 'RCV'}">
									<tr>
										<td headers="n01 th01">수신</td>
										<td headers="n01 th02">${SIGN_USERList.BSU_ORDER}</td>
										<td headers="n01 th03">${SIGN_USERList.BSU_KJ_USERNAME}</td>
										<td headers="n01 th04">${SIGN_USERList.BSU_DPT_NAME}</td>
										<td headers="n01 th05">${SIGN_USERList.BSU_JC_NAME}</td>
										<td headers="n01 th06">${SIGN_USERList.BSU_KJDATE}</td>
									</tr>
									</c:if>
								</c:forEach>
								<tr>
									<td headers="n01 th01">기안</td>
									<td headers="n01 th02"></td>
									<td headers="n01 th03">${SIGN_INFO.BSL_USER_NAME}</td>
									<td headers="n01 th04">${SIGN_INFO.BSL_DPT_NAME}</td>
									<td headers="n01 th05">${SIGN_INFO.BSL_JCCODE_NAME}</td>
									<td headers="n01 th06">${SIGN_INFO.CMN_MAK_DATE}</td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
					<div class="aniinfo_add_box" style="margin-top:20px;">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>참조</span>
						</div>
						<div id="KJP_DIV">
						<table id="KJP_TABLE" class="aniinfo_add table_view2" >
							<caption>참조</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:25%;">
								<col style="width:25%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">구분</th>
									<th scope="col" id="th02">이름</th>
									<th scope="col" id="th03">부서</th>
									<th scope="col" id="th04">직책</th>
									<th scope="col" id="th05">결재</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="SIGN_USERList" items="${SIGN_USERList}" varStatus="st">
									<c:if test="${SIGN_USERList.BSU_RCVTYPE == 'NOTI'}">
									<tr>
										<td headers="n01 th01">참조</td>
										<td headers="n01 th02">${SIGN_USERList.BSU_KJ_USERNAME}</td>
										<td headers="n01 th03">${SIGN_USERList.BSU_DPT_NAME}</td>
										<td headers="n01 th04">${SIGN_USERList.BSU_JC_NAME}</td>
										<td headers="n01 th05">${SIGN_USERList.BSU_CNFMDATE}</td>
									</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
					<!-- 문서정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus3"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>문서정보</span>
						</div>
						<table class="aniinfo_search table_view3" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="width:70%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">제목</th>
									<td>${SIGN_INFO.BSL_DOCCMNT}</td>
								</tr>
								<tr>
									<th scope="row">작성자</th>
									<td>${SIGN_INFO.BSL_USER_NAME}(${SIGN_INFO.BSL_DPT_NAME} - ${SIGN_INFO.BSL_TEAM_NAME})</td>
								</tr>
								<tr>
									<th scope="row">문서종류</th><td>${DOCTYPE_VAL}</td>				
								</tr>
								<tr>
									<th scope="row">문서번호</th><td>${DOCNO}</td>				
								</tr>
								<tr>
									<th scope="row">문서상태</th><td>${SIGN_INFO.BSL_PROCSTS_NAME}</td>				
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보 -->
					<div class="table_title_box" style= "margin-top: 20px;">
						<div class="sys_btn_box">
							<c:choose>
								<c:when test="${SIGN_INFO.BSL_PROCSTS == 1}">
									<c:if test="${SIGN_INFO.BSL_USER_ID == USERID}">
										<a href="javascript:fn_SIGN_ACTION('Y');" class="save_btn" style="width: 80px;margin-left:10px">상신</a>
										<a href="javascript:fn_SIGN_Modify();" class="cancel_btn" style="width: 80px;margin-left:10px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">수정</a>
										<a href="javascript:SignDel();" class="save_btn" style="width: 80px;margin-left:10px;border:solid 1px #FF0000;background:#F15F5F;color:#fff !important;">삭제</a>
									</c:if>
								</c:when>
								<c:otherwise>
									<c:forEach var="SIGN_USERList" items="${SIGN_USERList}" varStatus="st">
										<c:if test="${SIGN_USERList.BSU_KJPRCSTS == 'Y' && SIGN_USERList.BSU_KJ_USERID == USERID && SIGN_INFO.BSL_RSLTSTS == ' '}">
											<a href="javascript:fn_SIGN_ACTION('Y');" class="save_btn" style="width: 80px;margin-left:10px">결재</a>
											<a href="javascript:fn_SIGN_ACTION('N');" class="save_btn" style="width: 80px;margin-left:10px;border:solid 1px #FF0000;background:#F15F5F;color:#fff !important;">반려</a>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							<a href="/sign/0701/SIGN_INFO.do" class="cancel_btn" style="width: 80px;margin-left:10px;">목록</a>
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
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
	</div>
</div>
</body>
</html>
