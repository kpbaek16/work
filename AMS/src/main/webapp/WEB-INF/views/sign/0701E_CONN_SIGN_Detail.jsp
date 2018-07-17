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

<title>전자결재 &gt; 연계문서</title>
</head>

<script type="text/javascript">
	function SignDel() {
		if (confirm("삭제 하시겠습니까?")) {
			var form = document.signFrom;
			form.action="/sign/0701/CONN_deleteSIGNInfo.do";
			form.submit();
		}
	}
	function fn_MSG() {
		var msg = document.getElementById('msg').value;
		if (msg != null && msg != "") {
			alert(msg);
		}
		
		var PROCHK = document.getElementById('PROCHK').value;
		if (PROCHK == "false") {
			alert("연계상태 체크프로그램이 서버에서 동작하고 있지 않습니다.");
		}
		document.getElementById('msg').value = "";
		document.getElementById('PROCHK').value = "";
	}
	function fn_SIGN_ACTION(){
		var form = document.signFrom;
		form.action="/sign/0701/CONN_setSIGN_Action.do";
		form.submit();
	}
	function fn_SIGN_Modify(){
		var form = document.signFrom;
		form.action="/sign/0701/CONN_modifySIGN.do";
		form.submit();
	}
	function fn_SIGN_PDF(){
		var form = document.signFrom;
		form.action="/sign/0701/Filedownload.do";
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
                    <p class="contents_title">연계문서</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 전자결재</li>
                        <li>> 연계문서</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="signFrom" id="signFrom">
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<input type="hidden" id="PROCHK" name="PROCHK" value="${PROCHK}" />
					<input type="hidden" id="DOCNO" name="DOCNO" value="${DOCNO}" />
					<input type="hidden" id="DOCTYPE" name="DOCTYPE" value="${DOCTYPE}" />
					<input type="hidden" id="KJPTYPE" name="KJNO" value="${KJNO}" />
					<input type="hidden" id="TYPE" name="TYPE" value="" />
					<!-- 문서정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>연계정보</span>
						</div>
						<table class="aniinfo_search table_view2" >
							<caption>연계정보</caption>
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
								<tr style="height:450px;">
									<th scope="row"  style="vertical-align: middle;">연계본문</th>
									<td style="padding:10px 5px; font-size:13px; color:#555; line-height:20px;">
										${SIGN_INFO.BSL_CMNT}
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보 -->
					<div class="table_title_box" style= "margin-top: 20px;">
						<div class="sys_btn_box">
							<c:if test="${SIGN_INFO.BSL_PROCSTS == 1}">
								<c:if test="${SIGN_INFO.BSL_USER_ID == USERID}">
									<a href="javascript:fn_SIGN_ACTION();" class="save_btn" style="width: 80px;margin-left:10px">기안전송</a>
									<a href="javascript:fn_SIGN_Modify();" class="cancel_btn" style="width: 80px;margin-left:10px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">수정</a>
									<a href="javascript:SignDel();" class="save_btn" style="width: 80px;margin-left:10px;border:solid 1px #FF0000;background:#F15F5F;color:#fff !important;">삭제</a>
								</c:if>
							</c:if>
							<c:if test="${SIGN_INFO.BSL_PROCSTS != 1}">
								<a href="javascript:fn_SIGN_PDF('${DOCNO}','${KJNO}');" class="cancel_btn" style="width: 80px;margin-left:10px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">PDF다운</a>
							</c:if>
							<a href="/sign/0701/CONN_SIGN_INFO.do" class="cancel_btn" style="width: 80px;margin-left:10px;">목록</a>
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
