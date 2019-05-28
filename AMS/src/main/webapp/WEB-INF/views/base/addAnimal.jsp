<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>

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
<script src="/js/common/common.js"></script>
<script src="/js/common/fileupload.js"></script>

<script type="text/javascript">

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

function prc_Save() {
    var form = document.animalAddForm;
    
    // 등록구분
    if (form.regSelbox.value == "") {
        alert("등록구분을 선택하여 주십시오.");
        form.regSelbox.focus();
        return;
    }
    
    // 현재상태
    if (form.stsSelbox.value == "") {
    	alert("현재상태를 선택하여 주십시오.");
    	form.stsSelbox.focus();
        return;
    }
    
    // 관리부서
    if (form.dptSelbox.value == "") {
    	alert("관리팀을 선택하여 주십시오.");
    	form.dptSelbox.focus();
        return;
    }
    
 	// 동물사
    if (form.vvrmSelbox.value == "") {
    	alert("동물사를 선택하여 주십시오.");
    	form.vvrmSelbox.focus();
        return;
    }
 	
 	// 생년월일
 	if (form.cal_1.value == "") {
    	alert("생년월일을 선택하여 주십시오.");
    	form.cal_1.focus();
        return;
    }
 	
 	if (confirm("해당동물을 저장 하시겠습니까 ?")) {
        form.action = "/base/0107/AniInfoAdd_Save.do";
        form.submit();
    } 
    
}

function chkOn1(){
	var chk1= $("input:checkbox[id='chk1']").is(":checked"); 
	
	if(!chk1){
	    $('#chip').css("display","none");
	}else{
		$('#chip').css('display', '' ); 
	}
}

function chkOn2(){
	var chk2= $("input:checkbox[id='chk2']").is(":checked"); 
	
	if(!chk2){
	     $('#ear').css("display","none");
	}else{
		$('#ear').css('display', '' ); 
	}
}

function chkOn3(){
	var chk3= $("input:checkbox[id='chk3']").is(":checked"); 
	
	if(!chk3){
		$('#ring').css("display","none");
	}else{
		$('#ring').css('display', '' );
	}
}

