<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
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

<title>동물진료 &gt; 보건일지</title>
</head>
<body>
<div id="sub_wrap">

	<jsp:include page="/header.do"></jsp:include>
	<!-- header -->
    <div id="header_wrap">
		<header id="sub_header">
			<h1 id="logo_sub"><a href="#"><img src="/images/logo_sub.gif" alt="서울대공원동물관리시스템"></a></h1>
		</header>
	</div>
	<!-- //header -->
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<jsp:include page="/lnb.do"></jsp:include>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">보건일지</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물진료</li>
                        <li>> 보건일지</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 결재-->
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="../images/btn_minus.gif" alt=""></a>결재</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" class="cha_btn layer_open">수정</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>결재</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">구분</th>
									<th scope="col" id="th03">순서</th>
									<th scope="col" id="th04">이름</th>
									<th scope="col" id="th05">부서</th>
									<th scope="col" id="th06">직책</th>
									<th scope="col" id="th07">결재</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">수신</td>
									<td headers="n01 th03">1</td>
									<td headers="n01 th04">홍길동</td>
									<td headers="n01 th05">동물복지1과</td>
									<td headers="n01 th06">과장</td>
									<td headers="n01 th07"></td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">수신</td>
									<td headers="n02 th03">2</td>
									<td headers="n02 th04">홍길동</td>
									<td headers="n02 th05">동물복지1과</td>
									<td headers="n02 th06">주임</td>
									<td headers="n02 th07"></td>
								</tr>
								<tr>
									<th scope="row" id="n03" headers="th01">3</th>
									<td headers="n03 th02">참조</td>
									<td headers="n03 th03">1</td>
									<td headers="n03 th04">홍길동</td>
									<td headers="n03 th05">동물복지1과</td>
									<td headers="n03 th06">사원</td>
									<td headers="n03 th07"></td>
								</tr>
							</tbody>
						</table>
					
					</div>
					


					<!-- //결재-->
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="../images/btn_minus.gif" alt=""></a>문서정보</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys2">수정</a></span>
								<span class="sys_btn_area2"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_search table_view2" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">문서번호</th><td colspan="3">PS20160719-00001</td>
								</tr>
								<tr>
									<th scope="row">작성자</th><td>홍길동</td><th scope="row">부서</th><td>동물복지과</td>
								</tr>
								<tr>
									<th scope="row">구분</th><td>보건일지</td><th scope="row">작성일</th><td>2016-06-01</td>
								</tr>
								<tr>
									<th scope="row">날씨</th><td>흐림</td><th scope="row"></th><td></td>
								</tr>
						   </tbody>
						</table>

						<table class="aniinfo_search table_remove2" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">문서번호</th>
									<td colspan="3"><input name="textfield" type="text" id="table2_text1" class="textfield" value="PS20160719-00001"/><label for="table2_text1"></label></td>
								</tr>
								<tr>
									<th scope="row">작성자</th><td><input name="textfield" type="text" id="table2_text2" class="textfield" value="홍길동"/><label for="table2_text2"></label></td>
									<th scope="row">부서</th><td><input name="textfield" type="text" id="table2_text3" class="textfield" value="동물복지과"/><label for="table2_text3"></label></td>
								</tr>
								<tr>
									<th scope="row">구분</th><td><input name="textfield" type="text" id="table2_text4" class="textfield" value="보건일지"/><label for="table2_text4"></label></td>
									<th scope="row">작성일</th><td><input name="textfield" type="text" id="table2_text5" class="textfield" value="2016-06-01"/><label for="table2_text5"></label></td>
								</tr>
								<tr>
									<th scope="row">날씨</th><td><input name="textfield" type="text" id="table2_text6" class="textfield" value="흐림"/><label for="table2_text6"></label></td>
									<th scope="row"></th><td><input name="textfield" type="text" id="table2_text7" class="textfield" value=""/><label for="table2_text7"></label></td>
								</tr>
								
						   </tbody>
						</table>

					</div>
					<!-- //문서정보-->
					<!-- 진료현황 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus3"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus3"><img src="../images/btn_minus.gif" alt=""></a>진료현황</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys3">수정</a></span>
								<span class="sys_btn_area3"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view3" >
							<caption>진료현황</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:21%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t3th01" rowspan="2" style="vertical-align:middle;">항목</th>
									<th scope="colgroup" id="t3th02" colspan="2">진료</th>
									<th scope="colgroup" id="t3th03" colspan="2">폐사</th>
									<th scope="colgroup" id="t3th04" colspan="2">임원</th>
									<th scope="col" id="t3th05" rowspan="2" style="vertical-align:middle;">임상병리검사</th>
								</tr>
								<tr>
									<th scope="col" id="t3_a">종수</th>
									<th scope="col" id="t3_b">동물수</th>
									<th scope="col" id="t3_c">종수</th>
									<th scope="col" id="t3_d">동물수</th>
									<th scope="col" id="t3_e">종수</th>
									<th scope="col" id="t3_f">동물수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t3n01" headers="t3th01">현황</th>
									<td headers="t3n01 t3th02 t3_a">1</td>
									<td headers="t3n01 t3th02 t3_b">2</td>
									<td headers="t3n01 t3th03 t3_c">3</td>
									<td headers="t3n01 t3th03 t3_d">4</td>
									<td headers="t3n01 t3th04 t3_e">5</td>
									<td headers="t3n01 t3th04 t3_f">6</td>
									<td headers="t3n01 t3th05">7 건</td>
								</tr>
							</tbody>
						
						</table>
						<table class="aniinfo_add table_remove3" >
							<caption>진료현황</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:10%;">
								<col style="width:13%;">
								<col style="width:21%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t3th01_1" rowspan="2" style="vertical-align:middle;">항목</th>
									<th scope="colgroup" id="t3th02_1" colspan="2">진료</th>
									<th scope="colgroup" id="t3th03_1" colspan="2">폐사</th>
									<th scope="colgroup" id="t3th04_1" colspan="2">임원</th>
									<th scope="col" id="t3th05_1" rowspan="2" style="vertical-align:middle;">임상병리검사</th>
								</tr>
								<tr>
									<th scope="col" id="t3_a_1">종수</th>
									<th scope="col" id="t3_b_1">동물수</th>
									<th scope="col" id="t3_c_1">종수</th>
									<th scope="col" id="t3_d_1">동물수</th>
									<th scope="col" id="t3_e_1">종수</th>
									<th scope="col" id="t3_f_1">동물수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t3n01_1" headers="t3th01_1">현황</th>
									<td headers="t3n01_1 t3th02_1 t3_a_1"><input name="textfield" type="text" id="table3_text1" class="textfield2" value="1"/><label for="table3_text1"></label></td>
									<td headers="t3n01_1 t3th02_1 t3_b_1"><input name="textfield" type="text" id="table3_text2" class="textfield2" value="1"/><label for="table3_text2"></label></td>
									<td headers="t3n01_1 t3th03_1 t3_c_1"><input name="textfield" type="text" id="table3_text3" class="textfield2" value="1"/><label for="table3_text3"></label></td>
									<td headers="t3n01_1 t3th03_1 t3_d_1"><input name="textfield" type="text" id="table3_text4" class="textfield2" value="1"/><label for="table3_text4"></label></td>
									<td headers="t3n01_1 t3th04_1 t3_e_1"><input name="textfield" type="text" id="table3_text5" class="textfield2" value="1"/><label for="table3_text5"></label></td>
									<td headers="t3n01_1 t3th04_1 t3_f_1"><input name="textfield" type="text" id="table3_text6" class="textfield2" value="1"/><label for="table3_text6"></label></td>
									<td headers="t3n01_1 t3th05_1"><input name="textfield" type="text" id="table3_text7" class="textfield2" value="7" style="width:30%;"/><label for="table3_text7"></label> 건</td>
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //진료현황 -->
					<!-- 동물사방역 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus4"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus4"><img src="../images/btn_minus.gif" alt=""></a>동물사방역</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys4">수정</a></span>
								<span class="sys_btn_area4"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						
						<div class="plan_box table_view4">
							<p class="plan_text">구제역 및 AI 특별방역 실시</p>
						</div>
						<div class="plan_box table_remove4">
							<p class="plan_text"><textarea rows="3" name="contents" style="width:100%; border: 0; resize: none; padding:0;">구제역 및 AI 특별방역 실시</textarea></p>
						</div>

					</div>
					<!-- //동물사방역 -->
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>

	

	<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer01 -->
		<div class="layer_box" id="layer01" style="width:800px;">
			<div class="layer_tit">결재 정보</div>
				<div class="layer_con">					
					<div class="table_box">
						<p class="sub_title" style="margin-bottom:10px;">수신<a href="#layer02" class="table_add_btn layer_open popnext_je" style="margin-top:-5px; text-indent:0;">추가</a></p>
						<table class="aniinfo_add" style="width:760px;" >
							<caption>결재정보 수신</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_1">No</th>
									<th scope="col" id="th02_1">이름</th>
									<th scope="col" id="th03_1">부서</th>
									<th scope="col" id="th04_1">팀</th>
									<th scope="col" id="th05_1">직책</th>
									<th scope="col" id="th06_1">선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01_1" headers="th01_1">1</th>
									<td headers="n01_1 th02_1">김길동</td>
									<td headers="n01_1 th03_1">동물복지2과</td>
									<td headers="n01_1 th04_1"></td>
									<td headers="n01_1 th05_1">과장</td>
									<td headers="n01_1 th06_1"><a href="#" class="del2_btn">삭제</a></td>
								</tr>
								<tr>
									<th scope="row" id="n02_1" headers="th01_1">2</th>
									<td headers="n02_1 th02_1">김길동</td>
									<td headers="n02_1 th03_1">동물복지2과</td>
									<td headers="n02_1 th04_1"></td>
									<td headers="n02_1 th05_1">과장</td>
									<td headers="n02_1 th06_1"><a href="#" class="del2_btn">삭제</a></td>
								</tr>
								<tr>
									<th scope="row" id="n03_1" headers="th01_1">3</th>
									<td headers="n03_1 th02_1"></td>
									<td headers="n03_1 th03_1"></td>
									<td headers="n03_1 th04_1"></td>
									<td headers="n03_1 th05_1"></td>
									<td headers="n03_1 th06_1"><a href="#" class="del2_btn">삭제</a></td>
								</tr>
								<tr>
									<th scope="row" id="n04_1" headers="th01_1">4</th>
									<td headers="n04_1 th02_1"></td>
									<td headers="n04_1 th03_1"></td>
									<td headers="n04_1 th04_1"></td>
									<td headers="n04_1 th05_1"></td>
									<td headers="n04_1 th06_1"><a href="#" class="del2_btn">삭제</a></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					<!-- pagination -->
					<div class="pagination" style="margin-top:10px;">
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

					<div class="table_box"  style="margin-top:20px;">
						<p class="sub_title" style="margin-bottom:10px;">참조<a href="#layer02" class="table_add_btn layer_open popnext_je" style="margin-top:-5px; text-indent:0;">추가</a></p>
						<table class="aniinfo_add" style="width:760px;" >
							<caption>결재 정보 참조</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_2">No</th>
									<th scope="col" id="th02_2">이름</th>
									<th scope="col" id="th03_2">부서</th>
									<th scope="col" id="th04_2">팀</th>
									<th scope="col" id="th05_2">직책</th>
									<th scope="col" id="th06_2">선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01_2" headers="th01_2">1</th>
									<td headers="n01_2 th02_2">김길동</td>
									<td headers="n01_2 th03_2">동물복지2과</td>
									<td headers="n01_2 th04_2"></td>
									<td headers="n01_2 th05_2">과장</td>
									<td headers="n01_2 th06_2"><a href="#" class="del2_btn">삭제</a></td>
								</tr>
								<tr>
									<th scope="row" id="n02_2" headers="th01_2">2</th>
									<td headers="n02_2 th02_2"></td>
									<td headers="n02_2 th03_2"></td>
									<td headers="n02_2 th04_2"></td>
									<td headers="n02_2 th05_2"></td>
									<td headers="n02_2 th06_2"><a href="#" class="del2_btn">삭제</a></td>
								</tr>
								<tr>
									<th scope="row" id="n03_2" headers="th01_2">3</th>
									<td headers="n03_2 th02_2"></td>
									<td headers="n03_2 th03_2"></td>
									<td headers="n03_2 th04_2"></td>
									<td headers="n03_2 th05_2"></td>
									<td headers="n03_2 th06_2"><a href="#" class="del2_btn">삭제</a></td>
								</tr>
								<tr>
									<th scope="row" id="n04_2" headers="th01_2">4</th>
									<td headers="n04_2 th02_2"></td>
									<td headers="n04_2 th03_2"></td>
									<td headers="n04_2 th04_2"></td>
									<td headers="n04_2 th05_2"></td>
									<td headers="n04_2 th06_2"><a href="#" class="del2_btn">삭제</a></td>
								</tr>
							
							</tbody>
						</table>
					</div>
					<!-- pagination -->
					<div class="pagination" style="margin-top:10px;">
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


					<div class="btn_area">
						<a href="#none" class="popent_btn btn_type2">확인</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
		<!-- #layer02 -->
		<div class="layer_box" id="layer02" style="width:800px;">
			<div class="layer_tit">직원목록</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" style="width:760px;" >
							<caption>직원목록</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">종류</th>
                                <td>
                                <p>
                                  <label><input type="radio" name="list" value="A" class="search_radio" />이름</label>
                                  <label><input type="radio" name="list" value="B" class="search_radio"/>팀</label>
								  <label><input type="radio" name="list" value="c" class="search_radio"/>부서</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">검색</th><td><input name="textfield" type="text" id="popseach_text2" class="textfield" style="width:90%"/><label for="popseach_text2"></label></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box">
						<table class="aniinfo_add" style="width:760px; margin-top:20px;" >
							<caption>종 정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_3">No</th>
									<th scope="col" id="th02_3">이름</th>
									<th scope="col" id="th03_3">부서</th>
									<th scope="col" id="th04_3">팀</th>
									<th scope="col" id="th05_3">직책</th>
									<th scope="col" id="th06_3">선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01_3" headers="th01_3">1</th>
									<td headers="n01_3 th02_3">김길동</td>
									<td headers="n01_3 th03_3">동물복지2과</td>
									<td headers="n01_3 th04_3"></td>
									<td headers="n01_3 th05_3">과장</td>
									<td headers="n01_3 th06_3"><input type="checkbox" id="sel_chk"><label for="sel_chk"></label></td>
								</tr>
								<tr>
									<th scope="row" id="n02_3" headers="th01_3">2</th>
									<td headers="n02_3 th02_3">김길동</td>
									<td headers="n02_3 th03_3">동물복지2과</td>
									<td headers="n02_3 th04_3"></td>
									<td headers="n02_3 th05_3">과장</td>
									<td headers="n02_3 th06_3"><input type="checkbox" id="sel_chk2"><label for="sel_chk2"></label></td>
								</tr>
								<tr>
									<th scope="row" id="n03_3" headers="th01_3">3</th>
									<td headers="n03_3 th02_3"></td>
									<td headers="n03_3 th03_3"></td>
									<td headers="n03_3 th04_3"></td>
									<td headers="n03_3 th05_3"></td>
									<td headers="n03_3 th06_3"></td>
								</tr>
								<tr>
									<th scope="row" id="n04_3" headers="th01_3">4</th>
									<td headers="n04_3 th02_3"></td>
									<td headers="n04_3 th03_3"></td>
									<td headers="n04_3 th04_3"></td>
									<td headers="n04_3 th05_3"></td>
									<td headers="n04_3 th06_3"></td>
								</tr>
								<tr>
									<th scope="row" id="n05_3" headers="th01_3">5</th>
									<td headers="n05_3 th02_3"></td>
									<td headers="n05_3 th03_3"></td>
									<td headers="n05_3 th04_3"></td>
									<td headers="n05_3 th05_3"></td>
									<td headers="n05_3 th06_3"></td>
								</tr>
								
							</tbody>
						</table>
					</div>

					<!-- pagination -->
					<div class="pagination"  style="margin-top:10px;">
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
					
					<div class="btn_area">
						<a href="#none" class="popadd_btn btn_type2">추가</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer02-->

	</div>
	<!-- // layer_popup -->


	</div>
	<!-- //container -->
	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>
