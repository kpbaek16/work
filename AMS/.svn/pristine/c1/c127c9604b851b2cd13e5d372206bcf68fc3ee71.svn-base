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
					<!-- 임상병리검사 -->
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>임상병리검사</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys">수정</a></span>
								<span class="sys_btn_area"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view" >
							<caption>임상병리검사</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:12%;">
								<col style="width:5%;">
								<col style="width:11%;">
								<col style="width:12%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">검사번호</th>
									<th scope="col" id="th03">동물명</th>
									<th scope="col" id="th04">동물번호</th>
									<th scope="col" id="th05">성별</th>
									<th scope="col" id="th06">동물사</th>
									<th scope="col" id="th07">나이</th>
									<th scope="col" id="th08">검사명</th>
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
									<td headers="n01 th07">1 년 1 개월</td>
									<td headers="n01 th08"></td>
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
								</tr>
							</tbody>
						</table>
						<table class="aniinfo_add table_remove" >
							<caption>임상병리검사</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:12%;">
								<col style="width:5%;">
								<col style="width:11%;">
								<col style="width:12%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_1">No</th>
									<th scope="col" id="th02_1">검사번호</th>
									<th scope="col" id="th03_1">동물명</th>
									<th scope="col" id="th04_1">동물번호</th>
									<th scope="col" id="th05_1">성별</th>
									<th scope="col" id="th06_1">동물사</th>
									<th scope="col" id="th07_1">나이</th>
									<th scope="col" id="th08_1">검사명</th>
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
									<td headers="n01_1 th07_1"><input name="textfield" type="text" id="table_text6" class="textfield2" value="1 년 1 개월"/><label for="table_text6"></label></td>
									<td headers="n01_1 th08_1"><input name="textfield" type="text" id="table_text7" class="textfield" value=""/><label for="table_text7"></label></td>
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
								</tr>
							</tbody>
						</table>
					
					</div>
					<!-- //임상병리검사 -->

					<!-- 임상병리검사 예약 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>임상병리검사 예약</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys2">수정</a></span>
								<span class="sys_btn_area2"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view2" >
							<caption>임상병리검사 예약</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:12%;">
								<col style="width:5%;">
								<col style="width:11%;">
								<col style="width:12%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t2th01">No</th>
									<th scope="col" id="t2th02">검사명</th>
									<th scope="col" id="t2th03">동물명</th>
									<th scope="col" id="t2th04">동물번호</th>
									<th scope="col" id="t2th05">성별</th>
									<th scope="col" id="t2th06">동물사</th>
									<th scope="col" id="t2th07">나이</th>
									<th scope="col" id="t2th08">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t2n01" headers="t2th01">1</th>
									<td headers="t2n01 t2th02">혈액검사</td>
									<td headers="t2n01 t2th03">아프리카포큐파일</td>
									<td headers="t2n01 t2th04">1234567</td>
									<td headers="t2n01 t2th05">암</td>
									<td headers="t2n01 t2th06">야행관</td>
									<td headers="t2n01 t2th07">1 년 1 개월</td>
									<td headers="t2n01 t2th08"></td>
								</tr>
								<tr>
									<th scope="row" id="t2n02" headers="t2th01">2</th>
									<td headers="t2n02 t2th02">혈액생화학검사</td>
									<td headers="t2n02 t2th03">아프리카포큐파일</td>
									<td headers="t2n02 t2th04">1234567</td>
									<td headers="t2n02 t2th05">암</td>
									<td headers="t2n02 t2th06">야행관</td>
									<td headers="t2n02 t2th07">1 년 1 개월</td>
									<td headers="t2n02 t2th08"></td>
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
								</tr>
							</tbody>
						
						</table>
						<table class="aniinfo_add table_remove2" >
							<caption>임상병리검사 예약</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:12%;">
								<col style="width:5%;">
								<col style="width:11%;">
								<col style="width:12%;">
								<col style="width:25%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="t2th01_1">No</th>
									<th scope="col" id="t2th02_1">검사명</th>
									<th scope="col" id="t2th03_1">동물명</th>
									<th scope="col" id="t2th04_1">동물번호</th>
									<th scope="col" id="t2th05_1">성별</th>
									<th scope="col" id="t2th06_1">동물사</th>
									<th scope="col" id="t2th07_1">나이</th>
									<th scope="col" id="t2th08_1">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t2n01_1" headers="t2th01_1">1</th>
									<td headers="t2n01_1 t2th02_1"><input name="textfield" type="text" id="table2_text1" class="textfield2" value="혈액검사"/><label for="table2_text1"></label></td>
									<td headers="t2n01_1 t2th03_1"><input name="textfield" type="text" id="table2_text2" class="textfield2" value="아프리카포큐파일"/><label for="table2_text2"></label></td>
									<td headers="t2n01_1 t2th04_1"><input name="textfield" type="text" id="table2_text3" class="textfield2" value="1234567"/><label for="table2_text3"></label></td>
									<td headers="t2n01_1 t2th05_1"><input name="textfield" type="text" id="table2_text4" class="textfield2" value="암"/><label for="table2_text4"></label></td>
									<td headers="t2n01_1 t2th06_1"><input name="textfield" type="text" id="table2_text5" class="textfield2" value="야행관"/><label for="table2_text5"></label></td>
									<td headers="t2n01_1 t2th07_1"><input name="textfield" type="text" id="table2_text6" class="textfield2" value="1 년 1 개월"/><label for="table2_text6"></label></td>
									<td headers="t2n01_1 t2th08_1"><input name="textfield" type="text" id="table2_text7" class="textfield" value=""/><label for="table2_text7"></label></td>
								</tr>
								<tr>
									<th scope="row" id="t2n02_1" headers="t2th01_1">2</th>
									<td headers="t2n02_1 t2th02_1"><input name="textfield" type="text" id="table2_text8" class="textfield2" value="혈액생화학검사"/><label for="table2_text8"></label></td>
									<td headers="t2n02_1 t2th03_1"><input name="textfield" type="text" id="table2_text9" class="textfield2" value="아프리카포큐파일"/><label for="table2_text9"></label></td>
									<td headers="t2n02_1 t2th04_1"><input name="textfield" type="text" id="table2_text10" class="textfield2" value="1234567"/><label for="table2_text10"></label></td>
									<td headers="t2n02_1 t2th05_1"><input name="textfield" type="text" id="table2_text11" class="textfield2" value="암"/><label for="table2_text11"></label></td>
									<td headers="t2n02_1 t2th06_1"><input name="textfield" type="text" id="table2_text12" class="textfield2" value="야행관"/><label for="table2_text12"></label></td>
									<td headers="t2n02_1 t2th07_1"><input name="textfield" type="text" id="table2_text13" class="textfield2" value="1 년 1 개월"/><label for="table2_text13"></label></td>
									<td headers="t2n02_1 t2th08_1"><input name="textfield" type="text" id="table2_text14" class="textfield" value=""/><label for="table2_text14"></label></td>
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
								</tr>
							</tbody>
						
						</table>
					</div>
					<!-- //임상병리검사 예약 -->				


					<!-- 특기사항 -->
					<div class="aniinfo_add_box" style="margin-bottom:30px;">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus3"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>특기사항</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys3">수정</a></span>
								<span class="sys_btn_area3"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						
						<div class="plan_box table_view3">
							<p class="plan_text" style="height:250px;">
								늑대 암컷 <br>
								 - 여우사에서 사육중, 행동 위축 지속<br>
								 - 먹이섭취 및 배변 상태 정상<br>
								 - 좌후지 상태 양호함<br>
								 - 경구제 투약중<br><br>

								방사거북 암컷<br>
								 - 남미관에서 사육중<br>
								 - 식욕 및 활력 양호함.<br>
							</p>
													</div>
						<div class="plan_box table_remove3">
							<p class="plan_text" style="height:250px;"><textarea rows="9" name="contents" style="width:100%; border: 0; resize: none; padding:0;">
								늑대 암컷 
								 - 여우사에서 사육중, 행동 위축 지속
								 - 먹이섭취 및 배변 상태 정상
								 - 좌후지 상태 양호함
								 - 경구제 투약중

								방사거북 암컷
								 - 남미관에서 사육중
								 - 식욕 및 활력 양호함.
							</textarea></p>
						</div>

					</div>
					<!-- //특기사항 -->

					<div class="btn_area_bottom">
						<a href="#" class="del3_btn">삭제</a><a href="#" class="list_btn">목록</a>
					</div>

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
