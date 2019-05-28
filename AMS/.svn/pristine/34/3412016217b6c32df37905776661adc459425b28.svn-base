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

function fn_MSG(){
	var msg = document.getElementById('msg').value;
	if (msg != null && msg != "") {
		alert(msg);
	}
	document.getElementById('msg').value = "";
}
function fn_sign_search(SIGN_page){
	var form = document.signFrom;
	document.getElementById('page').value = SIGN_page;
	form.action="/sign/0701/CONN_SIGN_INFO.do";
	form.submit();
}	
function search_index(page)
{
	var iTotalPage = document.getElementById('totalPage').value;
	if( page < 1 )
		page = 1;
	if( page > iTotalPage )
		page = iTotalPage;
	fn_sign_search(page);
}
function SIGNDetail(DOCNO,DOCTYPE,KJNO)
{
	var form = document.signFrom;
	document.getElementById('DOCNO').value = DOCNO;
	document.getElementById('DOCTYPE').value = DOCTYPE;
	document.getElementById('KJNO').value = KJNO;
	form.action="/sign/0701/CONN_detailSIGN.do";
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
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" id="totalPage" name="totalPage" value="${TotalPage}" />
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<input type="hidden" id="DOCNO" name="DOCNO" value="" />
					<input type="hidden" id="DOCTYPE" name="DOCTYPE" value="" />
					<input type="hidden" id="KJNO" name="KJNO" value="" />
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>연계문서 내역 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">작성일자</th>
									<td>
										<p>
											<input type="text" class="calendar3" id="firstDate" name = "firstDate" value="${param.firstDate}"><label for="firstDate"></label>
											&nbsp; ~ &nbsp; 
											<input type="text" class="calendar3" id="secondDate" name = "secondDate" value="${param.secondDate}"><label for="secondDate"></label>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">문서종류</th>
									<td>
										<div class="select_box">			
											<select name="selectDocKind" id="selectDocKind">
											<option value="0">전체</option>
											<c:forEach var="DocKindList" items="${DocKindList}" varStatus="st">
												<c:choose>
													<c:when test="${param.selectDocKind == DocKindList.MCC_S_CODE}">
														<option value="${DocKindList.MCC_S_CODE}" selected="selected">${DocKindList.MCC_S_NAME}</option>
													</c:when>
													<c:otherwise>
														<option value="${DocKindList.MCC_S_CODE}">${DocKindList.MCC_S_NAME}</option>
													</c:otherwise>
												</c:choose>
												
											</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">상태</th>
									<td>
										<div class="select_box">			
											<select name="selectStatus" id="selectStatus">
											<option value="0">전체</option>
											<c:forEach var="StatusList" items="${StatusList}" varStatus="st">
												<c:choose>
													<c:when test="${param.selectStatus == StatusList.MCC_S_CODE}">
														<option value="${StatusList.MCC_S_CODE}" selected="selected">${StatusList.MCC_S_NAME}</option>
													</c:when>
													<c:otherwise>
														<option value="${StatusList.MCC_S_CODE}">${StatusList.MCC_S_NAME}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_sign_search('1');" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- // search_area -->
					</form>
					<!-- 검색리스트 -->
					<div class="aniinfo_add_box">			
						<table class="search_list" >
						<caption>검색리스트 내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:12%;">
								<col style="width:17%;">
								<col style="width:12%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">종류</th>
									<th scope="col">문서번호</th>									
									<th scope="col">제목</th>
									<th scope="col">기안자</th>
									<th scope="col">기안일시</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody  id="sign_tbody">
								<c:forEach var="SIGNlist" items="${SIGNlist}" varStatus="st">
								<tr>
									<th scope="row">
										<a href="javascript:SIGNDetail('${SIGNlist.BSL_DOCNO}', '${SIGNlist.BSL_DOCTYPE}', '${SIGNlist.BSL_KJNO}');">
											${SIGNlist.SEQ}
										</a>
									</th>
									<td>
										<a href="javascript:SIGNDetail('${SIGNlist.BSL_DOCNO}', '${SIGNlist.BSL_DOCTYPE}',  '${SIGNlist.BSL_KJNO}');">
											${SIGNlist.BSL_DOCTYPE_NAME}
										</a>
									</td>
									<td class="text_left">
										<a href="javascript:SIGNDetail('${SIGNlist.BSL_DOCNO}', '${SIGNlist.BSL_DOCTYPE}',  '${SIGNlist.BSL_KJNO}');">
											${SIGNlist.BSL_DOCNO}
										</a>
									</td>
									<td>
										<a href="javascript:SIGNDetail('${SIGNlist.BSL_DOCNO}', '${SIGNlist.BSL_DOCTYPE}',  '${SIGNlist.BSL_KJNO}');">
											${SIGNlist.BSL_DOCCMNT}
										</a>
									</td>
									<td>
										<a href="javascript:SIGNDetail('${SIGNlist.BSL_DOCNO}', '${SIGNlist.BSL_DOCTYPE}',  '${SIGNlist.BSL_KJNO}');">
											${SIGNlist.BSL_USER_NAME}
										</a>
									</td>
									<td>
										<a href="javascript:SIGNDetail('${SIGNlist.BSL_DOCNO}', '${SIGNlist.BSL_DOCTYPE}',  '${SIGNlist.BSL_KJNO}');">
											${SIGNlist.CMN_MAK_DATE}
										</a>
									</td>
									<td>
										<a href="javascript:SIGNDetail('${SIGNlist.BSL_DOCNO}', '${SIGNlist.BSL_DOCTYPE}',  '${SIGNlist.BSL_KJNO}');">
											${SIGNlist.BSL_PROCSTS_NAME}
										</a>
									</td>
								<tr>
								</c:forEach>
							</tbody>
						
						</table>

						<!-- pagination -->
						<div class="pagination">
							<a href="javascript:search_index(1);" class="page first"></a>
							<a href="javascript:search_index(${page-1});" class="page prev"></a>
							<c:forEach var="x" begin="${FirstPage}" end="${LastPage}" step="1">
								<c:if test="${x == page}">
									<a href="#" class="on">${x}</a>
								</c:if>
								<c:if test="${x != page}">
									<a href="javascript:search_index(${x});">${x}</a>
								</c:if>
							</c:forEach> 
							<a href="javascript:search_index(${page+1});" class="page next"></a>
							<a href="javascript:search_index(${TotalPage});" class="page last"></a>
						</div>
						<!-- //pagination -->
					</div>
					<!-- //검색리스트 -->
					</div>
				<!-- //contents-->
			</section>

			<!-- //right-->
		</div>
	


	</div>
	<!-- //container -->
	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>
