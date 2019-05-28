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
	function fn_sign_Insert(PROCSTS){
		var form = document.signFrom;
		document.getElementById('PROCSTS').value = PROCSTS;
		form.action="/sign/0701/CONN_insSIGN_action.do";
		form.submit();
	}	
	function fn_sign_Modify(PROCSTS){
		var form = document.signFrom;
		document.getElementById('PROCSTS').value = PROCSTS;
		form.action="/sign/0701/CONN_modifySIGN_action.do";
		form.submit();
	}
	function fn_MSG(){
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
					<input type="hidden" id="PROCSTS" name="PROCSTS" value="" />
					<input type="hidden" id="KJPTYPE" name="KJPTYPE" value="${KJPTYPE}" />
					<input type="hidden" id="INSTYPE" name="INSTYPE" value="${INSTYPE}" />
					<input type="hidden" id="KJPTYPE" name="KJNO" value="${KJNO}" />
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
									<td>
										<input name="DOCCMNT" type="text" id="DOCCMNT" class="textfield" value="${DOCCMNT}"/>
										<label for="DOCCMNT"></label>
									</td>
								</tr>
								<tr>
									<th scope="row">작성자</th>
									<td>${UserInfo.MUI_NAME}(${UserInfo.MDI_DPTNAME} - ${UserInfo.MTI_TEAMNAME})</td>
								</tr>
								<tr>
									<th scope="row">문서종류</th><td>${DOCTYPE_VAL}</td>				
								</tr>
								<tr>
									<th scope="row">문서번호</th><td>${DOCNO}</td>				
								</tr>
								<tr style="height:450px;">
									<th scope="row" style="vertical-align: middle;">연계본문</th>
									<td>
										<textarea rows="20" id="SIGNCMNT" name="SIGNCMNT" style="width:98%; border: 0; resize: none; padding:10px 5px; font-size:13px; color:#555; line-height:20px; text-align:left;">${CMNT}</textarea>
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보 -->
					<div class="table_title_box" style= "margin-top: 20px;">
						<div class="sys_btn_box">
							<c:choose>
								<c:when test="${INSTYPE == 'M'}">
									<a href="javascript:fn_sign_Modify('1');" class="cancel_btn" style="width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">수정</a>
									<a href="javascript:fn_sign_Modify('2');" class="save_btn" style="width: 80px;margin-left:10px">기안전송</a>
								</c:when>
								<c:otherwise>
									<a href="javascript:fn_sign_Insert('1');" class="cancel_btn" style="width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">임시등록</a>
									<a href="javascript:fn_sign_Insert('2');" class="save_btn" style="width: 80px;margin-left:10px">기안전송</a>
								</c:otherwise>
							</c:choose>
							<a href="/sign/0701/CONN_SIGN_INFO.do" class="cancel_btn" style="width: 80px">목록</a>
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