function tmpCheckFnc(){
	var chk= $("input:checkbox[id='tmpCheck']").is(":checked"); 
	
	if(!chk){
		$('#tmpSelbox').css("display","none");
	}else{
		$('#tmpSelbox').css("display","");
	}
	
}
</script>
<script src="/js/common/json2.js"></script>
<title>기본정보 &gt; 동물정보</title>
</head>
<body>
<div id="sub_wrap">

	<!-- header -->
    <div id="header_wrap">
		<header id="sub_header">
			<jsp:include page="/header.do"></jsp:include>
		</header>
	</div>
	<!-- //header -->
	
	<!-- container-->
	<div id="container">
		<div id="contents">
			<!-- left-->
			<div id="lnb_area">
				<jsp:include page="/lnb.do"></jsp:include>
				<!-- //lnb -->
			</div>
			<!-- //left-->
			<!-- right-->
			<section id="contents_area">
			<h2>본문내용</h2>
				<!-- contents_title-->
				<div class="title_area">
                    <p class="contents_title">동물정보 추가</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 기본정보</li>
                        <li>> 동물정보</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				
				<!-- contents-->
				<div class="contents_table">
				<form method="POST" name="animalAddForm" id="animalAddForm">
				<input type="hidden" id="newAniCode" name="newAniCode" value="${MAX }" />
					<!-- 그룹정보-->
					<div class="aniinfo_search_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="#"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus"><img src="/images/btn_minus.gif" alt=""></a>그룹정보</span>
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
									<th scope="row">동물명</th><td>${aniInfo.MAC_NAME }</td>
									<th scope="row">영명</th><td>${aniInfo.MAC_ENAME }</td>
								</tr>
								<tr>
									<th scope="row">동물그룹명</th><td>${aniInfo.MAC_ANICLSCODE}</td>
									<th scope="row">학명</th><td style="font-style: italic;">${aniInfo.MAC_SNAME }</td>
								</tr>
								<tr>
									<th scope="row">CITES</th><td>${aniInfo.MAC_CITES }</td>
									<th scope="row">천연기념물</th><td>${aniInfo.MAC_NATMON }</td>
								</tr>
								<tr>
									<th scope="row">멸종위기</th><td>${aniInfo.MAC_ENDANG }</td>
									<th scope="row">전략종</th><td>데이터 미정</td>
								</tr>
								<tr>
									<th scope="row">등급</th><td>${aniInfo.MAC_RANK }</td>
									<th scope="row">원산지</th><td>${aniInfo.MAC_ORGPLACE }</td>
								</tr>
								<tr>
									<th scope="row">군집구분</th>
									<td>${aniInfo.MAI_KNJPTYPE } 
									 <c:if test="${aniInfo.MAI_KNJPTYPE == '군집'}">
									<a href="#" class="save_btn" onclick="go_gunzip()">보기</a>
									</c:if> 
									</td>
									
									<th scope="row">군집 개체수</th><td>${aniInfo.MAI_KNJPCNTD }</td>
								</tr>
								<tr>
									<th scope="row">평균수명(사육)</th><td>데이터 미정</td>
									<th scope="row">평균수명(야생)</th><td>데이터 미정</td>
								</tr>
								<tr>
								<th scope="row">임신기간</th><td>${aniInfo.MAC_GESTPERID } 개월</td>
								<th scope="row">임시동물 여부</th><td><input type="checkbox" id="tmpCheck" name="tmpCheck" onclick="javascript:tmpCheckFnc();"> &nbsp;&nbsp;&nbsp;
								<select id="tmpSelbox" name="tmpSelbox" style="display: none;"> 
								<option value="1">외부동물</option>
								<option value="2">검사관리 동물</option>
								</select>
								</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //그룹정보-->
					
					<!-- 기본정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="#"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>기본정보</span>
						</div>
						<table class="aniinfo_search table_view2" >
							<caption>기본정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                             <tbody>
								<tr>
									<th scope="row">등록구분</th>
									<td>
										<div class="select_box">			
										<select name="regSelbox" id="regSelbox">
											<option value="" selected="selected">-- 등록 구분 선택 --</option>
											<c:forEach var="gubunList" items="${gubunList}" varStatus="st">
												<option value="${gubunList.MCC_S_CODE}">${gubunList.MCC_S_NAME}</option>
											</c:forEach>
										</select>
										</div>
									</td><th scope="row">아명</th><td><input type="text" id="aname" name="aname" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row">별명</th><td><input type="text" id="bname" name="bname" class="textfield"></td>
									<th scope="row">교환대상 동물</th><td><input type="text" class="textfield" style="width: 60%" disabled="disabled" id="ani_trade" name="ani_trade">
									<a href="javascript:;" class="table_view_btn" onclick="fn_layer_show();" >보기</a></td>
								</tr>
								<tr>
									<th scope="row">현재 상태</th>
									<td>
										<div class="select_box">			
										<select name="stsSelbox" id="stsSelbox">
											<option value='' selected="selected">-- 현재 상태 선택 --</option>
											<c:forEach var="statusList" items="${statusList}" varStatus="st">
												<option value="${statusList.MCC_S_CODE}">${statusList.MCC_S_NAME}</option>
											</c:forEach>
										</select>
										</div>
									</td>
									<th scope="row">개체 인식 번호</th><td><input type="text" id="Insikno" name="Insikno" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row">관리부서(관리팀)</th>
									<td>
										<div class="select_box">			
										<select name="dptSelbox" id="dptSelbox">
											<option value='' selected="selected">-- 관리부서(관리팀) --</option>
											<c:forEach var="dptList" items="${dptList}" varStatus="st">
												<option value="${dptList.MTI_TEAMNO}">${dptList.MDI_DPTNAME} - ${dptList.MTI_TEAMNAME }</option>
											</c:forEach>
										</select>
										</div>
									</td>
									<th scope="row">동물사</th>
									<td>
										<div class="select_box">			
										<select name="vvrmSelbox" id="vvrmSelbox">
											<option value='' selected="selected">-- 동물사 선택 --</option>
											<c:forEach var="vvrmList" items="${vvrmList}" varStatus="st">
												<option value="${vvrmList.MVI_VVRMNO}">${vvrmList.MVI_VVRMNAME}</option>
											</c:forEach>
										</select>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">국내혈통번호</th><td><input type="text" id="nat" name="nat" class="textfield"></td>
									<th scope="row">국제혈통번호</th><td><input type="text" id="int" name="int" class="textfield"></td>
								</tr>
								<tr>
									<th scope="row">칩인식기</th>
										<td>
											<input type="checkbox" id="chk1" onclick="javascript:chkOn1();"> 
											<input type="text" id="chip" name="chip" class="textfield" style="width: 150px; display: none;">
											</td>
									<th scope="row">이표인식기</th>
										<td>
											<input type="checkbox" id="chk2" onclick="javascript:chkOn2();"> 
											<input type="text" id="ear" name="ear" class="textfield" style="width: 150px; display: none;">
											</td>
								</tr>
								<tr>
									<th scope="row">링인식기</th>
										<td>
											<input type="checkbox" id="chk3" onclick="javascript:chkOn3();"> 
											<input type="text" id="ring" name="ring" class="textfield" style="width: 150px; display: none;">
											</td>
									<th scope="row"></th><td></td>
								</tr>
								<tr>
									<th style="height:80px">특이사항</th>
									<td style="text-align:left" colspan="3">
									<textarea rows="4" cols="120" id="cmnt" name="cmnt"></textarea>
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //기본정보-->
					
					<!-- 출생정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">
							<a href="#" id="#"><img src="/images/btn_minus.gif" alt=""></a>
							<a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>출생정보</span>
						</div>
						<table class="aniinfo_search table_view3" >
							<caption>출생정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							 <tbody>
								<tr>
									<th scope="row">생년월일</th><td><input type="text" class="calendar3" id="cal_1"></td>
									<th scope="row">출생지</th><td><input type="text" id="BirthPlc" name="BirthPlc" class="textfield"/></td>
								</tr>
								<tr>
									<th scope="row">원수 등록 예정일</th>
									<td><input type="text" class="calendar3" id="cal_2">
									<th scope="row">출생동물사</th>
									<td>
									<!-- BirthVvrmNo -->
										<div class="select_box">			
										<select name="birthVSelbox" id="birthVSelbox">
											<option value='' selected="selected">-- 출생 동물사 선택 --</option>
											<c:forEach var="vvrmList" items="${vvrmList}" varStatus="st">
												<option value="${vvrmList.MVI_VVRMNO}">${vvrmList.MVI_VVRMNAME}</option>
											</c:forEach>
										</select>
										</div>									
									</td>
								</tr>
								<tr>
									<th scope="row">원수 등록일</th>
									<td><input type="text" class="calendar3" id="cal_3"></td>
									<th scope="row">성별</th>
									<td>
										<div class="select_box">			
										<select name="genderSelbox" id="genderSelbox">
											<option value='' selected="selected">-- 성별 선택 --</option>
											<c:forEach var="genderList" items="${genderList}" varStatus="st">
												<option value="${genderList.MCC_S_CODE}">${genderList.MCC_S_NAME}</option>
											</c:forEach>
										</select>
										</div>				
									</td>
								</tr>
								<tr>
									<th scope="row">부 동물</th>
									<td><input type="text" class="textfield" style="width: 60%" disabled="disabled" id="ani_ft" name="ani_ft">
									<a href="javascript:;" class="table_view_btn" onclick="fn_layer_show();">보기</a></td>
									<th scope="row">모 동물</th>
									<td><input type="text" class="textfield" style="width: 60%" disabled="disabled" id="ani_mt" name="ani_mt">
									<a href="javascript:;" class="table_view_btn" onclick="fn_layer_show();">보기</a></td>
								</tr>
								<tr>
									<th scope="row">출생타입</th>
									<td>
										<input type="radio" id="zoo" name="zoo" value="동물원" class="search_radio" checked="checked"/>동물원	
										<input type="radio" id="wild" name="wild" value="야생" class="search_radio"/>야생									
									</td>
									<th scope="row">잡종여부</th>
									<td>
										<input type="radio" id="origin" name="origin" value="순종" class="search_radio" checked="checked"/>순종		
										<input type="radio" id="hybrid" name="hybrid" value="잡종" class="search_radio"/>잡종 					
									</td>
								</tr>
								<tr>
									<th scope="row">양육형태</th>
									<td>
										<input type="radio" id="jayeon" name="jayeon" class="search_radio" value="자연포육" checked="checked"/>자연포육 	
										<input type="radio" id="ingong" name="ingong" class="search_radio" value="인공포육"/>인공포육						
									</td>
								</tr>
						   </tbody>
						</table>
					</div>	
					<!-- //출생정보-->
					
					<div class="btn_area_bottom">
						<a href="javascript:prc_Save();" class="save2_btn">저장</a>
						<a href="/base/0107/main.do" class="list_btn">목록</a>
					</div>
					</form>
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
		<!-- layer01 -->
	</div>
	<!-- //container -->
	
	<!-- footer -->
	<div id="footer_wrap">
		<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
</div>
</body>
</html>