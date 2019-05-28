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
$(document).ready(function(){
	fn_MSG();
});
function prc_Save(){
	var rowCnt = $("#CB_tbody tr").length;
	if (rowCnt == 0) {
        alert("처방약을 선택하여 주십시오.");
        return;
    }
    var form = document.jinryoFrom;
	if (confirm("입력데이터를 보존하시겠습니까 ?")) {
        form.action = "/treat/0404/PreScrptAdd_Save.do";
        form.submit();
    }
}
function prc_Del() {
    var form = document.jinryoFrom;
    
    if (confirm("입력데이터를 삭제하시겠습니까 ?")) {
        form.action = "/treat/0404/PreScrptAdd_Delete.do";
        form.submit();
    }
}
function fn_MSG(){
	var msg = document.getElementById('msg').value;
	if (msg != null && msg != "") {
		alert(msg);
	}
	document.getElementById('msg').value = "";
}
function DRUG_CHK(CODE) {
	var sendData = "DRUGCODE=" + CODE;
	$.ajax({
		type : "POST",
		data : sendData,
		url : "/treat/0404/DRUGChk.do",
		success : function(data) {
			if(data == "-1"){
				alert("동일한 약을 이미 처방하셨습니다.");
			}
			else if(data == "-2"){
				alert("처방약 등록에 실패하였습니다.");
			}
			else if(data == "-3")
			{
				alert("처방약을 가져오지 못했습니다.");
			}
			else{
				if(data != ""){
					console.log("List:" + JSON.stringify(data));
					var rowCnt = $("#CB_tbody tr").length + 1;
					var trdata = 
						   ['<tr id = \'' + rowCnt + '\'>',
						    '<td headers="n01 th01" style="text-align: center;">' + rowCnt + '</td>',
						    '<td headers="n01 th02" style="text-align: center;">' + data.MDI_NAME + '</td>',
						    '<td headers="n01 th03" style="text-align: center;">',
						    '<input name="USEVOL_' + data.JJDCB_DRUGCODE + '" type="text" id="USEVOL_' + data.JJDCB_DRUGCODE + '" class="textfield" value="' + data.JJDCB_USEVOL + '"  onkeyup = "this.value=chk_Number(this)"/>',
						    '<label for="USEVOL_' + data.JJDCB_DRUGCODE + '"></label>',
						    '</td>',
						    '<td headers="n01 th04" style="text-align: center;">' + data.UNITNAME + '</td>',
						    '<td headers="n01 th05" style="text-align: center;">',
						    '<input name="CMNT_' + data.JJDCB_DRUGCODE + '" type="text" id="CMNT_' + data.JJDCB_DRUGCODE + '" class="textfield" value="' + data.JJDCB_CMNT + '"/>',
						    '<label for="CMNT_' + data.JJDCB_DRUGCODE + '"></label>',
						    '</td>',
						    '<td headers="n01 th06" style="text-align: center;"><a href="javascript:prc_LineDel(\'' + data.JJDCB_DRUGCODE + '\',\'' + rowCnt + '\');" class="cancel_btn" style="margin-left:0px; width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">삭제</a></td>',
						    '</tr>'
						   ].join('\n');
					$("#CB_tbody").append(trdata);
			 	}
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});
}

function prc_LineDel(CODE,id) {
	var sendData = "DRUGCODE=" + CODE;
	$.ajax({
		type : "POST",
		data : sendData,
		url : "/treat/0404/DRUG_Delete.do",
		success : function(data) {
			if(data == "-1"){
				alert("처방약 삭제실패");
			}
			else{
				$("#" + id).remove();
			}
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});
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
	var SRCHNAME = document.getElementById('SRCHNAME').value;
	var SRCHNO = document.getElementById('SRCHNO').value;
	var sendData = "SRCHNAME=" + SRCHNAME + "&SRCHNO=" + SRCHNO + "&page=" + page;
	$.ajax({
		type : "POST",
		data : sendData,
		url : "/treat/0404/searchDRUG.do",
		success : function(html) {
			$("#DRUG_pop").empty();
			$("#DRUG_pop").append(html);
		},
		error : function(xmlHttpObj) {
			alert(xmlHttpObj.responseText + '오류가 발생하였습니다.');
		}
	});
}
function prc_Return() {
	document.getElementById('DTLDay').value = '';
	var form = document.jinryoFrom;
	form.action="/treat/0403/CareJnlAdd.do";
	form.submit();
}
function chk_Number(ag_InpFld) {
    var data = ag_InpFld.value;
    var CommaChk = 0;
    for (var i = 0; i < data.length; ++i) {
        if (!('0' <= data.charAt(i) && data.charAt(i) <= '9' || data.charAt(i) == '.')) {
            alert("숫자또는 '.' 만 입력하실 수 있습니다.");
            data = "0";
            return data;
        }
        else if (data.charAt(i) == '.') {
        CommaChk++;
        }
    }
    if (CommaChk > 1) {//'.'이 두번이상 들어간경우.
        alert("정상정인 숫자가 아닙니다. ");
        data = "0";
        return data;
    }
    return data;
}
</script>
<title>동물진료 &gt; 처방전</title>
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
                    <p class="contents_title">처방전</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <li>> 동물진료</li>
                        <li>> 진료일지</li>
                        <li>> 상세내용</li>
                        <li>> 처방전</li>
                    </ol>
				</div>
				<!-- //contents_title-->
				<!-- contents-->
				<div class="contents_table">
					<form method="POST" name="jinryoFrom" id="jinryoFrom" >
					<input type="hidden" id="DOCNO" name="DOCNO" value='${jinryoINFO.JJR_DOCNO}' />
					<input type="hidden" id="JRNO" name="JRNO" value='${jinryoINFO.JJJ_DOCNO}' />
					<input type="hidden" id="msg" name="msg" value="${msg}" />
					<input type="hidden" id="DTLDay" name="DTLDay" value="${DTLDay}" />
					<input type="hidden" id="CBDOCNO" name="CBDOCNO" value="${CBINFO.JJDCB_DOCNO}" />
					<!-- 문서정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">문서정보</span>
						</div>
						<table class="aniinfo_search" >
							<caption>문서정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">처방번호</th>
									<td colspan="3">
										${CBINFO.JJDCB_DOCNO}
									</td>
								</tr>
								<tr>
									<th scope="row">처방일자</th>
									<td colspan="3">
										${CBINFO.JJDCB_CBDATE}
									</td>
								</tr>
								<tr>
									<th scope="row">진료번호</th>
									<td>
										${jinryoINFO.JJJ_DOCNO}
									</td>
									<th scope="row">진단명</th>
									<td>
										${jinryoINFO.JJJ_JRDZZNAME}
									</td>
								</tr>
								<tr>
									<th scope="row">임상증상</th>
									<td colspan="3">
										<input name="JRCMNT" type="text" id="JRCMNT" disabled="disabled" class="textfield" value="${jinryoINFO.JJJ_JRCMNT}"/>
										<label for="JRCMNT"></label>
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
						</div>
						<table class="aniinfo_search" >
							<caption>동물정보</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:10%;">
								<col style="width:5%;">
								<col style="width:12%;">
								<col style="width:17%;">
								<col style="width:11%;">
								<col style="width:15%;">
							</colgroup>
                            <thead>
								<tr>
									<th scope="col" id="th01">동물명</th>
									<th scope="col" id="th02">영명</th>
									<th scope="col" id="th03">동물번호</th>
									<th scope="col" id="th04">성별</th>
									<th scope="col" id="th05">동물사</th>
									<th scope="col" id="th06">생년월일(나이)</th>
									<th scope="col" id="th07">반입일자</th>
									<th scope="col" id="th08">반입처</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="text-align: center;">${m_AniTmp.MAC_NAME}</td>
									<td style="text-align: center;">${m_AniTmp.MAC_ENAME}</td>
									<td style="text-align: center;">${m_AniTmp.MAI_ANICODE}</td>
									<td style="text-align: center;">${m_AniTmp.SEXNAME}</td>
									<td style="text-align: center;">${m_AniTmp.VVRMNAME}</td>
									<td style="text-align: center;">${m_AniTmp.MAI_BIRTHDAY}(${m_AniTmp.CURAGE})</td>
									<td style="text-align: center;">${m_AniTmp.DAIO_IODATE}</td>
									<td style="text-align: center;">${m_AniTmp.DAIO_PLACE}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보 -->
					
					<!-- 처방내역 -->			
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title">처방내역</span>
							<div class="sys_btn_box">
								<span class="align_right btn_hide"><a href="#layer01" class="cha_btn layer_open">추가</a></span>
							</div>
						</div>
						<table class="aniinfo_search" >
							<caption>처방내역</caption>
							<colgroup>
								<col style="width:5%;">
								<col style="width:25%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:25%;">
								<col style="width:15%;">
							</colgroup>
                            <thead>
								<tr>
									<th scope="col" id="th01">No</th>
									<th scope="col" id="th02">처방약</th>
									<th scope="col" id="th03">용량</th>
									<th scope="col" id="th04">단위</th>
									<th scope="col" id="th05">용법</th>
									<th scope="col" id="th06">삭제</th>
								</tr>
							</thead>
							<tbody id="CB_tbody">
								<c:forEach var="CBData" items="${CBLIST}" varStatus="st">		
								<tr id = "${CBData.SEQ}">
									<td headers="n01 th01" style="text-align: center;">${CBData.SEQ}</td>
									<td headers="n01 th02" style="text-align: center;">${CBData.MDI_NAME}</td>
									<td headers="n01 th03" style="text-align: center;">
										<input name="USEVOL_${CBData.JJDCB_DRUGCODE}" type="text" id="USEVOL_${CBData.JJDCB_DRUGCODE}" class="textfield" value="${CBData.JJDCB_USEVOL}"  onkeyup = "this.value=chk_Number(this)"/>
										<label for="USEVOL_${CBData.JJDCB_DRUGCODE}"></label>
									</td>
									<td headers="n01 th04" style="text-align: center;">${CBData.UNITNAME}</td>
									<td headers="n01 th05" style="text-align: center;">
										<input name="CMNT_${CBData.JJDCB_DRUGCODE}" type="text" id="CMNT_${CBData.JJDCB_DRUGCODE}" class="textfield" value="${CBData.JJDCB_CMNT}"/>
										<label for="CMNT_${CBData.JJDCB_DRUGCODE}"></label>
									</td>
									<td headers="n01 th06" style="text-align: center;">
										<a href="javascript:prc_LineDel('${CBData.JJDCB_DRUGCODE}','${CBData.SEQ}');" class="cancel_btn" style="margin-left:0px; width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">삭제</a>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- //처방내역 -->
					
					<!-- //문서정보 -->
					<div class="table_title_box" style= "margin-top: 20px;">
						<div class="sys_btn_box">
							<a href="javascript:prc_Save();" class="cancel_btn" style="width: 80px;border:solid 1px #397516;background:#4d9721;color:#fff !important;">저장</a>
							<c:if test="${CBINFO.JJDCB_DOCNO != null and CBINFO.JJDCB_DOCNO != ''}">
								<a href="javascript:prc_Del();" class="save_btn" style="width: 80px;margin-left:10px;border:solid 1px #FF0000;background:#F15F5F;color:#fff !important;">삭제</a>
							</c:if>
							<a href="javascript:prc_Return();" class="cancel_btn" style="width: 80px">목록</a>
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
			<div class="layer_tit">처방약 선택</div>
				<div class="layer_con">
					<div class="search_box">
                        <table class="aniinfo_search" style="width:760px;" >
							<caption>처방약목록</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:80%;">
							</colgroup>
                            <tbody>
                            <tr>
                            	<th scope="row">처방약 명칭</th>
                            	<td>
                            		<input name="SRCHNAME" type="text" id="SRCHNAME" class="textfield"/>
                            		<label for="SRCHNAME"></label>
                            	</td>
                            </tr>
                            <tr>
                            	<th scope="row">처방약 번호</th>
                            	<td>
                            		<input name="SRCHNO" type="text" id="SRCHNO" class="textfield"/>
                            		<label for="SRCHNO"></label>
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
					<div id='DRUG_pop'>
					<div class="table_box">
						<table class="aniinfo_search" style="width:760px; margin-top:20px;" >
							<caption>처방약정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:20%;">
								<col style="width:30%;">
								<col style="width:13%;">
								<col style="width:13%;">
								<col style="width:14%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">약품그룹</th>
									<th scope="col">약품명칭</th>
									<th scope="col">구분</th>
									<th scope="col">단위</th>
									<th scope="col">용도</th>
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