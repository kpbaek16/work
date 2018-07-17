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


<title>기본정보 &gt; 임시동물정보</title>
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
                    <p class="contents_title">임시동물정보</p>
                    <ol class="location">
                        <li><img src="../images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 임시동물정보</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 그룹정보-->
					<div class="aniinfo_search_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus"><img src="../images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus"><img src="../images/btn_minus.gif" alt=""></a>그룹정보</span>
							<div class="sys_btn_box">
							<span class="align_right btn_hide"><a href="#layer02" class="cha_btn layer_open">수정</a></span>
							</div>
						</div>
                        <table class="aniinfo_search table_view" >
							<caption>그룹정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">동물명</th><td>타조 (B1-1-3)</td><th scope="row">영명</th><td>South African Ostrich</td>
								</tr>
								<tr>
									<th scope="row">동물그룹명</th><td>조강 – 타조목 - 타조과</td><th scope="row">학명</th><td>Struthio camelus</td>
								</tr>
								<tr>
									<th scope="row">CITES</th><td>해당없음</td><th scope="row">천연기념물</th><td>0</td>
								</tr>
								<tr>
									<th scope="row">멸종위기</th><td>해당없음</td><th scope="row">전략종</th><td>해당없음</td>
								</tr>
								<tr>
									<th scope="row">등급</th><td>병</td><th scope="row">원산지</th><td>토종</td>
								</tr>
								<tr>
									<th scope="row">군집구분</th><td>군집</td><th scope="row">군집 개체수</th><td></td>
								</tr>
								<tr>
									<th scope="row">임신기간</th><td></td><th scope="row">평균수명</th><td>10 년</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //그룹정보-->
					<!-- 기본정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="../images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="../images/btn_minus.gif" alt=""></a>기본정보</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" class="cha_btn cha_btn_sys2">수정</a></span>
								<span class="sys_btn_area2"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_search table_view2" >
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
									<th scope="row">등록구분</th>
									<td colspan="2"><div class="select_box">			
										<select name="sel_baseinfo1" id="sel_baseinfo1">
										<option value="">번식</option>
										</select>
										</div>
									</td><th scope="row">임시동물번호</th>
									<td colspan="2">T1-1-1-1</td>
								</tr>
								<tr>
									<th scope="row">개체인식번호</th>
									<td colspan="2">T1-1-1-1</td>
									<th scope="row">인식기 종류</th>
									<td colspan="2">
										<div class="select_box">			
										<select name="sel_baseinfo2" id="sel_baseinfo2">
										<option value="">Chip</option>
										</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">반입일</th>
									<td colspan="2"><p><input type="text" class="calendar3" id="cal_1"><label for="cal_1"></label></p></td>
									<th scope="row">반입사유</th>
									<td colspan="2">
										<div class="select_box">			
										<select name="sel_baseinfo3" id="sel_baseinfo3">
										<option value="">0</option>
										</select>
										</div>
									</td>									
								</tr>
								<tr>
									<th scope="row">반입처</th>
									<td colspan="2"></td>
									<th scope="row">야생조수인수증</th>
									<td colspan="2"></td>									
								</tr>
								<tr>
									<th scope="row">반출일</th>
									<td colspan="2"><p><input type="text" class="calendar3" id="cal_2"><label for="cal_2"></label></p></td>
									<th scope="row">반출사유</th>
									<td colspan="2">
										<div class="select_box">			
										<select name="sel_baseinfo4" id="sel_baseinfo4">
										<option value="">가금사</option>
										</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">폐사일</th>
									<td colspan="2"><p><input type="text" class="calendar3" id="cal_3"><label for="cal_3"></label></p></td>
									<th scope="row">폐체처리</th>
									<td colspan="2"></td>
								</tr>
								<tr>
									<th scope="row">특이사항</th>
									<td colspan="5"></td>	
								</tr>
								<tr>
									<th rowspan="2" scope="row" style="vertical-align: middle;">이미지</th>
									<td class="img_td"><img src="../images/ex_img.gif" alt="사진"></td>
									<td class="img_td"><img src="../images/ex_img.gif" alt="사진"></td>
									<td class="img_td"></td>
									<td class="img_td"></td>
									<td class="img_td"></td>
								</tr>
								<tr>
									<td class="td_btn_box"><a href="#" class="t_cha_btn">수정</a><a href="#" class="del2_btn btn_type2">삭제</a></td>
									<td class="td_btn_box"><a href="#" class="t_cha_btn">수정<a href="#" class="del2_btn btn_type2">삭제</a></a></td>
									<td class="td_btn_box"><a href="#" class="t_add_btn">추가</a></td>
									<td class="td_btn_box"><a href="#" class="t_add_btn">추가</a></td>
									<td class="td_btn_box"><a href="#" class="t_add_btn">추가</a></td>
								</tr>
						   </tbody>
						</table>

						<table class="aniinfo_search table_remove2" >
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
									<th scope="row">등록구분</th>
									<td colspan="2"><div class="select_box">			
										<select name="sel2_baseinfo1" id="sel2_baseinfo1">
										<option value="">번식</option>
										</select>
										</div>
									</td><th scope="row">임시동물번호</th>
									<td colspan="2"><input name="textfield" type="text" id="table2_text1" class="textfield" style="width:90%" value="T1-1-1-1"><label for="table2_text1"></label></td>
								</tr>
								<tr>
									<th scope="row">개체인식번호</th>
									<td colspan="2"><input name="textfield" type="text" id="table2_text2" class="textfield" style="width:90%" value="T1-1-1-1"><label for="table2_text2"></label></td>
									<th scope="row">인식기 종류</th>
									<td colspan="2">
										<div class="select_box">			
										<select name="sel2_baseinfo2" id="sel2_baseinfo2">
										<option value="">Chip</option>
										</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">반입일</th>
									<td colspan="2"><p><input type="text" class="calendar3" id="cal2_1"><label for="cal2_1"></label></p></td>
									<th scope="row">반입사유</th>
									<td colspan="2">
										<div class="select_box">			
										<select name="sel2_baseinfo3" id="sel2_baseinfo3">
										<option value="">0</option>
										</select>
										</div>
									</td>									
								</tr>
								<tr>
									<th scope="row">반입처</th>
									<td colspan="2"><input name="textfield" type="text" id="table2_text3" class="textfield" style="width:90%" value=""><label for="table2_text3"></label></td>
									<th scope="row">야생조수인수증</th>
									<td colspan="2"><input name="textfield" type="text" id="table2_text4" class="textfield" style="width:90%" value=""><label for="table2_text4"></label></td>									
								</tr>
								<tr>
									<th scope="row">반출일</th>
									<td colspan="2"><p><input type="text" class="calendar3" id="cal2_2"><label for="cal2_2"></label></p></td>
									<th scope="row">반출사유</th>
									<td colspan="2">
										<div class="select_box">			
										<select name="sel2_baseinfo4" id="sel2_baseinfo4">
										<option value="">가금사</option>
										</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">폐사일</th>
									<td colspan="2"><p><input type="text" class="calendar3" id="cal2_3"><label for="cal2_3"></label></p></td>
									<th scope="row">폐체처리</th>
									<td colspan="2"><input name="textfield" type="text" id="table2_text5" class="textfield" style="width:90%" value=""><label for="table2_text5"></label></td>
								</tr>
								<tr>
									<th scope="row">특이사항</th>
									<td colspan="5"><input name="textfield" type="text" id="table2_text6" class="textfield" style="width:90%" value=""><label for="table2_text6"></label></td>	
								</tr>
								<tr>
									<th rowspan="2" scope="row" style="vertical-align: middle;">이미지</th>
									<td class="img_td"><img src="../images/ex_img.gif" alt="사진"></td>
									<td class="img_td"><img src="../images/ex_img.gif" alt="사진"></td>
									<td class="img_td"></td>
									<td class="img_td"></td>
									<td class="img_td"></td>
								</tr>
								<tr>
									<td class="td_btn_box"><a href="#" class="t_cha_btn">수정</a><a href="#" class="del2_btn btn_type2">삭제</a></td>
									<td class="td_btn_box"><a href="#" class="t_cha_btn">수정</a><a href="#" class="del2_btn btn_type2">삭제</a></td>
									<td class="td_btn_box"><a href="#" class="t_add_btn">추가</a></td>
									<td class="td_btn_box"><a href="#" class="t_add_btn">추가</a></td>
									<td class="td_btn_box"><a href="#" class="t_add_btn">추가</a></td>
								</tr>
						   </tbody>
						</table>

					</div>
					<!-- //기본정보-->
					<div class="btn_area_bottom">
						<a href="#" class="save2_btn">저장</a><a href="#" class="list_btn">목록</a>
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
		<div class="layer_box" id="layer02" style="width:800px;">
			<div class="layer_tit">동물그룹 정보변경</div>
				<div class="layer_con">
					<div class="table_box">
						<table class="ani_list anigrouppop" style="width:760px; margin-bottom:0;">
							<caption>동물그룹정보변경</caption>
							<colgroup>
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
								<col style="width:20%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="info0"></th>
									<th scope="col" id="info1">강</th>
									<th scope="col" id="info2">목</th>
									<th scope="col" id="info3">과</th>
									<th scope="col" id="info4">종</th>
								</tr>
							</thead>
							<tbody>
								<tr><th id="before" headers="info0">변경전</th><td headers="before info1">조강</td><td headers="before info2">타조목</td><td headers="before info3">타조과</td><td headers="before info4">타조종</td></tr>
								<tr><th id="after" headers="info0">변경후</th><td headers="after info1">조강</td><td headers="after info2">타조목</td><td headers="after info3"></td><td headers="after info4"></td></tr>
							</tbody>
						</table>
					</div>
					<div class="btn_area">
						<a href="#none" class="popent_btn">확인</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>
					<div class="table_box">
                        <table class="ani_list">
							<caption>강그룹</caption>
							<colgroup>
								<col style="width:50%" />
							</colgroup>
							<thead>
								<tr><th scope="col">강<a href="#" class="all2_btn">전체</a></th></tr>
							</thead>
							<tbody>
								<tr><td><a href="#">조강</a></td></tr>								
							</tbody>
						</table>
						<table class="ani_list">
							<caption>강그룹</caption>
							<colgroup>
								<col style="width:50%"/>
							</colgroup>
							<thead>
								<tr><th scope="col">목<a href="#" class="all2_btn">전체</a></th></tr>
							</thead>
							<tbody>
								<tr><td><a href="#">1 - 타조목</a></td></tr>
								<!-- <tr><td><a href="#">2 - 사다새목</a></td></tr> -->
								<!-- <tr><td><a href="#">3 - 황새목</a></td></tr> -->
								<!-- <tr><td><a href="#">4 - 홍학목</a></td></tr> -->
							</tbody>
						</table>
						<table class="ani_list" >
							<caption>과그룹</caption>
							<colgroup>
								<col style="width:50%" />
							</colgroup>
							<thead>
								<tr><th scope="col">과</th></tr>
							</thead>
							<tbody>
								<tr><td><a href="#">1 - 타조과</a></td></tr>
								<tr><td><a href="#">2 - 레아과</a></td></tr>
								<tr><td><a href="#">3 - 에뮤과</a></td></tr>
								<tr><td><a href="#">4 - 화식초과</a></td></tr>
							</tbody>
						</table>
					</div>
					<div class="btn_area">
						<a href="#none" class="popdel_btn">삭제</a>
						<a href="#none" class="poplist_btn btn_type2">목록</a>
					</div>	
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
