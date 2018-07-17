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


<title>기본정보 &gt; 임시동물자력카드</title>
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
                    <p class="contents_title">임시동물자력카드</p>
                    <ol class="location">
                        <li><img src="../images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 임시동물자력카드</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 임시동물 자력카드 -->
					<div>
					<span><a href="#layer02" class="del_btn layer_open" style="width:200px;">임시동물 자력카드 팝업</a></span>
					</div>
				</div>


				<!-- //contents-->
			</section>

			<!-- //right-->
		</div>
	<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer02 -->
		<div class="layer_box" id="layer02" style="width:1020px; top:80px;">
			<div class="layer_tit">임시동물자력카드</div>
				<div class="layer_con">
					<div class="sys_btn_box" style="margin-bottom:5px;">
						<span><a href="#" class="excel_btn">엑셀</a><a href="#" class="print_btn btn_type2">프린트</a></span>	
					</div>
					<table class="aniinfo_search">
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:16%;">
								<col style="width:17%;">
								<col style="width:17%;">
								<col style="width:16%;">
								<col style="width:17%;">
								<col style="width:17%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">동물명</th>
									<td colspan="5">호랑이</td>
								</tr>
								<tr>
									<th scope="row">개체인식번호</th>
									<td colspan="2">T1-1-1-1</td>
									<th scope="row">인식기 종류</th>
									<td colspan="2"  style="vertical-align:middle;">
										<input type="checkbox" id="sel1_chk1" checked><label for="sel1_chk1">Chip</label>
										<input type="checkbox" id="sel1_chk2"><label for="sel1_chk2">Ring</label>
										<input type="checkbox" id="sel1_chk3"><label for="sel1_chk3">Ear</label>
									</td>
								</tr>
								<tr>
									<th scope="row">분류</th>
									<td colspan="2">포유류-식육목-고양이과</td>
									<th scope="row">인식기 종류</th>
									<td colspan="2"  style="vertical-align:middle;">
										<input type="checkbox" id="sel2_chk1"><label for="sel2_chk1">CITES Ⅰ</label>
										<input type="checkbox" id="sel2_chk2" checked><label for="sel2_chk2">CITES Ⅱ</label>
										<input type="checkbox" id="sel2_chk3"><label for="sel2_chk3">CITES Ⅲ</label>
									</td>
								</tr>
								<tr>
									<th scope="row">천연기념물</th>
									<td colspan="2">해당 없음</td>
									<th scope="row">등급</th>
									<td colspan="2"  style="vertical-align:middle;">
										<input type="checkbox" id="sel3_chk1"><label for="sel3_chk1">갑</label>
										<input type="checkbox" id="sel3_chk2"><label for="sel3_chk2">을</label>
										<input type="checkbox" id="sel3_chk3" checked><label for="sel3_chk3">병</label>
									</td>
								</tr>
								<tr>
									<th colspan="6" scope="col">반입정보</th>
								</tr>
								<tr>
									<th scope="row">반입일</th>
									<td colspan="2">2016-10-01</td>
									<th scope="row">반입처</th>
									<td colspan="2">소방서</td>									
								</tr>
								<tr>
									<th scope="row">반입사유</th>
									<td colspan="2">구조</td>
									<th scope="row">야생조수인수증</th>
									<td colspan="2">동물인수증_010101</td>									
								</tr>
								<tr>
									<th colspan="6" scope="col">반출정보</th>
								</tr>
								<tr>
									<th scope="row">반출일</th>
									<td colspan="2">2016-10-01</td>
									<th scope="row">반출사유</th>
									<td colspan="2">폐사</td>
								</tr>
								<tr>
									<th colspan="6" scope="col">폐사정보</th>
								</tr>
								<tr>
									<th scope="row">폐사일</th>
									<td colspan="2">2016-10-01</td>
									<th scope="row">폐체사유</th>
									<td colspan="2">질병</td>
								</tr>
								<tr>
									<th scope="row">특이사항</th>
									<td colspan="5">고령으로 인한 폐사</td>	
								</tr>
								<tr>
									<th scope="row" style="vertical-align: middle;">이미지</th>
									<td class="img_td"><img src="../images/ex_img.gif" alt="사진"></td>
									<td class="img_td"><img src="../images/ex_img.gif" alt="사진"></td>
									<td class="img_td"></td>
									<td class="img_td"></td>
									<td class="img_td"></td>
								</tr>
								
						   </tbody>
						</table>

						<table class="aniinfo_add" style="margin-top:20px; margin-bottom:30px;" > 
								<caption>진료기록</caption>
								<colgroup>
									<col style="width:10%"/>
									<col style="width:30%"/>
									<col style="width:30%"/>
									<col style="width:30%"/>
								</colgroup>
								<thead>
									<tr>
										<th colspan="4" scope="col">진료기록</th>
									</tr>
									<tr>
										<th scope="col" id="th01">No</th>
										<th scope="col" id="th02">문서번호</th>
										<th scope="col" id="th03">일자</th>
										<th scope="col" id="th04">사유</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">TJ-2016-10-01</td>
									<td headers="n01 th03">2016-01-01</td>
									<td headers="n01 th04">수술</td>
									</tr>
									<tr>
									<th scope="row" id="n02" headers="th01"></th>
									<td headers="n02 th02"></td>
									<td headers="n02 th03"></td>
									<td headers="n02 th04"></td>
									</tr>
							   </tbody>
							</table>
					
					
			</div>
			<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
	<!-- //#layer02 -->	
		
	
	</div>
	<!-- // layer_popup -->



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
