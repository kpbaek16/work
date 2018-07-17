<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
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
<script src="/js/common/json2.js"></script>
<script type="text/javascript">
function fn_MSG(){
	var msg = document.getElementById('msg').value;
	if (msg != null && msg != "") {
		alert(msg);
	}
	document.getElementById('msg').value = "";
}
function pop_Close(){
	$(".layer_box").hide();
	$(".layer_popup").hide();
	$("body").css("overflow-y","auto");
}
function search_index(page, totalpage)
{
	if( page < 1 )
		page = 1;
	if( page > totalpage )
		page = totalpage;
	fn_treat_search(page);
}
function fn_treat_search(page)
{
	var ANI_NAME = document.getElementById('ANI_NAME').value;
	var ANI_CODE = document.getElementById('ANI_CODE').value;
	var SEXval = $("#selectSEX option:selected").val();
	var VVRMval = $("#selectVVRM option:selected").val();
	var Dethtype = $(':radio[name="Dethtype"]:checked').val();
	var sendData = "ANI_NAME=" + ANI_NAME + "&ANI_CODE=" + ANI_CODE + "&SEXval=" + SEXval + "&VVRMval=" + VVRMval + "&Dethtype=" + Dethtype + "&page=" + page;
	$.ajax({
		type : "POST",
		data : sendData,
		url : "/treat/0402/searchAni.do",
		success : function(html) {
			$("#NOTI_popAni").empty();
			$("#NOTI_popAni").append(html);
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});
}
function prc_Save() {
    var form = document.jinryoFrom;
    
    //
    if (form.JYADD_ANICODE.value == "") {
        alert("동물정보를 선택하여 주십시오.");
        return;
    }
    //
    if (form.selectKind.value == "") {
        alert("진료구분을 선택하여 주십시오.");
        form.selectKind.focus();
        return;
    }
    //
    if (form.JJRCMNT.value == "") {
        alert("증상을 입력하여 주십시오.");
        form.JJRCMNT.focus();
        return;
    }
    //
    if (confirm("접수정보를 저장 하시겠습니까 ?")) {
        form.action = "/treat/0402/CareRctModify_Save.do";
        form.submit();
    } 
}
function Ani_CHK(CODE, NAME, BNAME, VVRM, SEX, AGE) {
	var getNAME = '';
	if(BNAME != ''){
		getNAME = NAME + '(' + BNAME + ')';
	}
	else{
		getNAME = NAME;
	}
	document.getElementById('JYADD_ANICODE').value = CODE;
	document.getElementById('td_aniName').innerText = getNAME;
	document.getElementById('td_vvrm').innerText = VVRM;
	document.getElementById('td_sex').innerText = SEX;
	document.getElementById('td_age').innerText = AGE;
	pop_Close();
}
function prc_HsptlCnfm() {
    var form = document.jinryoFrom;

    if (confirm("접수내용을 확인 하시겠습니까 ?")) {
        form.action = "/treat/0402/CareRctModify_HsptlCnfm.do";
        form.submit();
    }
}
//////////////////////////////////////////
function prc_Del() {
    var form = document.jinryoFrom;

    if (document.getElementById("JRNO").value == "" || document.getElementById("JRNO").value == null) {
        if (confirm("접수정보를 삭제 하시겠습니까 ?")) {
            form.action = "/treat/0402/CareRctModify_Delete.do";
            form.submit();
        }
    }
    else {
        alert("진료일지를 먼저 삭제해 주세요!");
    }
}
function prc_popup_on(num){
		$('.table_view' + num).hide();
		$('.cha_btn_sys' + num).hide();
		$('.sys_btn_area' + num).show();
		$('.table_remove' + num).show();
}
function prc_popup_off(num){
		$('.table_view' + num).show();
		$('.cha_btn_sys' + num).show();
		$('.sys_btn_area' + num).hide();
		$('.table_remove' + num).hide();
}
$(document).ready(function() {
	fn_MSG();
}); 
</script>
<title>동물진료 &gt; 진료요청/접수</title>
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
                    <p class="contents_title">진료요청/접수</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물진료</li>
                        <li>> 진료요청/접수</li>
                        <li>> 상세내용</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="jinryoFrom" id="jinryoFrom">
					<input type="hidden" id="JYADD_ANICODE" name="JYADD_ANICODE" value="${AniINFO.MAI_ANICODE}" />
					<input type="hidden" id="DOCNO" name="DOCNO" value="${JJRInfo.JJR_DOCNO}" />
					<input type="hidden" id="JRNO" name="JRNO" value="${JJRInfo.JJR_JRNO}" />
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus3"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus3"><img src="/images/btn_minus.gif" alt=""></a>문서정보</span>
						</div>
						<table class="aniinfo_search table_view3" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">접수번호</th><td>${JJRInfo.JJR_DOCNO}</td>
									<th scope="row">접수확인</th>
									<td>
										<c:if test="${JJRInfo.JJR_RCSTS != ''}">
											<c:forEach var="Statuslist" items="${Statuslist}" varStatus="st">
											<c:if test="${JJRInfo.JJR_RCSTS == Statuslist.MCC_S_CODE}">
												${Statuslist.MCC_S_NAME}
											</c:if>
											</c:forEach>
										</c:if>
									</td>
								</tr>
								<tr>
									<th scope="row">작성자</th>
									<td>${JJRInfo.MUI_NAME}</td>
									<th scope="row">부서</th>
									<td>${JJRInfo.DPTINFO}</td>
								</tr>
								<tr>
									<th scope="row">진료번호</th><td>${JJRInfo.JJR_JRNO}</td>
									<th scope="row">작성일</th><td>${JJRInfo.JJR_RCDATE}</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보-->
					<!-- 동물정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus4"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus4"><img src="/images/btn_minus.gif" alt=""></a>동물정보</span>
							<c:if test="${PMS0402 == 'Y'}">
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" class="cha_btn layer_open">수정</a></span>
							</div>
							</c:if>
						</div>
						<table class="aniinfo_search table_view4" >
							<caption>동물정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">동물명</th>
									<td id = "td_aniName">
										<c:if test="${AniINFO.MAI_BNAME != ''}">
											${AniINFO.MAC_NAME}(${AniINFO.MAI_BNAME})
										</c:if>
										<c:if test="${AniINFO.MAI_BNAME == ''}">
											${AniINFO.MAC_NAME}
										</c:if>
									</td>
									<th scope="row">동물사</th>
									<td id = "td_vvrm">
										${AniINFO.VVRMNAME}
									</td>
								</tr>
								<tr>
									<th scope="row">성별</th>
									<td id = "td_sex">
										${AniINFO.SEXNAME}
									</td>
									<th scope="row">나이</th>
									<td id = "td_age">
										${AniINFO.CURAGE}
									</td>
								</tr>
						   </tbody>
						</table>

					</div>
					<!-- //동물정보 -->
					<!-- 진료구분/증상 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus5"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus5"><img src="/images/btn_minus.gif" alt=""></a>진료구분/증상</span>
							<c:if test="${PMS0402 == 'Y'}">
							<div class="sys_btn_box">
								<span class="align_right"><a href="javascript:prc_popup_on('5');" class="cha_btn">수정</a></span>
								<span class="sys_btn_area5"><a href="javascript:prc_popup_off('5');" class="cancel_btn">취소</a></span>
							</div>
							</c:if>
						</div>
						<table class="aniinfo_search table_view5" >
							<caption>진료구분/증상</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:85%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">진료구분</th>
									<td>
										<c:forEach var="KindList" items="${KindList}" varStatus="st">
											<c:if test="${JJRInfo.JJR_JRTYPE == KindList.MCC_S_CODE}">
												${KindList.MCC_S_NAME}
											</c:if>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row">증상</th><td>${JJRInfo.JJR_CMNT}</td>
								</tr>
						   </tbody>
						</table>

						<table class="aniinfo_search table_remove5" >
							<caption>진료구분/증상</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">진료구분</th>
									<td>
                                		<select name="selectKind" id="selectKind">
											<option value="">-- 접수 진료구분 선택--</option>
											<c:forEach var="KindList" items="${KindList}" varStatus="st">
												<option value="${KindList.MCC_S_CODE}" <c:if test="${JJRInfo.JJR_JRTYPE == KindList.MCC_S_CODE}">selected="selected"</c:if>>${KindList.MCC_S_NAME}</option>
											</c:forEach>
										</select>	
									</td>
								</tr>
								<tr>
									<th scope="row" style="vertical-align: middle;">증상</th>
									<td>
										<textarea rows="3" id="JJRCMNT" name="JJRCMNT" style="width:98%; border: 0; resize: none; padding:10px 5px; font-size:13px; color:#555; line-height:20px; text-align:left;">${JJRInfo.JJR_CMNT}</textarea>
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //진료구분/증상 -->
					<div class="table_title_box" style= "margin-top: 20px;">
						<div class="sys_btn_box">
							<c:if test="${PMS0403 == 'Y'}">
							<c:if test="${JJRInfo.JJR_RCSTS == 0 and JJRInfo.JJR_DOCNO != ''}">
								<a href="javascript:prc_HsptlCnfm();" class="save_btn" style="width: 80px;margin-left:10px">병원확인</a>
							</c:if>
							</c:if>
							<c:if test="${PMS0402 == 'Y'}">
							<c:if test="${JJRInfo.JJR_DOCNO != ''}">
								<a href="javascript:prc_Del();" class="save_btn" style="width: 80px;margin-left:10px;border:solid 1px #FF0000;background:#F15F5F;color:#fff !important;">삭제</a>
							</c:if>
							<a href="javascript:prc_Save();" class="cancel_btn" style="width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">저장</a>
							</c:if>
							<a href="/treat/0402/JINRYO_RCT_INFO.do" class="cancel_btn" style="width: 80px">목록</a>
						</div>
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
		<div class="layer_box" id="layer01" style="width:800px;overflow-y:scroll;height:600px;">
			<div class="layer_tit">동물 검색</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search" style="width:760px;" >
							<caption>동물목록</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                            	<th scope="row">동물명</th>
                            	<td>
                            		<input name="ANI_NAME" type="text" id="ANI_NAME" class="textfield"/>
                            		<label for="ANI_NAME"></label>
                            	</td>
                            </tr>
                            <tr>
                            	<th scope="row">동물번호</th>
                            	<td>
                            		<input name="ANI_CODE" type="text" id="ANI_CODE" class="textfield"/>
                            		<label for="ANI_CODE"></label>
                            	</td>
                            </tr>
                            <tr>
                            	<th scope="row">동물성별</th>
                            	<td>
                                	<select name="selectSEX" id="selectSEX">
										<option value="" selected="selected">전체</option>
										<c:forEach var="SEXList" items="${SEXList}" varStatus="st">
											<option value="${SEXList.MCC_S_CODE}">${SEXList.MCC_S_NAME}</option>
										</c:forEach>
									</select>
                            	</td>
                            </tr>
                            <tr>
                                <th scope="row">동물사</th>
                            	<td>
                                	<select name="selectVVRM" id="selectVVRM">
										<option value="" selected="selected">전체</option>
										<c:forEach var="VVRMList" items="${VVRMList}" varStatus="st">
											<option value="${VVRMList.MVI_VVRMNO}">${VVRMList.MVI_VVRMNAME}</option>
										</c:forEach>
									</select>
                            	</td>
                            </tr>
                            <tr>
                            	<th scope="row">폐사구분</th>
								<td>
									<p>
										<label><input type="radio" name="Dethtype" value="0" class="search_radio type1" checked="checked"/>전체</label>
										<label><input type="radio" name="Dethtype" value="1" class="search_radio type1"/>생존</label>
										<label><input type="radio" name="Dethtype" value="2" class="search_radio type1"/>폐사</label>
									</p>
								</td>
                            </tr>
							<tr>
								<th colspan="2" scope="col" class="search_btn_area">
									<a href="javascript:fn_treat_search('1');" class="search_btn">조회</a>
								</th>
							</tr>
                            </tbody>
                        </table>
					</div>
					<div id='NOTI_popAni'>
					<div class="table_box">
						<table class="aniinfo_search" style="width:760px; margin-top:20px;" >
							<caption>동물정보</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:10%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">No</th>
									<th scope="col">동물번호</th>
									<th scope="col">동물종명(별명)</th>
									<th scope="col">영명</th>
									<th scope="col">학명</th>
									<th scope="col">동물사</th>
									<th scope="col">성별</th>
									<th scope="col">나이</th>
									<th scope="col">폐사구분</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>

					<!-- pagination -->
					<div class="pagination">
					<a href="javascript:search_index('1','1');" class="page first"></a>
					<a href="javascript:search_index('1','1');" class="page prev"></a>
					<a href="#" class="on">1</a>
					<a href="javascript:search_index('1','1');" class="page next"></a>
					<a href="javascript:search_index('1','1');" class="page last"></a>
					</div>
					<!-- //pagination -->	
					</div>
					<div class="btn_area">
						<a href="javascript:pop_Close();" class="popcancel_btn btn_type2">닫 기</a>
					</div>
				</div>
		</div>		
		<!-- //#layer01-->
	</div>
	<!-- // layer_popup -->


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