<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<title>이력관리 &gt; 동물이력</title>
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
                    <p class="contents_title">동물이력</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 이력관리</li>
                        <li>> 동물이력</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 동물이력 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>동물이력 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">변경일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1"><label for="cal_1"></label> ~  <input type="text" class="calendar2" id="cal_2"><label for="cal_2"></label></p></td>						
								</tr>
								<tr>
									<th scope="row">동물명</th>
									<td><input name="textfield" type="text" id="seach_text1" class="textfield"><label for="seach_text1"></label></td>
								</tr>
								<tr>
									<th scope="row">동물번호</th>
									<td><input name="textfield" type="text" id="seach_text2" class="textfield"><label for="seach_text2"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //동물이력 조회 -->
					<!-- 동물이력 표 -->
					<div class="aniinfo_add_box">
						<div class="sys_btn_box" style="margin-bottom:5px;">
						<span><a href="#" class="transform_btn">변환</a><a href="#" class="print_btn btn_type2">프린트</a><a href="#" class="del_btn">삭제</a></span>	
						</div>
						<table class="aniinfo_add" >
						<caption>동물이력 내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<col style="width:12%;">
								<col style="width:20%;">
								<col style="width:20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">동물명</th>
									<th scope="col" id="th03">동물번호</th>
									<th scope="col" id="th04">변경일</th>
									<th scope="col" id="th05">변경자</th>
									<th scope="col" id="th06">구분</th>
									<th scope="col" id="th07">변경전</th>
									<th scope="col" id="th08">변경후</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">엘사</td>
									<td headers="n01 th03">C1-1-1-1</td>
									<td headers="n01 th04">2016-08-30</td>
									<td headers="n01 th05">김길동</td>
									<td headers="n01 th06">동물명변경</td>
									<td headers="n01 th07">앨사</td>
									<td headers="n01 th08">엘사</td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">엘사</td>
									<td headers="n02 th03">C1-1-1-1</td>
									<td headers="n02 th04">2016-08-30</td>
									<td headers="n02 th05">김길동</td>
									<td headers="n02 th06">동물명변경</td>
									<td headers="n02 th07">가금사</td>
									<td headers="n02 th08">아프리카관</td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">3</th>
									<td headers="n03 th02">엘사</td>
									<td headers="n03 th03">C1-1-1-1</td>
									<td headers="n03 th04">2016-08-30</td>
									<td headers="n03 th05">김길동</td>
									<td headers="n03 th06">목변경</td>
									<td headers="n03 th07">황새목</td>
									<td headers="n03 th08">사다새목</td>
								</tr>
								<tr>
									<th scope="row" id="n04" headers="th01">4</th>
									<td headers="n04 th02"></td>
									<td headers="n04 th03"></td>
									<td headers="n04 th04"></td>
									<td headers="n04 th05"></td>
									<td headers="n04 th06"></td>
									<td headers="n04 th07"></td>
									<td headers="n04 th08"></td>
								</tr>
								<tr>
									<th scope="row" id="n05" headers="th01">5</th>
									<td headers="n05 th02"></td>
									<td headers="n05 th03"></td>
									<td headers="n05 th04"></td>
									<td headers="n05 th05"></td>
									<td headers="n05 th06"></td>
									<td headers="n05 th07"></td>
									<td headers="n05 th08"></td>
								</tr>
								<tr>
									<th scope="row" id="n06" headers="th01">6</th>
									<td headers="n06 th02"></td>
									<td headers="n06 th03"></td>
									<td headers="n06 th04"></td>
									<td headers="n06 th05"></td>
									<td headers="n06 th06"></td>
									<td headers="n06 th07"></td>
									<td headers="n06 th08"></td>
								</tr>
								<tr>
									<th scope="row" id="n07" headers="th01">7</th>
									<td headers="n07 th02"></td>
									<td headers="n07 th03"></td>
									<td headers="n07 th04"></td>
									<td headers="n07 th05"></td>
									<td headers="n07 th06"></td>
									<td headers="n07 th07"></td>
									<td headers="n07 th08"></td>
								</tr>
								<tr>
									<th scope="row" id="n08" headers="th01">8</th>
									<td headers="n08 th02"></td>
									<td headers="n08 th03"></td>
									<td headers="n08 th04"></td>
									<td headers="n08 th05"></td>
									<td headers="n08 th06"></td>
									<td headers="n08 th07"></td>
									<td headers="n08 th08"></td>
								</tr>
								<tr>
									<th scope="row" id="n09" headers="th01">9</th>
									<td headers="n09 th02"></td>
									<td headers="n09 th03"></td>
									<td headers="n09 th04"></td>
									<td headers="n09 th05"></td>
									<td headers="n09 th06"></td>
									<td headers="n09 th07"></td>
									<td headers="n09 th08"></td>
								</tr>
								<tr>
									<th scope="row" id="n10" headers="th01">10</th>
									<td headers="n10 th02"></td>
									<td headers="n10 th03"></td>
									<td headers="n10 th04"></td>
									<td headers="n10 th05"></td>
									<td headers="n10 th06"></td>
									<td headers="n10 th07"></td>
									<td headers="n10 th08"></td>
								</tr>
								
								
							</tbody>
						
						</table>
					</div>
					<!-- //동물이력 표 -->
					<!-- pagination -->
					<div class="pagination">
						<a href="#" class="page first"></a>
						<a href="#" class="page prev"></a>
						<a href="#" class="on">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">5</a>
						<!--
						<a href="#">6</a>
						<a href="#">7</a>
						<a href="#">8</a>
						<a href="#">9</a>
						<a href="#">10</a>
						-->
						<a href="#" class="page next"></a>
						<a href="#" class="page last"></a>
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