<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script> <!-- Lnb 스크립트-->
<script src="../js/html5shiv.js"></script>
<link rel="stylesheet" href="../css/ui/reset.css">
<link rel="stylesheet" href="../css/ui/sub_layout.css">
<link rel="stylesheet" href="../css/base/contents.css">
<script type="text/javascript" src="../js/ui/lnb_slide.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  <!-- 달력 스크립트-->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="../js/contents/base.js"></script>
<script type="text/javascript" src="../js/contents/cal.js"></script>


<title>이력관리 &gt; 방사장이력</title>
</head>
<body>
<div id="sub_wrap">

	<!-- accessibility -->
	<ul class="accessibility">
		<li><a href="#lnb">메뉴바로가기</a></li>
		<li><a href="#contents_area">본문바로가기</a></li>
		<li><a href="#footer">하단바로가기</a></li>
	</ul>
	<!-- //accessibility-->
	<!-- header -->
    <div id="header_wrap">
		<header id="sub_header">
			<h1 id="logo_sub"><a href="#"><img src="../images/logo_sub.gif" alt="서울대공원동물관리시스템"></a></h1>
		</header>
	</div>
	<!-- //header -->
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<div id="lnb_area">
				<!-- mypage -->
				<section id="mypage" class="mypage_img">
				<h2>나의정보</h2>
					<!-- 나의정보 배경이미지처리-->
				</section>
				<!-- //mypage -->
				<!-- lnb -->
				<section id="lnb" class="lnb_img">
				<h2>좌측메뉴</h2>
						<!-- LNB 배경이미지처리-->
				</section>
				<!-- //lnb -->
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">방사장이력</p>
                    <ol class="location">
                        <li><img src="../images/home_icon.gif" alt="home"></li>
                        <li>> 이력관리</li>
                        <li>> 방사장이력</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 방사장이력 조회 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>방사장이력 조회</caption>
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
									<th scope="row">방사장명</th>
									<td><input name="textfield" type="text" id="seach_text1" class="textfield"><label for="seach_text1"></label></td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //방사장이력 조회 -->
					<!-- 방사장이력 표 -->
					<div class="aniinfo_add_box">
						<div class="sys_btn_box" style="margin-bottom:5px;">
						<span><a href="#" class="transform_btn">변환</a><a href="#" class="print_btn btn_type2">프린트</a><a href="#" class="del_btn">삭제</a></span>	
						</div>
						<table class="aniinfo_add" >
						<caption>방사장이력 내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:7%;">
								<col style="width:12%;">
								<col style="width:8%;">
								<col style="width:6%;">
								<col style="width:12%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">방사장명</th>
									<th scope="col" id="th03">부서</th>
									<th scope="col" id="th04">팀</th>
									<th scope="col" id="th05">동물사</th>
									<th scope="col" id="th06">변경일</th>
									<th scope="col" id="th07">변경자</th>
									<th scope="col" id="th08">구분</th>
									<th scope="col" id="th09">변경전</th>
									<th scope="col" id="th10">변경후</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">제1방사장</td>
									<td headers="n01 th03">동물복지1과</td>
									<td headers="n01 th04">복지1팀</td>
									<td headers="n01 th05">야행관</td>
									<td headers="n01 th06">2016-08-30</td>
									<td headers="n01 th07">김길동</td>
									<td headers="n01 th08">방사장명변경</td>
									<td headers="n01 th09">제1방사</td>
									<td headers="n01 th10">제1방사장</td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">제1방사장</td>
									<td headers="n02 th03">동물복지1과</td>
									<td headers="n02 th04">복지1팀</td>
									<td headers="n02 th05">야행관</td>
									<td headers="n02 th06">2016-08-30</td>
									<td headers="n02 th07">김길동</td>
									<td headers="n02 th08">동물사변경</td>
									<td headers="n02 th09">가금사</td>
									<td headers="n02 th10">야행관</td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">3</th>
									<td headers="n03 th02">제1방사</td>
									<td headers="n03 th03">동물복지1과</td>
									<td headers="n03 th04">복지1팀</td>
									<td headers="n03 th05">가금사</td>
									<td headers="n03 th06">2016-08-30</td>
									<td headers="n03 th07">김길동</td>
									<td headers="n03 th08">팀변경</td>
									<td headers="n03 th09">조류팀</td>
									<td headers="n03 th10">복지1팀</td>
								</tr>
								<tr>
									<th scope="row" id="n04" headers="th01">4</th>
									<td headers="n04 th02">제1방사</td>
									<td headers="n04 th03">동물복지2과</td>
									<td headers="n04 th04">조류팀</td>
									<td headers="n04 th05">가금사</td>
									<td headers="n04 th06">2016-08-30</td>
									<td headers="n04 th07">김길동</td>
									<td headers="n04 th08">부서변경</td>
									<td headers="n04 th09">동물복지1과</td>
									<td headers="n04 th10">동물복지2과</td>
								</tr>
								<tr>
									<th scope="row" id="n05" headers="th01">5</th>
									<td headers="n05 th02">제1방사</td>
									<td headers="n05 th03">동물복지2과</td>
									<td headers="n05 th04">조류팀</td>
									<td headers="n05 th05">가금사</td>
									<td headers="n05 th06">2016-08-30</td>
									<td headers="n05 th07">김길동</td>
									<td headers="n05 th08">종삭제</td>
									<td headers="n05 th09">황새</td>
									<td headers="n05 th10"></td>
								</tr>
								<tr>
									<th scope="row" id="n06" headers="th01">6</th>
									<td headers="n06 th02">제1방사</td>
									<td headers="n06 th03">동물복지2과</td>
									<td headers="n06 th04">조류팀</td>
									<td headers="n06 th05">가금사</td>
									<td headers="n06 th06">2016-08-30</td>
									<td headers="n06 th07">김길동</td>
									<td headers="n06 th08">종추가</td>
									<td headers="n06 th09"></td>
									<td headers="n06 th10">황새</td>
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
									<td headers="n07 th09"></td>
									<td headers="n07 th10"></td>
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
									<td headers="n08 th09"></td>
									<td headers="n08 th10"></td>
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
									<td headers="n09 th09"></td>
									<td headers="n09 th10"></td>
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
									<td headers="n10 th09"></td>
									<td headers="n10 th10"></td>
								</tr>
								
								
							</tbody>
						
						</table>
					</div>
					<!-- //방사장이력 표 -->
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
		<footer id="footer">
		<h2>하단정보영역</h2>
		<div class="footer_logo"><img src="../images/footer_logo.png" alt="서울대공원동물관리시스템"></div>
		<div class="footer_copyright">
			<address>경기도 과천시 대공원광장로 102 (막계동 159-1) 서울대공원 | TEL 02-500-7338 | E-mail. hkseo@seoul.go.kr</address>
			<p class="copyright">Copyright 2011 SEOUL GRANDPARK. all_btn RIGHTS RESERVED</p>
		</div>
		</footer>
	</div>
	<!-- //footer -->
</div>
</body>
</html>