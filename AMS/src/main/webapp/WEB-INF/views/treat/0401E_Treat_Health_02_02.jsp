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

<title>동물진료 &gt; 보건일지</title>
</head>
<body>
<div id="sub_wrap">

	<jsp:include page="/header.do"></jsp:include>
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
					<!-- 진료내역 -->
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>진료내역</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys">수정</a></span>
								<span class="sys_btn_area"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>진료내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:5%;">
								<col style="width:9%;">
								<col style="width:13%;">
								<col style="width:8%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">진료번호</th>
									<th scope="col" id="th03">동물명</th>
									<th scope="col" id="th04">동물번호</th>
									<th scope="col" id="th05">성별</th>
									<th scope="col" id="th06">동물사</th>
									<th scope="col" id="th07">병명</th>
									<th scope="col" id="th08">진료의</th>
									<th scope="col" id="th09">진료내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">JR-20160720</td>
									<td headers="n01 th03">아프리카포큐파일</td>
									<td headers="n01 th04">1234567</td>
									<td headers="n01 th05">암</td>
									<td headers="n01 th06">야행관</td>
									<td headers="n01 th07">좌인염식욕저하</td>
									<td headers="n01 th08">홍길동</td>
									<td headers="n01 th09"></td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02"></td>
									<td headers="n02 th03"></td>
									<td headers="n02 th04"></td>
									<td headers="n02 th05"></td>
									<td headers="n02 th06"></td>
									<td headers="n02 th07"></td>
									<td headers="n02 th08"></td>
									<td headers="n02 th09"></td>
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
								
							</tbody>
						</table>
						<table class="aniinfo_add table_remove" >
							<caption>진료내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:5%;">
								<col style="width:9%;">
								<col style="width:13%;">
								<col style="width:8%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_1">No</th>
									<th scope="col" id="th02_1">진료번호</th>
									<th scope="col" id="th03_1">동물명</th>
									<th scope="col" id="th04_1">동물번호</th>
									<th scope="col" id="th05_1">성별</th>
									<th scope="col" id="th06_1">동물사</th>
									<th scope="col" id="th07_1">병명</th>
									<th scope="col" id="th08_1">진료의</th>
									<th scope="col" id="th09_1">진료내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01_1" headers="th01_1">1</th>
									<td headers="n01_1 th02_1"><input name="textfield" type="text" id="table_text1" class="textfield2" value="JR-20160720"/><label for="table_text1"></label></td>
									<td headers="n01_1 th03_1"><input name="textfield" type="text" id="table_text2" class="textfield2" value="아프리카포큐파일"/><label for="table_text2"></label></td>
									<td headers="n01_1 th04_1"><input name="textfield" type="text" id="table_text3" class="textfield2" value="1234567"/><label for="table_text3"></label></td>
									<td headers="n01_1 th05_1"><input name="textfield" type="text" id="table_text4" class="textfield2" value="암"/><label for="table_text4"></label></td>
									<td headers="n01_1 th06_1"><input name="textfield" type="text" id="table_text5" class="textfield2" value="야행관"/><label for="table_text5"></label></td>
									<td headers="n01_1 th07_1"><input name="textfield" type="text" id="table_text6" class="textfield2" value="좌인염식욕저하"/><label for="table_text6"></label></td>
									<td headers="n01_1 th08_1"><input name="textfield" type="text" id="table_text7" class="textfield2" value="홍길동"/><label for="table_text7"></label></td>
									<td headers="n01_1 th09_1"><input name="textfield" type="text" id="table_text8" class="textfield" value=""/><label for="table_text8"></label></td>
								</tr>
								<tr>
									<th scope="row" id="n02_1" headers="th01_1">2</th>
									<td headers="n02_1 th02_1"></td>
									<td headers="n02_1 th03_1"></td>
									<td headers="n02_1 th04_1"></td>
									<td headers="n02_1 th05_1"></td>
									<td headers="n02_1 th06_1"></td>
									<td headers="n02_1 th07_1"></td>
									<td headers="n02_1 th08_1"></td>
									<td headers="n02_1 th09_1"></td>
								</tr>
								<tr>
									<th scope="row" id="n03_1" headers="th01_1">3</th>
									<td headers="n03_1 th02_1"></td>
									<td headers="n03_1 th03_1"></td>
									<td headers="n03_1 th04_1"></td>
									<td headers="n03_1 th05_1"></td>
									<td headers="n03_1 th06_1"></td>
									<td headers="n03_1 th07_1"></td>
									<td headers="n03_1 th08_1"></td>
									<td headers="n03_1 th09_1"></td>
								</tr>
								<tr>
									<th scope="row" id="n04_1" headers="th01_1">4</th>
									<td headers="n04_1 th02_1"></td>
									<td headers="n04_1 th03_1"></td>
									<td headers="n04_1 th04_1"></td>
									<td headers="n04_1 th05_1"></td>
									<td headers="n04_1 th06_1"></td>
									<td headers="n04_1 th07_1"></td>
									<td headers="n04_1 th08_1"></td>
									<td headers="n04_1 th09_1"></td>
								</tr>
								<tr>
									<th scope="row" id="n05_1" headers="th01_1">5</th>
									<td headers="n05_1 th02_1"></td>
									<td headers="n05_1 th03_1"></td>
									<td headers="n05_1 th04_1"></td>
									<td headers="n05_1 th05_1"></td>
									<td headers="n05_1 th06_1"></td>
									<td headers="n05_1 th07_1"></td>
									<td headers="n05_1 th08_1"></td>
									<td headers="n05_1 th09_1"></td>
								</tr>
								
							</tbody>
						</table>
					
					</div>
					


					<!-- //진료내역 -->
		
					<!-- 금일폐사 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>금일폐사</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys2">수정</a></span>
								<span class="sys_btn_area2"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view2" >
							<caption>금일폐사</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:5%;">
								<col style="width:9%;">
								<col style="width:13%;">
								<col style="width:25%;">
								<col style="width:8%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t2th01">No</th>
									<th scope="col" id="t2th02">폐사보고서</th>
									<th scope="col" id="t2th03">동물명</th>
									<th scope="col" id="t2th04">동물번호</th>
									<th scope="col" id="t2th05">성별</th>
									<th scope="col" id="t2th06">동물사</th>
									<th scope="col" id="t2th07">나이</th>
									<th scope="col" id="t2th08">폐사경위</th>
									<th scope="col" id="t2th09">부검요청</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t2n01" headers="t2th01">1</th>
									<td headers="t2n01 t2th02">JR-20160720</td>
									<td headers="t2n01 t2th03">아프리카포큐파일</td>
									<td headers="t2n01 t2th04">1234567</td>
									<td headers="t2n01 t2th05">암</td>
									<td headers="t2n01 t2th06">야행관</td>
									<td headers="t2n01 t2th07">1 년 1 개월</td>
									<td headers="t2n01 t2th08">혈액검사, 약물 투여</td>
									<td headers="t2n01 t2th09"></td>
								</tr>
								<tr>
									<th scope="row" id="t2n02" headers="t2th01">2</th>
									<td headers="t2n02 t2th02"></td>
									<td headers="t2n02 t2th03"></td>
									<td headers="t2n02 t2th04"></td>
									<td headers="t2n02 t2th05"></td>
									<td headers="t2n02 t2th06"></td>
									<td headers="t2n02 t2th07"></td>
									<td headers="t2n02 t2th08"></td>
									<td headers="t2n02 t2th09"></td>
								</tr>
								<tr>
									<th scope="row" id="t2n03" headers="t2th01">3</th>
									<td headers="t2n03 t2th02"></td>
									<td headers="t2n03 t2th03"></td>
									<td headers="t2n03 t2th04"></td>
									<td headers="t2n03 t2th05"></td>
									<td headers="t2n03 t2th06"></td>
									<td headers="t2n03 t2th07"></td>
									<td headers="t2n03 t2th08"></td>
									<td headers="t2n03 t2th09"></td>
								</tr>
							</tbody>
						
						</table>
						<table class="aniinfo_add table_remove2" >
							<caption>금일폐사</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:5%;">
								<col style="width:9%;">
								<col style="width:13%;">
								<col style="width:25%;">
								<col style="width:8%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t2th01_1">No</th>
									<th scope="col" id="t2th02_1">폐사보고서</th>
									<th scope="col" id="t2th03_1">동물명</th>
									<th scope="col" id="t2th04_1">동물번호</th>
									<th scope="col" id="t2th05_1">성별</th>
									<th scope="col" id="t2th06_1">동물사</th>
									<th scope="col" id="t2th07_1">나이</th>
									<th scope="col" id="t2th08_1">폐사경위</th>
									<th scope="col" id="t2th09_1">부검요청</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t2n01_1" headers="t2th01_1">1</th>
									<td headers="t2n01_1 t2th02_1"><input name="textfield" type="text" id="table2_text1" class="textfield2" value="JR-20160720"/><label for="table2_text1"></label></td>
									<td headers="t2n01_1 t2th03_1"><input name="textfield" type="text" id="table2_text2" class="textfield2" value="아프리카포큐파일"/><label for="table2_text2"></label></td>
									<td headers="t2n01_1 t2th04_1"><input name="textfield" type="text" id="table2_text3" class="textfield2" value="1234567"/><label for="table2_text3"></label></td>
									<td headers="t2n01_1 t2th05_1"><input name="textfield" type="text" id="table2_text4" class="textfield2" value="암"/><label for="table2_text4"></label></td>
									<td headers="t2n01_1 t2th06_1"><input name="textfield" type="text" id="table2_text5" class="textfield2" value="야행관"/><label for="table2_text5"></label></td>
									<td headers="t2n01_1 t2th07_1"><input name="textfield" type="text" id="table2_text6" class="textfield2" value="1 년 1 개월"/><label for="table2_text6"></label></td>
									<td headers="t2n01_1 t2th08_1"><input name="textfield" type="text" id="table2_text7" class="textfield" value="혈액검사, 약물 투여"/><label for="table2_text7"></label></td>
									<td headers="t2n01_1 t2th09_1"><input name="textfield" type="text" id="table2_text8" class="textfield2" value=""/><label for="table2_text8"></label></td>
								</tr>
								<tr>
									<th scope="row" id="t2n02_1" headers="t2th01_1">2</th>
									<td headers="t2n02_1 t2th02_1"></td>
									<td headers="t2n02_1 t2th03_1"></td>
									<td headers="t2n02_1 t2th04_1"></td>
									<td headers="t2n02_1 t2th05_1"></td>
									<td headers="t2n02_1 t2th06_1"></td>
									<td headers="t2n02_1 t2th07_1"></td>
									<td headers="t2n02_1 t2th08_1"></td>
									<td headers="t2n02_1 t2th09_1"></td>
								</tr>
								<tr>
									<th scope="row" id="t2n03_1" headers="t2th01_1">3</th>
									<td headers="t2n03_1 t2th02_1"></td>
									<td headers="t2n03_1 t2th03_1"></td>
									<td headers="t2n03_1 t2th04_1"></td>
									<td headers="t2n03_1 t2th05_1"></td>
									<td headers="t2n03_1 t2th06_1"></td>
									<td headers="t2n03_1 t2th07_1"></td>
									<td headers="t2n03_1 t2th08_1"></td>
									<td headers="t2n03_1 t2th09_1"></td>
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //금일폐사 -->
					
					<!-- 입원동물 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus3"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>입원동물</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys3">수정</a></span>
								<span class="sys_btn_area3"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view3" >
							<caption>입원동물</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:5%;">
								<col style="width:9%;">
								<col style="width:13%;">
								<col style="width:8%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t3th01">No</th>
									<th scope="col" id="t3th02">진료번호</th>
									<th scope="col" id="t3th03">동물명</th>
									<th scope="col" id="t3th04">동물번호</th>
									<th scope="col" id="t3th05">성별</th>
									<th scope="col" id="t3th06">동물사</th>
									<th scope="col" id="t3th07">병명</th>
									<th scope="col" id="t3th08">진료의</th>
									<th scope="col" id="t3th09">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t3n01" headers="t3th01">1</th>
									<td headers="t3n01 t3th02">JR-20160720</td>
									<td headers="t3n01 t3th03">아프리카포큐파일</td>
									<td headers="t3n01 t3th04">1234567</td>
									<td headers="t3n01 t3th05">암</td>
									<td headers="t3n01 t3th06">야행관</td>
									<td headers="t3n01 t3th07">좌인염식욕저하</td>
									<td headers="t3n01 t3th08">김길동</td>
									<td headers="t3n01 t3th09"></td>
								</tr>
								<tr>
									<th scope="row" id="t3n02" headers="t3th01">2</th>
									<td headers="t3n02 t3th02"></td>
									<td headers="t3n02 t3th03"></td>
									<td headers="t3n02 t3th04"></td>
									<td headers="t3n02 t3th05"></td>
									<td headers="t3n02 t3th06"></td>
									<td headers="t3n02 t3th07"></td>
									<td headers="t3n02 t3th08"></td>
									<td headers="t3n02 t3th09"></td>
								</tr>
								<tr>
									<th scope="row" id="t3n03" headers="t3th01">3</th>
									<td headers="t3n03 t3th02"></td>
									<td headers="t3n03 t3th03"></td>
									<td headers="t3n03 t3th04"></td>
									<td headers="t3n03 t3th05"></td>
									<td headers="t3n03 t3th06"></td>
									<td headers="t3n03 t3th07"></td>
									<td headers="t3n03 t3th08"></td>
									<td headers="t3n03 t3th09"></td>
								</tr>
							</tbody>
						
						</table>
						<table class="aniinfo_add table_remove3" >
							<caption>입원동물</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:14%;">
								<col style="width:9%;">
								<col style="width:5%;">
								<col style="width:9%;">
								<col style="width:13%;">
								<col style="width:8%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t3th01_1">No</th>
									<th scope="col" id="t3th02_1">진료번호</th>
									<th scope="col" id="t3th03_1">동물명</th>
									<th scope="col" id="t3th04_1">동물번호</th>
									<th scope="col" id="t3th05_1">성별</th>
									<th scope="col" id="t3th06_1">동물사</th>
									<th scope="col" id="t3th07_1">병명</th>
									<th scope="col" id="t3th08_1">진료의</th>
									<th scope="col" id="t3th09_1">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t3n01_1" headers="t3th01_1">1</th>
									<td headers="t3n01_1 t3th02_1"><input name="textfield" type="text" id="table3_text1" class="textfield2" value="JR-20160720"/><label for="table3_text1"></label></td>
									<td headers="t3n01_1 t3th03_1"><input name="textfield" type="text" id="table3_text2" class="textfield2" value="아프리카포큐파일"/><label for="table3_text2"></label></td>
									<td headers="t3n01_1 t3th04_1"><input name="textfield" type="text" id="table3_text3" class="textfield2" value="1234567"/><label for="table3_text3"></label></td>
									<td headers="t3n01_1 t3th05_1"><input name="textfield" type="text" id="table3_text4" class="textfield2" value="암"/><label for="table3_text4"></label></td>
									<td headers="t3n01_1 t3th06_1"><input name="textfield" type="text" id="table3_text5" class="textfield2" value="야행관"/><label for="table3_text5"></label></td>
									<td headers="t3n01_1 t3th07_1"><input name="textfield" type="text" id="table3_text6" class="textfield2" value="좌인염식욕저하"/><label for="table3_text6"></label></td>
									<td headers="t3n01_1 t3th08_1"><input name="textfield" type="text" id="table3_text7" class="textfield2" value="김길동"/><label for="table3_text7"></label></td>
									<td headers="t3n01_1 t3th09_1"><input name="textfield" type="text" id="table3_text8" class="textfield" value=""/><label for="table3_text8"></label></td>
								</tr>
								<tr>
									<th scope="row" id="t3n02_1" headers="t3th01_1">2</th>
									<td headers="t3n02_1 t3th02_1"></td>
									<td headers="t3n02_1 t3th03_1"></td>
									<td headers="t3n02_1 t3th04_1"></td>
									<td headers="t3n02_1 t3th05_1"></td>
									<td headers="t3n02_1 t3th06_1"></td>
									<td headers="t3n02_1 t3th07_1"></td>
									<td headers="t3n02_1 t3th08_1"></td>
									<td headers="t3n02_1 t3th09_1"></td>
								</tr>
								<tr>
									<th scope="row" id="t3n03_1" headers="t3th01_1">3</th>
									<td headers="t3n03_1 t3th02_1"></td>
									<td headers="t3n03_1 t3th03_1"></td>
									<td headers="t3n03_1 t3th04_1"></td>
									<td headers="t3n03_1 t3th05_1"></td>
									<td headers="t3n03_1 t3th06_1"></td>
									<td headers="t3n03_1 t3th07_1"></td>
									<td headers="t3n03_1 t3th08_1"></td>
									<td headers="t3n03_1 t3th09_1"></td>
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //입원동물 -->

				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>


	</div>
	<!-- //container -->
	<!-- footer -->
	<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>
