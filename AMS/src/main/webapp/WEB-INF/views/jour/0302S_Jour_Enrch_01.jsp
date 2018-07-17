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


<title>동물사육 &gt; 행동풍부화/긍정적 강화훈련</title>
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
                    <p class="contents_title">행동풍부화/긍정적 강화훈련</p>
                    <ol class="location">
                        <li><img src="../images/home_icon.gif" alt="home"></li>
                        <li>> 동물사육</li>
                        <li>> 행동풍부화/긍정적 강화훈련</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 행동강화조회-->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>행동풍부화/긍정적 강화훈련 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">작성일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1"><label for="cal_1"></label> ~  <input type="text" class="calendar2" id="cal_2"><label for="cal_2"></label></p></td>						
								</tr>
								<tr>
									<th scope="row">작성자</th>
									<td><input name="textfield" type="text" id="seach_text1" class="textfield"><label for="seach_text1"></label></td>
								</tr>
								<tr>
									<th scope="row">풍부화 제목</th>
									<td><input name="textfield" type="text" id="seach_text2" class="textfield"><label for="seach_text2"></label></td>
								</tr>
								<tr>
									<th scope="row">대상동물</th>
									<td><input name="textfield" type="text" id="seach_text3" class="textfield"><label for="seach_text3"></label></td>
								</tr>
								<tr>
									<th scope="row">구분</th>
									<td>
										<p>
										  <label><input type="radio" name="align" value="전체" class="search_radio type1"/>전체</label>
										  <label><input type="radio" name="align" value="행동풍부화" class="search_radio"/>행동풍부화</label>
										  <label><input type="radio" name="align" value="긍정적강화훈련" class="search_radio"/>긍정적강화훈련</label>
										</p>
									</td>
								</tr>
								<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //행동강화조회-->
					<!-- 행동강화표-->
					<div class="aniinfo_add_box">
						<p><a href="#" class="info_add_btn">추가</a></p>						
						<table class="aniinfo_add" >
						<caption>동물정보내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:11%;">
								<col style="width:12%;">
								<col style="width:10%;">
								<col style="width:9%;">
								<col style="width:8%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">제목</th>
									<th scope="col" id="th04">기간</th>
									<th scope="col" id="th05">종류</th>
									<th scope="col" id="th06">동물명(종)</th>
									<th scope="col" id="th07">동물사</th>
									<th scope="col" id="th08">전시무리형태</th>
									<th scope="col" id="th09">결재</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">행동풍부화</td>
									<td headers="n01 th03">황새, 두루미 풍부화</td>
									<td headers="n01 th04">2016.06.01 ~ 2016.06.30</td>
									<td headers="n01 th05">사회성, 인지</td>
									<td headers="n01 th06">황새</td>
									<td headers="n01 th07">가금사</td>
									<td headers="n01 th08">동종간</td>
									<td headers="n01 th09">결재진행</td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">긍정적강화훈련</td>
									<td headers="n02 th03">황새, 두루미 강화</td>
									<td headers="n02 th04">2016.06.01 ~ 2016.06.30</td>
									<td headers="n02 th05">먹이</td>
									<td headers="n02 th06">황새, 두루미</td>
									<td headers="n02 th07">가금사</td>
									<td headers="n02 th08">이종간</td>
									<td headers="n02 th09">결재완료</td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">3</th>
									<td headers="n03 th02"></td>
									<td headers="n03 th03"></td>
									<td headers="n03 th04"></td>
									<td headers="n03 th05"></td>
									<td headers="n03 th06"></td>
									<td headers="n03 th07"></td>
									<td headers="n03 th08"></td>
									<td headers="n03 th09"></td>
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
									<td headers="n04 th09"></td>
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
									<td headers="n05 th09"></td>
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
									<td headers="n06 th09"></td>
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
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //행동강화표-->
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
