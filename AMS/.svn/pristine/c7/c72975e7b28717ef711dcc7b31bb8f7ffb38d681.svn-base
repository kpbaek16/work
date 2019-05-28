<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="/js/html5shiv.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

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
                        <li>> 동물진료</li>
                        <li>> 검사관리</li>
                        <li>> 혈액검사</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
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
								<tr>
									<th scope="row">진료번호</th><td>${K01.JJJ_DOCNO }</td>
								</tr>
								<tr>
									<th scope="row">진단명</th><td>${K01.JJJ_JRDZZNAME }</td>
								</tr>
								<tr>
									<th scope="row">임상증상</th><td>${K01.JJJ_JRCMNT }</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보-->
					
					<!-- 동물정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">동물정보</p>
						</div>
						<table class="aniinfo_search table_view3" >
							<caption>동물정보</caption>
							<colgroup>
								<col style="width:12%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:13%;">
							</colgroup>
							<thead>
								<tr align="center">
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
								<tr align="center">
									<c:if test="${K01.MAI_BNAME != null}">
									<td>${K01.MAC_NAME } (${K01.MAI_BNAME })</td>
									</c:if>
									<c:if test="${K01.MAI_BNAME == null}">
									<td>${K01.MAC_NAME }</td>
									</c:if>
									<td headers="n01 th02">${K01.MAC_ENAME }</td>
									<td headers="n01 th03">${K01.BAA_ANICODE }</td>
									<td headers="n01 th04">${K01.MAI_GENDER }</td>
									<td headers="n01 th05">${K01.VVRMNAME }</td>
									<c:if test="${K01.AGE == null || K01.AGE2 == null}">
									<td>${K01.MAI_BIRTHDAY }</td>
									</c:if>
									<c:if test="${K01.AGE != null || K01.AGE2 != null}">
									<td>${K01.MAI_BIRTHDAY } (${K01.AGE }년 ${K01.AGE2 }개월)</td>
									</c:if>	
									<td headers="n01 th08">${K01.DAIO_IODATE }</td>
									<td headers="n01 th08">${K01.DAIO_PLACE }</td>
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
									<td><p><input type="text" class="calendar1" id="cal_1" value="${K02.JJDKBL_KSDATEYY }">
									<th scope="row">검사구분</th><td>${K01.JJDKBL_KSTYPE }</td>
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
						    <c:forEach var="i" items="${K01_Result }" varStatus="status">
						    <tr align="center">
						    	<td>${i.RNUM }</td>
						    	<td>${i.MCC_S_NAME }</td>
						    	<td>${i.MCC_COM_S1 }</td>
						    	<td><input type="text"></td>
						    	<c:if test="${i.MBI_MEAN == null}">
						    	<td>0</td>
						    	</c:if>
						    	<c:if test="${i.MBI_MEAN != null}">
						    	<td>${i.MBI_MEAN }</td>
						    	</c:if>
						    	<c:if test="${i.MBI_STDDEVI == null}">
						    	<td>0</td>
						    	</c:if>
						    	<c:if test="${i.MBI_STDDEVI != null}">
						    	<td>${i.MBI_STDDEVI }</td>
						    	</c:if>
						    	<td><input type="text"></td>
						    </tr>
						   </c:forEach>	
						   </tbody>
						</table>
							<div class="btn_area">
							<a href="#none" class="popent_btn btn_type2">확인</a>
							<a href="#none" class="popcancel_btn btn_type2">취소</a>
							<a href="#none" class="popcancel_btn btn_type2">돌아가기</a>
							</div>
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
