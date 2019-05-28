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
<script type="text/javascript" src="../js/contents/base.js"></script>

<title>기본정보 &gt; 방사장</title>
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
                    <p class="contents_title">방사장</p>
                    <ol class="location">
                        <li><img src="../images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 방사장</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 분류검색표-->
					<div class="search_box">
                        <table class="search_table" >
							<caption>분류구분 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">분류구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" name="list" value="A" class="search_radio" />부서</label>
                                  <label><input type="radio" name="list" value="B" class="search_radio"/>팀</label>
								  <label><input type="radio" name="list" value="c" class="search_radio"/>동물사</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류명칭</th><td><input name="textfield" type="text" id="seach_text" class="textfield" style="width:90%"/><label for="seach_text"></label></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<!-- //분류검색표-->
					<!-- 방사장관리-->
					<div class="table_wrap">
						<!-- 방사장관리표-->
						<p class="sub_title">방사장관리</p>					
						<table class="ani_list category">
							<caption>부서</caption>
							<colgroup>
								<col style="width:100%" />
							</colgroup>
							<thead>
								<tr><th scope="col">부서<a href="#" class="add_btn">추가</a><a href="#" class="all_btn">전체</a></th></tr>
							</thead>
							<tbody>
								<tr><td><a href="#">동물복지1과</a></td></tr>
								<tr><td><a href="#">동물복지1과</a></td></tr>
								<tr><td><a href="#">동물복지1과</a></td></tr>
								<tr><td><a href="#">동물복지1과</a></td></tr>
								<tr><td><a href="#">동물복지1과</a></td></tr>
							</tbody>
						</table>
						
						<div class="article category01">							
							<table class="ani_list">
								<caption>팀</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">팀<a href="#" class="add_btn">추가</a><a href="#" class="all_btn">전체</a></th></tr>
								</thead>
								<tbody>
									<tr><td><a href="#">복지1팀</a></td></tr>
									<tr><td><a href="#">복지1팀</a></td></tr>
									<tr><td><a href="#">복지1팀</a></td></tr>
									<tr><td><a href="#">복지1팀</a></td></tr>
									<tr><td><a href="#">복지1팀</a></td></tr>
								</tbody>
							</table>							
						</div>
						<div class="article category02">							
							<table class="ani_list" >
								<caption>동물사</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">동물사<a href="#" class="add_btn">추가</a><a href="#" class="all_btn">전체</a></th></tr>
								</thead>
								<tbody>
									<tr><td><a href="#">야행관</a></td></tr>
									<tr><td><a href="#">야행관</a></td></tr>
									<tr><td><a href="#">야행관</a></td></tr>
									<tr><td><a href="#">야행관</a></td></tr>
									<tr><td><a href="#">야행관</a></td></tr>
									<tr><td><a href="#">야행관</a></td></tr>
								</tbody>
							</table>
						</div>
						<div class="article category03">							
							<table class="ani_list" >
								<caption>방사장명</caption>
								<colgroup>
									<col style="width:100%" />
								</colgroup>
								<thead>
									<tr><th scope="col">방사장명<a href="#" class="add_btn">추가</a><a href="#" class="all_btn">전체</a></th></tr>
								</thead>
								<tbody>
									<tr><td><a href="#">방사장1</a></td></tr>
									<tr><td><a href="#">방사장1</a></td></tr>
									<tr><td><a href="#">방사장1</a></td></tr>
									<tr><td><a href="#">방사장1</a></td></tr>
									<tr><td><a href="#">방사장1</a></td></tr>
									<tr><td><a href="#">방사장1</a></td></tr>
								</tbody>
							</table>
						</div>
						<!-- //방사장관리표-->
						<!-- 상세정보표-->
						<div class="ani_info_box" style="height:465px;">
							<!-- 상세정보기본-->
							
							<!-- 상세정보-->
							<table class="ani_info infobase" > 
								<caption>방사장관리상세정보</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span></th></tr>
								</thead>
								<tbody>
									<tr><th scope="row">분류</th><td></td></tr>
									<tr><th scope="row">부서정보</th><td></td></tr>
									<tr><th scope="row">팀정보</th><td></td></tr>
									<tr><th scope="row">동물사정보</th><td></td></tr>
									<tr><th scope="row">방사장명</th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
							   </tbody>
							</table>

							<table class="ani_info infotable" > 
								<caption>방사장관리상세정보</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span><a href="#" class="cha_btn">수정</a><a href="#layer04" class="del_btn layer_open">삭제</a></th></tr>
								</thead>
								<tbody>
									<tr><th scope="row">분류</th><td>방사장</td></tr>
									<tr><th scope="row">부서정보</th><td>동물복지1과 (6113719)</td></tr>
									<tr><th scope="row">팀정보</th><td>복지1팀(1)</td></tr>
									<tr><th scope="row">동물사정보</th><td>야행관(1)</td></tr>
									<tr><th scope="row">방사장명</th><td>방사장1</td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
							   </tbody>
							</table>
							<table class="ani_info infotable01" > 
								<caption>방사장관리상세정보</caption>
								<colgroup>
									<col style="width:30%"/>
									<col style="width:70%"/>
								</colgroup>
								<thead>
									<tr><th colspan="2" scope="col"><span class="info_title">상세정보</span><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></th></tr>
								</thead>
								<tbody>
									<tr><th scope="row">분류</th><td><input name="textfield" type="text" id="table1_text1" class="textfield" value="방사장" /><label for="table1_text1"></label></td></tr>
									<tr><th scope="row">부서정보</th><td><input name="textfield" type="text" id="table1_text2" class="textfield" value="동물복지1과 (6113719)" /><label for="table1_text2"></label></td></tr>
									<tr><th scope="row">팀정보</th><td><input name="textfield" type="text" id="table1_text3" class="textfield" value="복지1팀(1)" /><label for="table1_text3"></label></td></tr>
									<tr><th scope="row">동물사정보</th><td><input name="textfield" type="text" id="table1_text4" class="textfield" value="야행관(1)" /><label for="table1_text4"></label></td></tr>
									<tr><th scope="row">방사장명</th><td><input name="textfield" type="text" id="table1_text5" class="textfield" value="방사장1" /><label for="table1_text5"></label></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
									<tr><th scope="row"></th><td></td></tr>
							   </tbody>
							</table>
							<!-- //상세정보-->
							
						</div>
						<!-- //상세정보표-->
						<!-- 종 정보-->
					<div class="aniinfo_add_box deptinfo_position">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="../images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="../images/btn_minus.gif" alt=""></a>종 정보</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" class="cha_btn layer_open">수정</a></span>
							</div>
						</div>
						<table class="aniinfo_add table_view2" >
							<caption>종 정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:30%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">동물사명</th>
									<th scope="col" id="th03">부서명</th>
									<th scope="col" id="th04">관리팀</th>
									<th scope="col" id="th05">방사장명</th>
									<th scope="col" id="th06">관리종</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01" headers="th01">1</th>
									<td headers="n01 th02">야행관</td>
									<td headers="n01 th03">동물복지1과</td>
									<td headers="n01 th04">복지1팀</td>
									<td headers="n01 th05">방사장1</td>
									<td headers="n01 th06">타조</td>
								</tr>
								<tr>
									<th scope="row" id="n02" headers="th01">2</th>
									<td headers="n02 th02">야행관</td>
									<td headers="n02 th03">동물복지1과</td>
									<td headers="n02 th04">복지1팀</td>
									<td headers="n02 th05">방사장1</td>
									<td headers="n02 th06">타조</td>
								</tr>
							</tbody>
						</table>
					
					</div>
						
					<!-- //종 정보-->
					</div>
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
<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer01 -->
		<div class="layer_box" id="layer01" style="width:840px;">
			<div class="layer_tit">종 정보</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="search_table" style="width:800px;" >
							<caption>분류구분 조회</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                                <th scope="row">분류구분</th>
                                <td>
                                <p>
                                  <label><input type="radio" name="list" value="A" class="search_radio" />강</label>
                                  <label><input type="radio" name="list" value="B" class="search_radio"/>목</label>
								  <label><input type="radio" name="list" value="c" class="search_radio"/>과</label>
								  <label><input type="radio" name="list" value="c" class="search_radio"/>종</label>
                                </p>
                                </td>
                            </tr>
                            <tr><th scope="row">분류명칭</th><td><input name="textfield" type="text" id="seach_text2" class="textfield" style="width:90%"/><label for="seach_text2"></label></td></tr>
							<tr><th colspan="2" scope="col" class="search_btn_area"><a href="#" class="search_btn">조회</a></th></tr>
                            </tbody>
                        </table>
					</div>
					<div class="table_box">
						<table class="aniinfo_add" style="width:800px; margin-top:20px;" >
							<caption>종 정보</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:22%;">
								<col style="width:22%;">
								<col style="width:22%;">
								<col style="width:22%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="th01_1">No</th>
									<th scope="col" id="th02_1">강</th>
									<th scope="col" id="th03_1">목</th>
									<th scope="col" id="th04_1">과</th>
									<th scope="col" id="th05_1">종</th>
									<th scope="col" id="th06_1">선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="n01_1" headers="th01_1">1</th>
									<td headers="n01_1 th02_1">조강</td>
									<td headers="n01_1 th03_1">타조목</td>
									<td headers="n01_1 th04_1">타조과</td>
									<td headers="n01_1 th05_1">타조</td>
									<td headers="n01_1 th06_1"><input type="checkbox" id="sel_chk"><label for="sel_chk"></label></td>
								</tr>
								<tr>
									<th scope="row" id="n02_1" headers="th01_1">2</th>
									<td headers="n02_1 th02_1">조강</td>
									<td headers="n02_1 th03_1">타조목</td>
									<td headers="n02_1 th04_1">레아과</td>
									<td headers="n02_1 th05_1">레아</td>
									<td headers="n02_1 th06_1"><input type="checkbox" id="sel_chk2"><label for="sel_chk2"></label></td>
								</tr>
								<tr>
									<th scope="row" id="n03_1" headers="th01_1">3</th>
									<td headers="n03_1 th02_1">조강</td>
									<td headers="n03_1 th03_1">타조목</td>
									<td headers="n03_1 th04_1">사다새목</td>
									<td headers="n03_1 th05_1">사다새과</td>
									<td headers="n03_1 th06_1"><input type="checkbox" id="sel_chk3"><label for="sel_chk3"></label></td>
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
						<a href="#none" class="popent_btn btn_type2">확인</a>
						<a href="#none" class="popcancel_btn btn_type2">취소</a>
					</div>
				</div>
				<a href="#none" class="layer_close">레이어팝업 닫기</a>
		</div>		
		<!-- //#layer01-->
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
