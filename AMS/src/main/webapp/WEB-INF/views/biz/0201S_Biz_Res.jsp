<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script> <!-- Lnb 스크립트-->
<link rel="stylesheet" href="../css/ui/reset.css">
<link rel="stylesheet" href="../css/ui/sub_layout.css">
<link rel="stylesheet" href="../css/base/contents.css">
<script type="text/javascript" src="../js/ui/lnb_slide.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  <!-- 달력 스크립트-->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="../js/contents/base.js"></script>
<script type="text/javascript" src="../js/contents/cal.js"></script>

<title>업무정보 &gt; 업무예약</title>
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
                    <p class="contents_title">업무예약</p>
                    <ol class="location">
                        <li><img src="../images/home_icon.gif" alt="home"></li>
                        <li>> 업무정보</li>
                        <li>> 업무예약</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<!-- 달력 -->
				<div class="aniinfo_add_box" style="margin-top:0;">
					<p class="sub_title">업무예약 현황</p>
					<div class="cal_title_area">
						<span><img src="../images/arrow_L.png" alt="지난달가기"></span>
						<span id="cal_title">2016년 11월</span>
						<span id="arrow_r"><img src="../images/arrow_R.png" alt="지난달가기"></span>
					</div>						
					 <table class="calendar_view">
						<caption>업무예약 달력</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:14%;">
							<col style="width:14%;">
							<col style="width:14%;">
							<col style="width:14%;">
							<col style="width:14%;">
							<col style="width:15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col" class="red_text">일</th>
								<th scope="col">월</th>
								<th scope="col">화</th>									
								<th scope="col">수</th>
								<th scope="col">목</th>
								<th scope="col">금</th>
								<th scope="col" class="red_text">토</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span class="red_text"></span></td>
								<td></td>
								<td>1
									<ul class="schedule_list">
										<li>개시진료일지</li>
									</ul>
								</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td><span class="red_text">5</span></td>
							</tr>
							<tr>
								<td><span class="red_text">6</span>
									<ul class="schedule_list">
										<li>폐사(부검요청)</li>
									</ul>
								</td>
								<td>7</td>
								<td>8
									<ul class="schedule_list">
										<li>종료진료일지</li>
									</ul>
								</td>
								<td>9</td>
								<td>10</td>
								<td>11
									<ul class="schedule_list">
										<li>개시종료일지</li>
										<li>종료진료일지</li>
										<li>폐사(부검요청)</li>
									</ul>
								</td>
								<td><span class="red_text">12</span></td>
							</tr>
							<tr>
								<td><span class="red_text">13</span></td>
								<td>14</td>
								<td>15
									<ul class="schedule_list">
										<li>개시종료일지</li>
										<li>종료진료일지</li>
										<li>폐사(부검요청)</li>
									</ul>
								</td>
								<td>16
									<ul class="schedule_list">
										<li>개시종료일지</li>
										<li>종료진료일지</li>
										<li>폐사(부검요청)</li>
									</ul>
								</td>
								<td>17</td>
								<td>18</td>
								<td><span class="red_text">19</span></td>
							</tr>
							<tr>
								<td><span class="red_text">20</span></td>
								<td>21</td>
								<td>22</td>
								<td>23
									<ul class="schedule_list">
										<li>개시종료일지</li>
										<li>폐사(부검요청)</li>
									</ul>
								</td>
								<td>24
									<ul class="schedule_list">
										<li>개시종료일지</li>
										<li>종료진료일지</li>
										<li>폐사(부검요청)</li>
									</ul>
								</td>
								<td>25</td>
								<td><span class="red_text">26</span></td>
							</tr>
							<tr>
								<td><span class="red_text">27</span>
									<ul class="schedule_list">
										<li>개시진료일지</li>
									</ul>
								</td>
								<td>28</td>
								<td>29</td>
								<td>30
									<ul class="schedule_list">
										<li>종료진료일지</li>
									</ul>
								</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

						</tbody>	  

					 </table>

				</div>
				<!-- //달력 -->

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
