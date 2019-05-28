<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<script src="/js/html5shiv.js"></script>
<link rel="stylesheet" href="/css/ui/reset.css">
<link rel="stylesheet" href="/css/ui/sub_layout.css">
<link rel="stylesheet" href="/css/base/jquery.ui.timepicker.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="/css/base/contents.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> <!-- 달력 css-->
<script src="/js/jquery-1.7.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  <!-- 달력 스크립트-->
<script type="text/javascript" src="/js/contents/base.js"></script>
<script type="text/javascript" src="/js/contents/cal.js"></script>
<script src="/js/common/common.js"></script> 
<script src="/js/common/json2.js"></script>
<script src='/js/common/jquery.ui.timepicker.js'></script>

<script>

function fn_layer_show() {
	$("#layer01").show();
	$(".layer_popup").show();
	var width_size = $("#layer01").innerWidth()/2;
	$("#layer01").css("margin-left",-width_size);
}

function fn_layer_hide() {
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y", "auto");
	
	$("#sch_tbody #codeSearch").val("");
	$("#sch_tbody #schKeyword").val("");
	$("#sch_tbody #selbox").val("");
	$("input:radio[name='pyeType']:radio[value='All']").attr("checked",true);
	fc_clearRow("schRst_tbody");
}

$(function() {
	$('#bdate').datetimepicker({
		controlType: 'select',
		oneLine: true,
		timeFormat: 'hh:mm'
	});
});

function goBack() {
    window.history.back();
}	

$(document).ready(function() {
	if(fn_is_pms_upd(0303)){
		$(".popent_btn btn_type2").css("display","");
		$(".popcancel_btn btn_type2").css("display","");
	}
});
</script>

