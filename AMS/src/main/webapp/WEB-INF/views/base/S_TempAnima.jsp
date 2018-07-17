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




<title>기본정보 &gt; 임시동물조회정보</title>
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
                    <p class="contents_title">임시동물조회정보</p>
                    <ol class="location">
                        <li><img src="../images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 임시동물조회정보</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 임시동물조회정보 -->
					<div class="aniinfo_search_box">
                        <table class="aniinfo_search" >
							<caption>임시동물조회정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:40%;">
								<col style="width:10%;">
								<col style="width:40%;">
							</colgroup>
                            <tbody>
								<tr><th scope="row">개체인식번호</th>
									<td><input name="textfield" type="text" id="seach_text" class="textfield" style="width:90%"/><label for="seach_text"></label></td>
									<th scope="row">반입사유</th>
									<td>
										<div class="select_box">			
											<select name="반입사유" id="table_sel1">
											<option value="사유">사유</option>
											</select>
										</div>
									</td>
								</tr>
								<tr><th scope="row">동물명칭</th>
									<td><input name="textfield" type="text" id="seach_text2" class="textfield" style="width:90%" value="황새"/><label for="seach_text2"></label></td>
									<th scope="row">반출사유</th>
									<td>
										<div class="select_box">			
											<select name="반출사유" id="table_sel2">
											<option value="사유">사유</option>
											</select>
										</div>
									</td>
								</tr>
								<tr><th scope="row">반입일</th>
									<td><p><input type="text" class="calendar3" id="cal_1"><label for="cal_1"></label></p></td>
									<th scope="row">폐사구분</th>
									<td>
										<p>
										  <label><input type="radio" name="die" value="전체" class="search_radio type1" />전체</label>
										  <label><input type="radio" name="die" value="생존" class="search_radio"/>생존</label>
										  <label><input type="radio" name="die" value="폐사" class="search_radio"/>폐사</label>
										</p>
									</td>
								</tr>
								<tr><th scope="row">반출일</th>
									<td><p><input type="text" class="calendar3" id="cal_2"><label for="cal_2"></label></p></td>
									<th scope="row">종류</th>
									<td>
										<p>
										  <label><input type="radio" name="align" value="전체" class="search_radio type1" />전체</label>
										  <label><input type="radio" name="align" value="CITES" class="search_radio"/>CITES</label>
										  <label><input type="radio" name="align" value="등급" class="search_radio"/>등급</label>
										  <label><input type="radio" name="align" value="천연기념물" class="search_radio"/>천연기념물</label>
										</p>
									</td>
								</tr>
								<tr><th colspan="4" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
					</div>
					<!-- //임시동물조회정보 -->
					<!-- 임시동물조회정보 추가 -->
					<div class="aniinfo_add_box">
						<p><a href="#" class="info_add_btn">추가</a></p>						
						<table class="aniinfo_add" >
						<caption>동물정보내역</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:12%;">
								<col style="width:12%;">
								<col style="width:7%;">
								<col style="width:6%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:8%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="num">No</th>
									<th scope="col" id="ani_num">개체인식번호</th>
									<th scope="col" id="ani_name">동물명칭</th>
									<th scope="col" id="ani_cites">CITES</th>
									<th scope="col" id="ani_grade">등급</th>
									<th scope="col" id="ani_code">천연기념물</th>
									<th scope="col" id="in_r">반입사유</th>
									<th scope="col" id="out_r">반출사유</th>
									<th scope="col" id="ani_die">폐사구분</th>
									<th scope="col" id="in_day">반입일</th>
									<th scope="col" id="out_day">반출일</th>
									<th scope="col" id="ani_copy">복사</th>								
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="num">1</th>
									<td headers="n01 ani_num">B3-2-1-1</td>
									<td headers="n01 ani_name">황새(엘사1)</td>
									<td headers="n01 ani_cites">해당없음</td>
									<td headers="n01 ani_grade">갑</td>
									<td headers="n01 ani_code">해당없음</td>
									<td headers="n01 in_r">구조</td>
									<td headers="n01 out_r">방생</td>
									<td headers="n01 ani_die">생존</td>
									<td headers="n01 in_day">2016-07-10</td>
									<td headers="n01 out_day">2016-07-10</td>
									<td headers="n01 ani_copy"><a href="#" class="copy_btn">복사</a></td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="num">2</th>
									<td headers="n02 ani_num">B3-2-1-1</td>
									<td headers="n02 ani_name">황새(엘사1)</td>
									<td headers="n02 ani_cites">해당없음</td>
									<td headers="n02 ani_grade">을</td>
									<td headers="n02 ani_code">해당없음</td>
									<td headers="n02 in_r">번식</td>
									<td headers="n02 out_r">방생</td>
									<td headers="n02 ani_die">생존</td>
									<td headers="n02 in_day">2016-07-10</td>
									<td headers="n02 out_day">2016-07-10</td>
									<td headers="n02 ani_copy"><a href="#" class="copy_btn">복사</a></td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="num">3</th>
									<td headers="n03 ani_num">B3-2-1-1</td>
									<td headers="n03 ani_name">황새(엘사1)</td>
									<td headers="n03 ani_cites">해당없음</td>
									<td headers="n03 ani_grade">갑</td>
									<td headers="n03 ani_code">해당없음</td>
									<td headers="n03 in_r">구조</td>
									<td headers="n03 out_r">방생</td>
									<td headers="n03 ani_die">생존</td>
									<td headers="n03 in_day">2016-07-10</td>
									<td headers="n03 out_day">2016-07-10</td>
									<td headers="n03 ani_copy"><a href="#" class="copy_btn">복사</a></td>
								</tr>
								<tr>
									<th scope="row" id="n04" headers="num">4</th>
									<td headers="n04 ani_num">B3-2-1-1</td>
									<td headers="n04 ani_name">황새(엘사1)</td>
									<td headers="n04 ani_cites">해당없음</td>
									<td headers="n04 ani_grade">갑</td>
									<td headers="n04 ani_code">해당없음</td>
									<td headers="n04 in_r">구조</td>
									<td headers="n04 out_r">방생</td>
									<td headers="n04 ani_die">생존</td>
									<td headers="n04 in_day">2016-07-10</td>
									<td headers="n04 out_day">2016-07-10</td>
									<td headers="n04 ani_copy"><a href="#" class="copy_btn">복사</a></td>
								</tr>
								<tr>
									<th scope="row" id="n05" headers="num">5</th>
									<td headers="n05 ani_num">B3-2-1-1</td>
									<td headers="n05 ani_name">황새(엘사1)</td>
									<td headers="n05 ani_cites">해당없음</td>
									<td headers="n05 ani_grade">갑</td>
									<td headers="n05 ani_code">해당없음</td>
									<td headers="n05 in_r">구조</td>
									<td headers="n05 out_r">방생</td>
									<td headers="n05 ani_die">생존</td>
									<td headers="n05 in_day">2016-07-10</td>
									<td headers="n05 out_day">2016-07-10</td>
									<td headers="n05 ani_copy"><a href="#" class="copy_btn">복사</a></td>
								</tr>
								<tr>
									<th scope="row" id="n06" headers="num">6</th>
									<td headers="n06 ani_num">B3-2-1-1</td>
									<td headers="n06 ani_name">황새(엘사1)</td>
									<td headers="n06 ani_cites">해당없음</td>
									<td headers="n06 ani_grade">갑</td>
									<td headers="n06 ani_code">해당없음</td>
									<td headers="n06 in_r">구조</td>
									<td headers="n06 out_r">방생</td>
									<td headers="n06 ani_die">생존</td>
									<td headers="n06 in_day">2016-07-10</td>
									<td headers="n06 out_day">2016-07-10</td>
									<td headers="n06 ani_copy"><a href="#" class="copy_btn">복사</a></td>
								</tr>
								<tr>
									<th scope="row" id="n07" headers="num">7</th>
									<td headers="n07 ani_num">B3-2-1-1</td>
									<td headers="n07 ani_name">황새(엘사1)</td>
									<td headers="n07 ani_cites">해당없음</td>
									<td headers="n07 ani_grade">갑</td>
									<td headers="n07 ani_code">해당없음</td>
									<td headers="n07 in_r">구조</td>
									<td headers="n07 out_r">방생</td>
									<td headers="n07 ani_die">생존</td>
									<td headers="n07 in_day">2016-07-10</td>
									<td headers="n07 out_day">2016-07-10</td>
									<td headers="n07 ani_copy"><a href="#" class="copy_btn">복사</a></td>
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //임시동물조회정보 추가 -->
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
