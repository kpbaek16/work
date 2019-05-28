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

<title>병리방역 &gt; 검사관리</title>
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
                        <li>> 병리방역</li>
                        <li>> 검사관리</li>
                        <li>> 진균검사</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
				<!-- contents-->
				<div class="contents_table">
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">공통정보</p>
						</div>
						<table class="aniinfo_search table_view2" >
							<caption>공통정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">진료번호</th><td>${K03.JJJ_DOCNO }</td>
								</tr>
								<tr>
									<th scope="row">진단명</th><td>${K03.JJJ_JRDZZNAME }</td>
								</tr>
								<tr>
									<th scope="row">임상증상</th><td><input type="text" disabled="disabled" value="${K03.JJJ_JRCMNT }" size="100"></td>
								</tr>
						   </tbody>
						</table>
						&nbsp;&nbsp;&nbsp;
						<div>
						<table class="aniinfo_search table_view2" >
							<caption>동물정보</caption>
							 <colgroup>
								<col style="width:22%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:13%;">
								<col style="width:22%;">
								<col style="width:10%;">
								<col style="width:10%;">
							</colgroup>
                            <thead>
								<tr>
									<th scope="row">동물명</th>
									<th scope="row">영명</th>
									<th scope="row">동물번호</th>
									<th scope="row">성별</th>
									<th scope="row">동물사</th>
									<th scope="row">생년월일(나이)</th>
									<th scope="row">반입일자</th>
									<th scope="row">반입처</th>
								<tr>
								</thead>
								<tbody>
								<tr>
								<c:if test="${K03.MAI_BNAME != null}">
									<td align="center">${K03.MAC_NAME } (${K03.MAI_BNAME })</td>
									</c:if>
									<c:if test="${K03.MAI_BNAME == null}">
									<td align="center">${K03.MAC_NAME }</td>
									</c:if>
									<td align="center">${K03.MAC_ENAME }</td>
									<td align="center">${K03.MAI_ANICODE }</td>
									<td align="center">${K03.MAI_GENDER }</td>
									<td align="center">${K03.VVRMNAME }</td>
									<c:if test="${K03.AGE == null || K03.AGE2 == null}">
									<td align="center">${K03.MAI_BIRTHDAY }</td>
									</c:if>
									<c:if test="${K03.AGE != null || K03.AGE2 != null}">
									<td align="center">${K03.MAI_BIRTHDAY } (${K03.AGE }년 ${K03.AGE2 }개월)</td>
									</c:if>	
									<td align="center">${K03.MAI_BIRTHDAY }</td>
									<td align="center">${K03.DAIO_PLACE }</td>
								</tr>
								</tbody>
						</table>
						</div>
					</div>
					<!-- //문서정보-->
					
					<!-- 기본검사내용-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">기본검사내용</p>
						</div>
						<table class="aniinfo_search table_view2" >
							<caption>기본검사내용</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">검사일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" value="${K03.JJDKY_KSDATEYY }">
									<th scope="row">검사구분</th><td>${K03.JJDKY_KSTYPE }</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- // 기본검사내용-->
					
					<!-- 상세검사내용-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">상세검사내용</p>
						</div>
						<div>
						<table class="aniinfo_search table_view2" >
							<caption>상세검사내용</caption>
							 <colgroup>
								<col style="width:5%;">
								<col style="width:30%;">
								<col style="width:15%;">
								<col style="width:10%;">
							</colgroup> 
                            <thead>
								<tr>
									<th scope="row">No</th>
									<th scope="row">검사방법</th>
									<th scope="row">검사부위</th>
									<th scope="row">검사결과</th>
									<th scope="row">삭제</th>
								<tr>
								</thead>
								<tbody>
								<tr>
									<td align="center">${K03.RNUM }</td>
									<td><input type="text" value="${K03.JJDKJK_WAY }" size="38"></td>
									<td><input type="text" value="${K03.JJDKJK_PART }" size="28"></td>
									<td><input type="text" value="${K03.JJDKJK_RSLT }" size="28"></td>
									<td align="center">삭제</td>
								</tr>
								</tbody>
						</table>
						</div>
					</div>
					<!-- // 상세검사내용-->
					
					<div class="btn_area">
						<a href="#" class="popcancel_btn btn_type2">삭제</a>
						<a href="#" class="popent_btn btn_type2" id="btnSave">저장</a> 
						<a href="#" class="popcancel_btn btn_type2">돌아가기</a>
					</div>
					
				<!-- //contents-->
				</div>
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