<title>동물사육 &gt; 번식보고서</title>
</head>
<body>
<div id="sub_wrap">
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
                    <p class="contents_title">번식보고서</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물사육</li>
                        <li>> 번식보고서</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
				<!-- contents-->
				<div class="contents_table">
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">문서정보</p>
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
									<th scope="row">작성자</th><td>${sessionScope['ss_gha_username']}</td>
									<th scope="row">부서</th><td>${sessionScope['ss_gha_dptname']}</td>
								</tr>
						   </tbody>
						</table>

					</div>
					<!-- //문서정보-->
					
					<!-- 동물정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">동물정보</p>
						</div>
						<table class="aniinfo_search table_view3" >
							<caption>동물정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">동물명(종)</th><td>
									<input type="text" id="aname" name="aname"> 
									&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" class="copy_btn" onclick="javascript:fn_layer_show();">검색</a></td>
									<th scope="row">동물사</th><td><div class="select_box">			
											<select name="selbox" id="selbox">
											<option value="1" selected="selected">--선택--</option>
											<option value="2">박제실</option>
											<option value="3">사료실</option>
											<option value="4">곤충관</option>
											<option value="5">동물교실</option>
											<option value="6">나비온실</option>
											<option value="7">돌고래쇼장</option>
											<option value="8">해양관</option>
											<option value="9">홍학사</option>
											<option value="10">동물한마당</option>
											<option value="11">동물농장</option>
											<option value="12">열대조류관</option>
											<option value="13">큰물새장</option>
											<option value="14">황새마을</option>
											<option value="15">맹금사</option>
											<option value="16">공작마을</option>
											<option value="17">사슴사</option>
											<option value="18">제1AF관</option>
											<option value="19">제2AF관</option>
											<option value="20">동양관</option>
											<option value="21">낙타사</option>
											<option value="22">여우사</option>
											<option value="23">맹수사</option>
											<option value="24">우리숲우리동물관</option>
											<option value="25">곰사</option>
											<option value="26">남미관</option>
											<option value="27">종보전교육관</option>
											<option value="28">들소사</option>
											<option value="29">번식장</option>
											<option value="30">가금사</option>
											<option value="31">동물병원</option>
											<option value="32">꼬마동물사</option>
											</select>
										</div></td>
								</tr>
								<tr>
									<th scope="row">번식일시</th><td colspan="3">
									<input type="text" name="bdate" id="bdate"/>			
									</td>
								</tr>
								<tr>
									<th scope="row">마리수(수)</th><td><input type="number" id="bmari" name="bmari"></td>
									<th scope="row">마리수(암)</th><td><input type="number" id="gmari" name="gmari"></td>
								</tr>
								<tr>
									<th scope="row">사산수(수)</th><td><input type="number" id="bdead" name="bdead"></td>
									<th scope="row">사산수(암)</th><td><input type="number" id="gdead" name="gdead"></td>
								</tr>
								<tr>
									<th scope="row">건강상태</th><td colspan="3"><input type="text"></td>
									
								</tr>
						   </tbody>
						</table>
						
					</div>
					<!-- //동물정보-->
					
					<!-- 부모정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">부모정보</p>
						</div>
						<table class="aniinfo_add table_view4" >
							<caption>부모정보</caption>
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
									<th scope="col" id="t4th01">구분</th>
									<th scope="col" id="t4th02">동물번호</th>
									<th scope="col" id="t4th03">동물명</th>
									<th scope="col" id="t4th04">동물사</th>
									<th scope="col" id="t4th05">인식번호</th>
									<th scope="col" id="t4th06">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t4n01" headers="t4th01">부</th>
									<td headers="t4n01 t4th02">${burnInfo.BBR_FTHANICODE }</td>
									<td headers="t4n01 t4th03"></td>
									<td headers="t4n01 t4th04"></td>
									<td headers="t4n01 t4th05"></td>
									<td headers="t4n01 t4th06"></td>
								</tr>
								<tr>
									<th scope="row" id="t4n02" headers="t4th01">모</th>
									<td headers="t4n02 t4th02">${burnInfo.BBR_MTHANICODE }</td>
									<td headers="t4n02 t4th03"></td>
									<td headers="t4n02 t4th04"></td>
									<td headers="t4n02 t4th05"></td>
									<td headers="t4n02 t4th06"></td>
								</tr>
							</tbody>
						
						</table>
						
						<table class="aniinfo_add table_remove4" >
							<caption>부모정보</caption>
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
									<th scope="col" id="t4th01_1">구분</th>
									<th scope="col" id="t4th02_1">동물번호</th>
									<th scope="col" id="t4th03_1">동물명</th>
									<th scope="col" id="t4th04_1">동물사</th>
									<th scope="col" id="t4th05_1">인식번호</th>
									<th scope="col" id="t4th06_1">비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" id="t4n01_1" headers="t4th01_1">부</th>
									<td headers="t4n01_1 t4th02_1"><input name="textfield" type="text" id="table4_text1" class="textfield" value="B3-2-1-1" /><label for="table4_text1"></label></td>
									<td headers="t4n01_1 t4th03_1"><input name="textfield" type="text" id="table4_text2" class="textfield" value="황새부" /><label for="table4_text2"></label></td>
									<td headers="t4n01_1 t4th04_1"><input name="textfield" type="text" id="table4_text3" class="textfield" value="동물복지2과" /><label for="table4_text3"></label></td>
									<td headers="t4n01_1 t4th05_1"><input name="textfield" type="text" id="table4_text4" class="textfield" value="" /><label for="table4_text4"></label></td>
									<td headers="t4n01_1 t4th06_1"><input name="textfield" type="text" id="table4_text5" class="textfield" value="" /><label for="table4_text5"></label></td>
								</tr>
								<tr>
									<th scope="row" id="t4n02_1" headers="t4th01_1">모</th>
									<td headers="t4n02_1 t4th02_1"><input name="textfield" type="text" id="table4_text6" class="textfield" value="B3-2-1-1" /><label for="table4_text6"></label></td>
									<td headers="t4n02_1 t4th03_1"><input name="textfield" type="text" id="table4_text7" class="textfield" value="황새모" /><label for="table4_text7"></label></td>
									<td headers="t4n02_1 t4th04_1"><input name="textfield" type="text" id="table4_text8" class="textfield" value="동물복지2과" /><label for="table4_text8"></label></td>
									<td headers="t4n02_1 t4th05_1"><input name="textfield" type="text" id="table4_text9" class="textfield" value="" /><label for="table4_text9"></label></td>
									<td headers="t4n02_1 t4th06_1"><input name="textfield" type="text" id="table4_text10" class="textfield" value="" /><label for="table4_text10"></label></td>
								</tr>
							</tbody>
						</table>
						
					</div>
					<!-- //부모정보 -->
					
					<!-- 향후계획 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">향후계획</p>
						</div>
						
						<div class="plan_box table_view5">
							<p class="plan_text"><textarea rows="3" name="contents" style="width:100%; border: 0; resize: none; padding:0;"></textarea></p>
						</div>
					</div>
					<!-- //향후계획 -->
					
					<div class="btn_area">	
						<input type="button" value="저장" class="popent_btn btn_type2">
						<input type="button" onclick="goBack()" value="목록" class="popcancel_btn btn_type2">
						<input type="button" value="삭제" class="popcancel_btn btn_type2">
					</div>
				</div>
				<!-- //contents-->
			</section>
			<!-- //right-->
		</div>

	<!-- layer_popup -->
	<div class="layer_popup">	
		<div class="dimm"></div>
		<!-- #layer01 -->
		<div class="layer_box" id="layer01" style="width:1020px; top: 80px; height: 650px;overflow:auto;">
			<div class="layer_tit">동물검색</div>
				<div class="layer_con">
					 <table class="aniinfo_search" >
							<caption>동물정보조회</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:40%;">
								<col style="width:10%;">
								<col style="width:40%;">
							</colgroup>
                            <tbody id="sch_tbody">
								<tr><th scope="row">동물번호</th>
									<td><input name="codeSearch" type="text" id="codeSearch" class="textfield" style="width:90%"/></td>
									<th scope="row">동물사</th>
									<td>
										<div class="select_box">			
											<select name="selbox" id="selbox">
												<option value="">-- 출생 동물사 선택 --</option>
												<c:forEach var="vvrmList" items="${vvrmList }" varStatus="st" >
												<option value="${vvrmList.MVI_VVRMNO}">${vvrmList.MVI_VVRMNAME }</option>
												</c:forEach>
											</select>
										</div>
									</td>
								</tr>
								<tr><th scope="row">동물명</th>
									<td>
									<input name="schKeyword" type="text" id="schKeyword" class="textfield" style="width:90%"/>
									</td>
									<th scope="row">폐사구분</th>
									<td>
										<p>
										  <label><input type="radio" id="pyeType" name="pyeType" value="All" class="search_radio" checked="checked"/>전체</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Alive" class="search_radio"/>생존</label>
										  <label><input type="radio" id="pyeType" name="pyeType" value="Death" class="search_radio"/>폐사</label>
										</p>
									</td>
								</tr>
								<tr>
								<tr><th colspan="4" scope="col" class="search_btn_area"><a href="javascript:fn_base_search();" class="search_btn">조회</a></th></tr>
						   </tbody>
						</table>
						
						<!-- 동물정보추가-->
					<div class="aniinfo_add_box">					
						<table class="aniinfo_add" >
						<caption>동물정보내역</caption>
							<colgroup>
								<col style="width:2%;">
								<col style="width:10%;">
								<col style="width:3%;">
								<col style="width:7%;">
								<col style="width:8%;">
								<col style="width:5%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" id="num">No</th>
									<th scope="col" id="ani_name">동물명</th>
									<th scope="col" id="ani_sex">성별</th>
									<th scope="col" id="ani_num">동물번호</th>
									<th scope="col" id="ani_vvrm">동물사</th>			
									<th scope="col" id="ani_status">상태</th>					
								</tr>
							</thead>
							<tbody id="schRst_tbody">
								<tr style="display:none">
								<th><div id="INDEX_DIV" data-val=''></div></th>
								<td><div id="MAC_NAME_DIV" onclick="javascript:animal_select($(this).attr('data-val'));"></div></td>
								<td><div id="ANIMAL_GENDER_DIV" data-val=''></div></td>
								<td><div id="ANIMAL_NUMBER_DIV" data-val=''></div></td>
								<td><div id="VVRMNAME_DIV" data-val=''></div></td>
								<td><div id="RegType_DIV" data-val=''></div></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보추가-->
			</div>
			<a href="javascript:;" class="layer_close" onclick="javascript:fn_layer_hide();">레이어팝업 닫기</a>
		</div>		
	<!-- //#layer01 -->	
	</div>
	<!-- // layer_popup -->


	</div>
	<!-- //container -->
	<!-- footer -->
	<div id="footer_wrap">
<jsp:include page="/footer.do"></jsp:include>
	<!-- //footer -->
</div>
</body>
</html>
