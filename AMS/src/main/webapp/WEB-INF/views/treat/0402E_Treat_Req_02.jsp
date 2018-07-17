<%@ page contentType="text/html; charset=UTF-8" %>
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
<script src="/js/common/json2.js"></script>
<script type="text/javascript">
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
        form.action = "/treat/0402/CareRctAdd_Save.do";
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
                        <li>> 추가</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="jinryoFrom" id="jinryoFrom">
					<input type="hidden" id="JYADD_ANICODE" name="JYADD_ANICODE" value="" />
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">문서정보</span>
						</div>
						<table class="aniinfo_search" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">작성자</th>
									<td>
										${USERNAME}
									</td>
								</tr>
								<tr>
									<th scope="row">부서</th>
									<td>
										${USERDEPT}
									</td>
								</tr>
								<tr>
									<th scope="row">작성일</th>
									<td>
										<input name="RCTDATE" type="text" id="RCTDATE" class="calendar1" value="${RCTDATE}"/>
										<label for="RCTDATE"></label>
									</td>
								</tr>
						   </tbody>
						</table>

					</div>
					<!-- //문서정보-->
					<!-- 동물정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">동물정보</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" class="cha_btn layer_open">추가</a></span>
							</div>
						</div>
						<table class="aniinfo_search" >
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
									</td>
									<th scope="row">동물사</th>
									<td id = "td_vvrm">
									</td>
								</tr>
								<tr>
									<th scope="row">성별</th>
									<td id = "td_sex">
									</td>
									<th scope="row">나이</th>
									<td id = "td_age">
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //동물정보 -->
					<!-- 진료구분/증상 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">진료구분/증상</span>
						</div>

						<table class="aniinfo_search" >
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
											<option value="" selected="selected">-- 접수 진료구분 선택--</option>
											<c:forEach var="KindList" items="${KindList}" varStatus="st">
												<option value="${KindList.MCC_S_CODE}">${KindList.MCC_S_NAME}</option>
											</c:forEach>
										</select>	
									</td>
								</tr>
								<tr>
									<th scope="row" style="vertical-align: middle;">증상</th>
									<td>
										<textarea rows="3" id="JJRCMNT" name="JJRCMNT" style="width:98%; border: 0; resize: none; padding:10px 5px; font-size:13px; color:#555; line-height:20px; text-align:left;"></textarea>
									</td>
								</tr>
						   </tbody>
						</table>

					</div>
					<!-- //진료구분/증상 -->
					<!-- //문서정보 -->
					<div class="table_title_box" style= "margin-top: 20px;">
						<div class="sys_btn_box">
							<c:if test="${PMS0402 == 'Y'}">
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
	<!-- //container -->
	<!-- footer -->
	<div id="footer_wrap">
		<jsp:include page="/footer.do"></jsp:include>
	</div>
	<!-- //footer -->
	</div>
</div>
</body>
</html>