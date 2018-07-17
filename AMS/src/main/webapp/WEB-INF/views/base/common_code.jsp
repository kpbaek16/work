<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<title>기준정보관리 &gt; 동물그룹정보</title>
</head>
<body>
	<div class="sub_wrap">
		<!--바로가기-->
		<ul class="skip">
			<li><a href="#">메뉴바로가기</a></li>
			<li><a href="#">본문바로가기</a></li>
			<li><a href="#">하단바로가기</a></li>
		</ul>
		<!--상단영역시작-->
		<div class="header_wrap">
			<header class="sub_header">
				<h1 id="logo_sub">
					<a href="#"><img src="${pageContext.request.contextPath}/images/logo_sub.gif" alt="서울대공원동물관리시스템"></a>
				</h1>
			</header>
		</div>
		<!--컨텐츠영역시작-->
		<div class="section_box">
			<!--left-->
			<div class="left_box">
				<section class="mypage_box">
					<h2>나의정보</h2>
					<ul class="mypage">
						<li class="my_img"><img src="${pageContext.request.contextPath}/images/my_icon.gif" alt="프로필이미지"></li>
						<li>홍길동 님</li>
						<li>최종접속일자 : 2016. 08. 31.</li>
						<li class="logout_btn"><a href="#"><img src="${pageContext.request.contextPath}/images/logout_icon.png" alt=""> 로그아웃</a></li>
					</ul>
				</section>
				<!--lnb시작-->
				<section class="lnb_box">
					<h2>메인메뉴</h2>

					<nav class="lnb_Menu">
						<ul class="lnbMenu_list">
							<li><a href="#">기준정보관리</a>
								<ul class="lnbSub_list">
									<li><a href="#">시스템관리</a></li>
									<li><a href="#">공통정보</a></li>
									<li><a href="#">부서정보</a></li>
									<li><a href="#">직원정보</a></li>
									<li><a href="#">동물사정보</a></li>
									<li><a href="#">동물그룹정보</a></li>
									<li><a href="#">동물정보</a></li>
									<li><a href="#">혈액검사정보</a></li>
									<li><a href="#">백신정보</a></li>
									<li><a href="#">약품정보</a></li>
								</ul></li>
							<li><a href="#">업무예약</a>
								<ul class="lnbSub_list">
									<li><a href="#">업무예약조회</a></li>
								</ul></li>
							<li><a href="#">동물사육업무</a>
								<ul class="lnbSub_list">
									<li><a href="#">사육일지</a></li>
									<li><a href="#">행동풍부화</a></li>
									<li><a href="#">번식보고서</a></li>
									<li><a href="#">폐사보고서</a></li>
								</ul></li>
							<li><a href="#">동물진료업무</a>
								<ul class="lnbSub_list">
									<li><a href="#">보건일지</a></li>
									<li><a href="#">진료요청/접수</a></li>
									<li><a href="#">진료일지</a></li>
									<li><a href="#">처방전내역</a></li>
									<li><a href="#">검사관리</a></li>
									<li><a href="#">백신접종관리</a></li>
								</ul></li>
							<li><a href="#">병리방역업무</a>
								<ul class="lnbSub_list">
									<li><a href="#">부검결과서</a></li>
								</ul></li>
							<li><a href="#">현황조회</a>
								<ul class="lnbSub_list">
									<li><a href="#">종별현황</a></li>
									<li><a href="#">분류군별현황</a></li>
									<li><a href="#">동물사별현황</a></li>
									<li><a href="#">동물증가내역</a></li>
									<li><a href="#">동물감소내역</a></li>
									<li><a href="#">보육현황</a></li>
									<li><a href="#">임대현황</a></li>
									<li><a href="#">번식현황</a></li>
									<li><a href="#">폐사현황</a></li>
									<li><a href="#">반출입내역</a></li>
									<li><a href="#">동물일보</a></li>
								</ul></li>
							<li><a href="#">예비</a>
								<ul class="lnbSub_list">
									<li><a href="#">예비1</a></li>
									<li><a href="#" id="last_subMenu">예비2</a></li>
								</ul></li>
						</ul>




					</nav>
				</section>
				<!--lnb끝-->
			</div>
			<!--right-->
			<section class="right_box">
				<h2>본문내용</h2>
				<div class="contents">
					<p class="contents_title">동물그룹정보관리</p>
					<ol class="location">
						<li><img src="${pageContext.request.contextPath}/images/home_icon.gif" alt="home"></li>
						<li>> 기준정보관리</li>
						<li>> 동물그룹정보관리</li>
					</ol>

					<!-- 분류검색표 -->


					<div class="search_box">
						<table class="search_table">
							<caption>동물그룹정보조회</caption>
							<tbody>
								<tr>
									<th scope="row">검색 분류 구분</th>
									<td>
										<p>
											<label>
												<input type="radio" name="list" value="A" class="search_radio" />대분류
											</label> 
											<label>
												<input type="radio" name="list" value="B" class="search_radio" />중분류
											</label> 
											<label>
												<input type="radio" name="list" value="C" class="search_radio" />
											</label> 
										</p>
									</td>
								</tr>
								<tr>
									<th scope="row">검색 분류 구분 명칭</th>
									<td><input name="textfield" type="text" id="seach_text" class="textfield" style="width: 80%" /></td>
								</tr>
								<tr>
									<td colspan="2" scope="row" style="border-top: 1px solid #d0d0d0; background: #f5f5f5;"><button class="search_btn" type="button">조회</button></td>
								</tr>
							</tbody>
						</table>

					</div>

					<!-- 분류검색표 끝 -->
					<!-- 그룹항목 표 -->

					<div class="table_wrap">
						<p class="sub_title">동물 그룹정보 일람</p>

						<table class="ani_list">
							<caption>강그룹</caption>
							<colgroup>
								<col style="width: 50%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">대분류
										<button class="add_btn" type="button">추가</button>
										<button class="all_btn" type="button">전체</button>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="#">기본정보</a></td>
								</tr>
								<tr>
									<td><a href="#">동물정보</a></td>
								</tr>
								<tr>
									<td><a href="#">진료정보</a></td>
								</tr>
								<tr>
									<td><a href="#">검사정보</a></td>
								</tr>
								<tr>
									<td><a href="#">약품정보</a></td>
								</tr>
								<tr>
									<td><a href="#">프로그램정보</a></td>
								</tr>
							</tbody>
						</table>

						<table class="ani_list">
							<caption>목그룹</caption>
							<colgroup>
								<col style="width: 50%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">중분류
										<button class="add_btn" type="button">추가</button>
										<button class="all_btn" type="button">전체</button>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="#">직위직책</a></td>
								</tr>
							</tbody>
						</table>
						<table class="ani_list">
							<caption>과그룹</caption>
							<colgroup>
								<col style="width: 50%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">소분류
										<button class="add_btn" type="button">추가</button>
										<button class="all_btn" type="button">전체</button>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><a href="#">1 - 암비스토마과</a></td>
								</tr>
								<tr>
									<td><a href="#">2 - 장수도롱뇽과</a></td>
								</tr>
								<tr>
									<td><a href="#">3 - 도롱뇽과</a></td>
								</tr>
							</tbody>
						</table>
						<!-- 그룹항목 표 끝 -->
						<!-- 상세정보 표 -->
						<table class="ani_info">
							<caption>동물그룹상세정보</caption>
							<colgroup>
								<col style="width: 50%" />
								<col style="width: 50%" />
							</colgroup>
							<thead>
								<tr>
									<th colspan="2" scope="col">상세정보<span class="basic_mode"><button class="cha_btn" type="button">수정</button>
											<button class="del_btn" type="button">삭제</button></span>
							</thead>
							<tbody>
								<tr>
									<th scope="row">강정보</th>
									<td>조강 (B)</td>
								</tr>
								<tr>
									<th scope="row">목정보</th>
									<td>타조목 (1)</td>
								</tr>
								<tr>
									<th scope="row">과정보</th>
									<td>타조과 (1)</td>
								</tr>
								<tr>
									<th scope="row">종번호</th>
									<td>1</td>
								</tr>
								<tr>
									<th scope="row">종명칭</th>
									<td>타조</td>
								</tr>
								<tr>
									<th scope="row">영명</th>
									<td>South African Ostrich</td>
								</tr>
								<tr>
									<th scope="row">학명</th>
									<td>Struthio camelus</td>
								</tr>
								<tr>
									<th scope="row">CITES</th>
									<td>CITESⅡ</td>
								</tr>
								<tr>
									<th scope="row">멸종위기</th>
									<td>해당없음</td>
								</tr>
								<tr>
									<th scope="row">천연기년물</th>
									<td>0</td>
								</tr>
								<tr>
									<th scope="row">등급</th>
									<td>을</td>
								</tr>
								<tr>
									<th scope="row">평가내용</th>
									<td>유지종</td>
								</tr>
								<tr>
									<th scope="row">원산지</th>
									<td>토종</td>
								</tr>
								<tr>
									<th scope="row">임신기간</th>
									<td>개월</td>
								</tr>
								<tr>
									<th scope="row">군집구분</th>
									<td>군집</td>
								</tr>
								<tr>
									<th scope="row">개체수</th>
									<td>마리</td>
								</tr>
								<tr>
									<th scope="row">평균수명</th>
									<td>10 년</td>
								</tr>
							</tbody>
						</table>
				<!--본문내용끝-->
			</section>

		</div>

		<!--하단영역시작-->
		<div class="footer_wrap">
			<footer class="sub_footer">
				<h2>하단정보영역</h2>
				<span class="footer_logo"><img src="${pageContext.request.contextPath}/images/footer_logo.png" alt="서울대공원동물관리시스템"></span>
				<div class="footer_copyright">
					<p class="add_btnress">경기도 과천시 대공원광장로 102 (막계동 159-1) 서울대공원 | TEL 02-500-7338 | E-mail. hkseo@seoul.go.kr</p>
					<p class="copyright">Copyright 2011 SEOUL GRANDPARK. all_btn RIGHTS RESERVED</p>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>

