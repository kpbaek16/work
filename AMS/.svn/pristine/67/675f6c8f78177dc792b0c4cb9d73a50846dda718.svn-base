<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="/css/jquery/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="/js/jquery/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/html5shiv.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>

<script>
$(document).ready(function() {
	if("0501::MUP_UPDLVL::" + fn_is_pms_upd("0501"))
	{
		$(".add_btn").css("display","");
		$(".save_btn").css("display","");
		$(".cancel_btn").css("display","");
		$(".cha_btn").css("display","");
		/* $(".popent_btn btn_type2").css("display","");
		$(".popcancel_btn btn_type2").css("display",""); */
		$("#testa").css("display", "");
		$("#testb").css("display", "");
		$("#testc").css("display", "");
	}
	});
	
$('#cal_2').css('visibility', 'visible' ); 

function goBack() {
    window.history.back();
}	
</script>

<title>병리방역 &gt; 부검결과서</title>
</head>
<body>
<div id="sub_wrap">

	<!-- header -->
    <div id="header_wrap">
		<jsp:include page="/header.do"></jsp:include>
	</div>
	<!-- //header -->
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<div id="lnb_area">
		<jsp:include page="/lnb.do"></jsp:include>
			</div>
			<!-- //left-->
			
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">부검결과서</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 병리방역</li>
                        <li>> 부검결과서</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<!-- 결재 -->
					<div class="aniinfo_add_box" style="margin-top:0px;">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>결재</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide">
								<a href="#layer01" class="add_btn">수정</a></span>
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
					<!-- //결재 -->
					
					<!-- 문서정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="#"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>문서정보</span>
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
									<th scope="row">문서번호</th><td colspan="3">${bukumDoc.PBR_DOCNO }</td>
								</tr>
								<tr>
									<th scope="row">작성자</th><td>${bukumDoc.MUI_NAME }</td>
									<th scope="row">부서</th><td>${bukumDoc.MTI_TEAMNAME }</td>
								</tr>
								<tr>
									<th scope="row">구분</th><td>부검결과서</td>
									<th scope="row">작성일</th><td>${bukumDoc.PBR_BUDATE }</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보 -->
					
					<!-- 기본정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>기본정보</span>
						</div>
						<table class="aniinfo_search table_view3" >
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">부검일</th><td><input type="text" class="calendar1" id="cal_2" name="cal_2" value="${basicDoc.PBR_BUDATE }"></td>
									<th scope="row">폐사보고서</th><td>${basicDoc.PBR_REQDOCNO }</td>
								</tr>
								<tr>
									<th scope="row">동물명</th><td>${basicDoc.MAC_NAME }</td>
									<th scope="row">동물번호</th><td>${basicDoc.MAI_ANICODE }</td>
								</tr>
								<tr>
									<th scope="row">동물사</th><td>${basicDoc.MVI_VVRMNAME }</td>
									<th scope="row">성별</th><td>${basicDoc.MAI_GENDER }</td>
								</tr>
								<tr>
									<th scope="row">체중</th><td><input type="number" id="weight" name="weight" value="${basicDoc.PBR_WEIGHT }"> Kg</td>
									<th scope="row">나이</th><td>${basicDoc.ONE }년 ${basicDoc.TWO }개월</td>
								</tr>
								
						   </tbody>
						</table>
					</div>
					<!-- //기본정보 -->
					
					<!-- 부검결과 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>부검결과</span>
						</div>
						</div>
						<table class="aniinfo_search table_view4" >
							<caption>부검결과</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:30%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row" colspan="2">병리진단명</th><td><input type="text" value="${bukumRpt.PBR_BUDZZNAME }" class="textfield"></td>
									<th scope="row">폐체처리</th><td><div class="select_box">			
										<select name="regselbox" id="regselbox">
											<option value="1" ${bukumRpt.PBR_DETHBDYPRC  == "소각" ? "SELECTED" : ""}>소각</option>
											<option value="2" ${bukumRpt.PBR_DETHBDYPRC  == "기증" ? "SELECTED" : ""}>기증</option>
											<option value="3" ${bukumRpt.PBR_DETHBDYPRC  == "박제" ? "SELECTED" : ""}>박제</option>
										</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" colspan="2">폐체상태</th><td colspan="3"><input type="text" value="${bukumRpt.PBR_PCSTS }" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row" colspan="2">주요부검소견</th><td colspan="3"><input type="text" value="${bukumRpt.PBR_CMNT }" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row" colspan="2">병리검사결과</th><td colspan="3"><input type="text" value="${bukumRpt.PBR_KSRESLT }" class="textfield"></td>
								</tr>
								<tr>
									<th scope="rowgroup" rowspan="3" style="vertical-align:middle;">폐사원인</th>
									<th>직접사인</th><td colspan="3"><input type="text" value="${bukumRpt.PBR_PS_DIR }" class="textfield"></td>
								</tr>
								<tr>
									<th>선행사인</th><td colspan="3"><input type="text" value="${bukumRpt.PBR_PS_PRE }" class="textfield"></td>
								</tr>
								<tr>
									<th>기타사항</th><td colspan="3"><input type="text" value="${bukumRpt.PBR_PS_ETC }" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row" colspan="2">폐체 원인별 구분</th><td colspan="3"><input type="text" value="${bukumRpt.PBR_DZZTYPE }" class="textfield"></td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //부검결과 -->
					
					<!-- 부검사진 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="btn_minus5"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus5"><img src="/images/btn_minus.gif" alt=""></a>부검사진</span>
							<div class="sys_btn_box">
								<span class="align_right"><a href="#" style="display: none" class="add_btn">수정</a></span>
								<span class="sys_btn_area5"><a href="#" class="save_btn">저장</a><a href="#" class="cancel_btn">취소</a></span>
							</div>
						</div>
						<table class="aniinfo_search table_view5">
							<caption>부검사진</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">								
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
								</tr>
							</thead>
                            <tbody>
								<tr>
									<td>간단한설명</td>
									<td>간단한설명</td>
									<td>간단한설명</td>
									<td>간단한설명</td>
									<td>간단한설명</td>
								</tr>
						   </tbody>
						</table>
						<table class="aniinfo_search table_remove5">
							<caption>부검사진</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">
								<col style="width:20%;">								
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
									<th scope="col"><img src="/images/bird.jpg" alt="새"></th>
								</tr>
							</thead>
                            <tbody style="padding:0;">
								<tr>
									<td>
										<textarea rows="4" cols="20" name="contents" style="width:100%; border: 0; resize: none; padding:0;">간단한설명</textarea>
									</td>
									<td>
										<textarea rows="4" cols="20" name="contents" style="width:100%; border: 0; resize: none;padding:0;">간단한설명</textarea>
									</td>
									<td>
										<textarea rows="4" cols="20" name="contents" style="width:100%; border: 0; resize: none;padding:0;">간단한설명</textarea>
									</td>
									<td>
										<textarea rows="4" cols="20" name="contents" style="width:100%; border: 0; resize: none;padding:0;">간단한설명</textarea>
									</td>
									<td>
										<textarea rows="4" cols="20" name="contents" style="width:100%; border: 0; resize: none;padding:0;">간단한설명</textarea>
									</td>
								</tr>
						   </tbody>
						</table>
						
					</div>
					<!-- //부검사진 -->
					
					<div class="btn_area">
						<button style="display: none;" id="testa" class="popent_btn btn_type2">저장</button>
						<button style="display: none;" id="testb" class="popcancel_btn btn_type2">목록</button>
						<button style="display: none;" id="testc" class="popcancel_btn btn_type2">삭제</button>
					</div>
					</section>
				</div>
				<!-- //contents-->
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
	<div id="footer_wrap">
			<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
</body>
</html>