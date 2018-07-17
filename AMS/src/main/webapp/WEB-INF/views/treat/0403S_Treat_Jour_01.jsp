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
function fn_MSG(){
	var msg = document.getElementById('msg').value;
	if (msg != null && msg != "") {
		alert(msg);
	}
	document.getElementById('msg').value = "";
}
function search_index(page)
{
	var iTotalPage = document.getElementById('totalPage').value;
	if( page < 1 )
		page = 1;
	if( page > iTotalPage )
		page = iTotalPage;
	fn_treat_search(page);
}
function fn_treat_search(page)
{
	var form = document.jinryoFrom;
	document.getElementById('page').value = page;
	form.action="/treat/0403/main.do";
	form.submit();
}
function jinryoDetail(DOCNO,JJJ_DOCNO)
{
	var form = document.jinryoFrom;
	document.getElementById('DOCNO').value = DOCNO;
	document.getElementById('JRNO').value = JJJ_DOCNO;
	form.action="/treat/0403/CareJnlAdd.do";
	form.submit();
}
function fn_jinryoJnlAdd(DOCNO)
{
	var form = document.jinryoFrom;
	document.getElementById('DOCNO').value = DOCNO;
	form.action="/treat/0403/CareJnlAdd.do";
	form.submit();
}
$(document).ready(function() {
	fn_MSG();
}); 
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
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="jinryoFrom" id="jinryoFrom">
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" id="totalPage" name="totalPage" value="${TotalPage}" />
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<input type="hidden" id="DOCNO" name="DOCNO" value="" />
					<input type="hidden" id="ANICODE" name="ANICODE" value="" />
					<input type="hidden" id="JRNO" name="JRNO" value="" />
					<!-- 진료요청/접수조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>진료일지 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                             <tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td><p><input name="cal_1" type="text" class="calendar1" id="cal_1" value="${cal_1}"><label for="cal_1"></label> ~  <input name="cal_2" type="text" class="calendar2" id="cal_2" value="${cal_2}"><label for="cal_2"></label></p></td>						
								</tr>
								<tr>
									<th scope="row">진료번호</th>
									<td><input name="numKeyword" type="text" id="numKeyword" class="textfield" value="${numKeyword}"><label for="numKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">동물사</th>
									<td><input name="vvrmKeyword" type="text" id="vvrmKeyword" class="textfield" value="${vvrmKeyword}"><label for="vvrmKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">동물명</th>
									<td><input name="nameKeyword" type="text" id="nameKeyword" class="textfield" value="${nameKeyword}"><label for="nameKeyword"></label></td>
								</tr>
								<tr>
									<th scope="row">진료구분</th>
									<td>
										<p>
											<label><input type="radio" name="jinryoKind" value="" class="search_radio type1" checked="checked"/>전체</label>
											<c:forEach var="jinryoKind" items="${jinryoKind}" varStatus="st">
												<c:choose>
													<c:when test="${Kind == jinryoKind.MCC_S_CODE}">
														<label><input type="radio" name="jinryoKind" value="${jinryoKind.MCC_S_CODE}" class="search_radio" checked="checked"/>${jinryoKind.MCC_S_NAME}</label>
													</c:when>
													<c:otherwise>
														<label><input type="radio" name="jinryoKind" value="${jinryoKind.MCC_S_CODE}" class="search_radio"/>${jinryoKind.MCC_S_NAME}</label>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">진행</th>
									<td>
										<p>
										 <label><input type="radio" name="jinryoStatus" value="" class="search_radio" checked="checked"/>전체</label>
											<c:forEach var="jinryoStatus" items="${jinryoStatus}" varStatus="st">
												<c:choose>
													<c:when test="${Status == jinryoStatus.MCC_S_CODE}">
														<label><input type="radio" name="jinryoStatus" value="${jinryoStatus.MCC_S_CODE}" class="search_radio" checked="checked" />${jinryoStatus.MCC_S_NAME}</label>
													</c:when>
													<c:otherwise>
														<label><input type="radio" name="jinryoStatus" value="${jinryoStatus.MCC_S_CODE}" class="search_radio"/>${jinryoStatus.MCC_S_NAME}</label>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</p>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_treat_search('1');" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					</form>	
					<!-- //진료일지 조회 -->
					<!-- 진료일지 표 -->
					<div class="aniinfo_add_box">					
						<table class="aniinfo_add" >
						<caption>진료일지 내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:13%;">
								<col style="width:13%;">
								<col style="width:16%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:11%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">접수일자</th>
									<th scope="col" id="th03">진료구분</th>
									<th scope="col" id="th04">접수번호</th>
									<th scope="col" id="th05">진료번호</th>
									<th scope="col" id="th06">동물명</th>
									<th scope="col" id="th08">동물번호</th>
									<th scope="col" id="th07">동물사</th>
									<th scope="col" id="th09">진단명</th>
									<th scope="col" id="th10">상태</th>
								</tr>
							</thead>
							<tbody id="jnl_tbody">
								<c:forEach var="jinryolist" items="${jinryolist}" varStatus="st">
								<tr>
									<th>
										<a href="javascript:jinryoDetail('${jinryolist.JJR_DOCNO}','${jinryolist.JJJ_DOCNO}');">
											${jinryolist.SEQ}
										</a>
									</th>
									<td>
										<a href="javascript:jinryoDetail('${jinryolist.JJR_DOCNO}','${jinryolist.JJJ_DOCNO}');">
											<c:choose>
											<c:when test="${empty jinryolist.JJJ_DOCNO}">
												접수
											</c:when>
											<c:otherwise>
												${jinryolist.JJR_RCDATE}
											</c:otherwise>
											</c:choose>
										</a>
									</td>
									<td>
										<a href="javascript:jinryoDetail('${jinryolist.JJR_DOCNO}','${jinryolist.JJJ_DOCNO}');">
											${jinryolist.JJR_JRTYPE}
										</a>
									</td>
									<td>
										<a href="javascript:jinryoDetail('${jinryolist.JJR_DOCNO}','${jinryolist.JJJ_DOCNO}');">
											${jinryolist.JJR_DOCNO}
										</a>
									</td>
									<td>
										<c:choose>
											<c:when test="${empty jinryolist.JJJ_DOCNO and PMS0403 == 'Y'}">
												<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJR_DOCNO}');" class="cancel_btn" style="width: 80px;margin-left:0px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">
													일지추가
												</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:jinryoDetail('${jinryolist.JJR_DOCNO}','${jinryolist.JJJ_DOCNO}');">
													${jinryolist.JJJ_DOCNO}
												</a>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<a href="javascript:jinryoDetail('${jinryolist.JJR_DOCNO}','${jinryolist.JJJ_DOCNO}');">
											${jinryolist.MAC_NAME}
										</a>
									</td>
									<td>
										<a href="javascript:AniInfo('${jinryolist.BAA_ANICODE}');">
											${jinryolist.BAA_ANICODE}
										</a>
									</td>
									<td>
										<a href="javascript:jinryoDetail('${jinryolist.JJR_DOCNO}','${jinryolist.JJJ_DOCNO}');">
											${jinryolist.VVRMNAME}
										</a>
									</td>
									<td>
										<a href="javascript:jinryoDetail('${jinryolist.JJR_DOCNO}','${jinryolist.JJJ_DOCNO}');">
											${jinryolist.JJJ_JRDZZNAME}
										</a>
									</td>
									<td>
										<a href="javascript:jinryoDetail('${jinryolist.JJR_DOCNO}','${jinryolist.JJJ_DOCNO}');">
											${jinryolist.JRSTSNAME}
										</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- //진료일지 표 -->
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
				<!-- //contents-->
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
