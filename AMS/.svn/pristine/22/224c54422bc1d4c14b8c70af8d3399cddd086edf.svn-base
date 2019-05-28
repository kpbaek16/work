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
	form.action="/treat/0406/main.do";
	form.submit();
}

//////////////////////////////////////////
function fn_jinryoJnlAdd(JRNO, KSNo, KSDOCNO, KS_DIVISION, DOCNO, DTLDay) {
	var menuType = "";
	if(KS_DIVISION == '1')
	{
		menuType = "J";
	}
	else
	{
		menuType = "B";
	}
    var form = document.jinryoFrom;
    if (form.PMS0406.value == "Y") {
    	form.action = "/treat/0406/InspctMgr_" + KSNo + ".do?JRNO=" + JRNO
                                                + "&KSDOCNO=" + KSDOCNO
                                                + "&MenuType=" + menuType
                                                + "&DOCNO=" + DOCNO
                                                + "&DTLDay=" + DTLDay;
    	form.submit();
    }
    else {
        alert("검사정보 추가/삭제 권한이 없습니다.");
    }
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
                        <li>> 동물진료</li>
                        <li>> 검사관리</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="jinryoFrom" id="jinryoFrom">
					<input type="hidden" id="page" name="page" value="${page}" />
					<input type="hidden" id="totalPage" name="totalPage" value="${TotalPage}" />
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<input type="hidden" id="PMS0406" name="PMS0406" value="${PMS0406}" />
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="aniinfo_search" >
							<caption>처방전 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr>
									<th scope="row">일자</th>
									<td>
										<p>
											<input type="text" class="calendar1" name="cal_1" value="${cal_1}"><label for="cal_1"></label> ~  
											<input type="text" class="calendar2" name="cal_2" value="${cal_2}"><label for="cal_2"></label>
										</p>
									</td>						
								</tr>
								<tr>
									<th scope="row">진료번호</th>
									<td><input name="jinryoNum" type="text" id="jinryoNum" class="textfield" value="${jinryoNum}"><label for="jinryoNum"></label></td>
								</tr>
								<tr>
									<th scope="row">동물명</th>
									<td><input name="aniName" type="text" id="aniName" class="textfield" value="${aniName}"><label for="aniName"></label></td>
								</tr>
								<tr>
									<th scope="row">동물번호</th>
									<td><input name="aniNum" type="text" id="aniNum" class="textfield" value="${aniNum}"><label for="aniNum"></label></td>
								</tr>
								<tr>
									<th scope="row">검사구분</th>
									<td>
										<p>
										 <label><input type="radio" name="KS_DIVISION" value="A" class="search_radio" checked="checked" />전체</label>
											<c:forEach var="KS_DIVISION" items="${KS_DIVISION}" varStatus="st">
												<c:choose>
													<c:when test="${DIVISION == KS_DIVISION.MCC_S_CODE}">
														<label><input type="radio" name="KS_DIVISION" value="${KS_DIVISION.MCC_S_CODE}" class="search_radio" checked="checked" />${KS_DIVISION.MCC_S_NAME}</label>
													</c:when>
													<c:otherwise>
														<label><input type="radio" name="KS_DIVISION" value="${KS_DIVISION.MCC_S_CODE}" class="search_radio"/>${KS_DIVISION.MCC_S_NAME}</label>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row" style="vertical-align: middle;">검사종류</th>
									<td style="line-height: 1.5;vertical-align: middle;">
										<p>
										 <label><input type="radio" name="KSTYPE" value="" class="search_radio" checked="checked" />전체</label>
											<c:forEach var="KSTYPE" items="${KSTYPE}" varStatus="st">
												<c:choose>
													<c:when test="${KSINFO == KSTYPE.MCC_S_CODE}">
														<label><input type="radio" name="KSTYPE" value="${KSTYPE.MCC_S_CODE}" class="search_radio" checked="checked" />${KSTYPE.MCC_S_NAME}</label>
													</c:when>
													<c:otherwise>
														<label><input type="radio" name="KSTYPE" value="${KSTYPE.MCC_S_CODE}" class="search_radio"/>${KSTYPE.MCC_S_NAME}</label>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row" style="vertical-align: middle;">검사상태</th>
									<td style="line-height: 1.5;vertical-align: middle;">
										<p>
										 	<label><input type="radio" name="KS_STATUS" value="" class="search_radio" <c:if test="${STATUS == ''}">checked="checked" </c:if> />전체</label>
										 	<label><input type="radio" name="KS_STATUS" value="0" class="search_radio" <c:if test="${STATUS == '0'}">checked="checked" </c:if> />검사예약</label>
										 	<label><input type="radio" name="KS_STATUS" value="1" class="search_radio" <c:if test="${STATUS == '1'}">checked="checked" </c:if> />검사중</label>
										 	<label><input type="radio" name="KS_STATUS" value="2" class="search_radio" <c:if test="${STATUS == '2'}">checked="checked" </c:if> />검사완료</label>
										</p>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="javascript:fn_treat_search('1');" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //분류검색표-->
					</form>
					<!-- 검사정보 일람-->
					<div class="table_wrap">
						<!-- 검사정보 항목 표-->
						<p class="sub_title">검사정보 일람</p>	
						<table class="aniinfo_add" >
						<caption>검사정보 내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:12%;">
								<col style="width:12%;">
								<col style="width:11%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">진료번호</th>
									<th scope="col" id="th04">예약일자</th>
									<th scope="col" id="th05">검사종류</th>
									<th scope="col" id="th06">완료상태</th>
									<th scope="col" id="th07">동물명</th>
									<th scope="col" id="th08">동물번호</th>
									<th scope="col" id="th09">관리부서</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="jinryolist" items="${jinryolist}" varStatus="st">
								<tr>
									<th style="line-height: 1.5;">
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');">
											${jinryolist.SEQ}
										</a>
									</th>
									<td style="line-height: 1.5;">
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');">
											${jinryolist.KSTYPENAME}
										</a>
									</td>
									<td style="line-height: 1.5;">
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');">
											${jinryolist.JJJ_JRTYPE}:${jinryolist.JJDKY_JRNO}
										</a>
									</td>
									<td style="line-height: 1.5;">
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');">
											${jinryolist.JJDKY_KSDATEYY}
										</a>
									</td>
									<td style="line-height: 1.5;">
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');">
											${jinryolist.KSNONAME}
										</a>
									</td>
									<td style="line-height: 1.5;">
									<c:choose>
									<c:when test="${jinryolist.JJDKY_KSSTS != '2'}">
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');" class="cancel_btn" style="width: 80px;margin-left:0px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">
											결과입력
										</a>
									</c:when>
									<c:otherwise>
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');">
											${jinryolist.JJDKY_KSDATE}
										</a>
									</c:otherwise>
									</c:choose>
									</td>
									<td style="line-height: 1.5;">
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');">
											${jinryolist.MAC_NAME}
											<c:if test="${not empty jinryolist.MAI_BNAME and jinryolist.MAI_BNAME != ''}">
												(${jinryolist.MAI_BNAME})
											</c:if>
										</a>
									</td>
									<td style="line-height: 1.5;">
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');">
											${jinryolist.BAA_ANICODE}
										</a>
									</td>
									<td style="line-height: 1.5;">
										<a href="javascript:fn_jinryoJnlAdd('${jinryolist.JJDKY_JRNO}', '${jinryolist.JJDKY_KSNO}', '${jinryolist.JJDKY_DOCNO}', '${jinryolist.JJDKY_KSTYPE}', '${jinryolist.JJJ_RCNO}', '${jinryolist.JJDKY_KSDATEYY}');">
											${jinryolist.DPTNAME}
										</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>				
					<!-- //그룹항목표-->
					</div>
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