<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
function delete_File(SEQ, NO) {
    var form = document.jinryoFrom;
    var ID = 'filePath' + NO;
    var filename = document.getElementById(ID).value;
    if (filename == "" || filename == null) {
        alert("첨부파일이 없습니다.");
    }
    else {
        if (confirm("첨부파일을 삭제 하시겠습니까?")) {
        	document.getElementById('SEQNO').value = SEQ;
            form.action="/treat/0406/deleteFileInfo.do";
            form.submit();
        }
    }
}
function DownFile(SEQ, NO) {
    var form = document.jinryoFrom;
    var ID = 'filePath' + NO;
    var filename = document.getElementById(ID).value;
    //
    if (filename == "" || filename == null) {
        alert("첨부파일이 없습니다.");
    }
    else {
        if (confirm("첨부파일을 다운로드 하시겠습니까?")) {
        	document.getElementById('SEQNO').value = SEQ;
    		form.action = "/treat/0406/Filedownload.do";
    		form.submit();
        }
    }
}
function fn_MSG(){
	var msg = document.getElementById('msg').value;
	if (msg != null && msg != "") {
		alert(msg);
	}
	document.getElementById('msg').value = "";
}
function prc_Save() {
    var form = document.jinryoFrom;
    if (confirm("저장 하시겠습니까 ?")) {
        form.action = "/treat/0406/InspctMgr_K09_Save.do";
        form.submit();
    }
}
function prc_delete() {
    var form = document.jinryoFrom;
    if (confirm("삭제 하시겠습니까 ?")) {
        form.action = "/treat/0406/InspctMgr_K09_Delete.do";
        form.submit();
    }
}
//////////////////////////////////////////
function prc_Return() {
    //  alert("--돌아가기--");
    var form = document.jinryoFrom;
    var wk_RetURL = (form.RetURL.value == null) ? "" : form.RetURL.value;
    //
    if (wk_RetURL == "") {
        form.action = "/treat/0406/main.do";
    } else {
        form.action = wk_RetURL;
    }
    form.submit();

}
$(document).ready(function() {
	function readURL(input) {
		if (input.files && input.files[0]) {
            var FileSize = input.files[0].size; //파일용량
            var MaxFileSize = 1024 * 3072; //제한용량
            if(FileSize > MaxFileSize){
            	return false;
            }
            else{
            	return true;
            }
        }
    }
	//file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	$("#biz_file1").change(function(){
		var input_value = this.value.replace("C:\\fakepath\\", "");
		$("#filePath1").val(input_value);
		if(this.value != ''){
			if(!readURL(this)){
				alert("제한용량을 초과하였습니다.");
				this.value = '';
				$("#filePath1").val('');
			}
		}
	});
	$("#biz_file2").change(function(){
		var input_value = this.value.replace("C:\\fakepath\\", "");
		$("#filePath2").val(input_value);
		if(this.value != ''){
			if(!readURL(this)){
				alert("제한용량을 초과하였습니다.");
				this.value = '';
				$("#filePath2").val('');
			}
		}
	});
	$("#biz_file3").change(function(){
		var input_value = this.value.replace("C:\\fakepath\\", "");
		$("#filePath3").val(input_value);
		if(this.value != ''){
			if(!readURL(this)){
				alert("제한용량을 초과하였습니다.");
				this.value = '';
				$("#filePath3").val('');
			}
		}
	});
	fn_MSG();
}); 
/////////////////////////////////////////////
</script>
<title>동물진료 &gt; 검사관리</title>
</head>
<body>
<div id="sub_wrap">
	<!-- header -->
<jsp:include page="/header.do"></jsp:include>
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
                    <p class="contents_title">X-Ray</p>
                    <ol class="location">
                        <li><img src="/images/home_icon.gif" alt="home"></li>
                        <c:choose>
                        <c:when test="${MenuType == 'J'}">
							<li>> 동물진료</li>
                        	<li>> 검사관리</li>
                        	<li>> X-Ray</li>
						</c:when>
						<c:otherwise>
							<li>> 병리방역업무</li>
                        	<li>> 부검결과서</li>
                        	<li>> 검사관리</li>
                        	<li>> X-Ray</li>
						</c:otherwise>
						</c:choose>
                    </ol>
				</div>
				<!-- //contents_title-->
				<form method="POST" name="jinryoFrom" id="jinryoFrom" enctype="multipart/form-data" >
				<input type="hidden" id="DOCNO" name="DOCNO" value="${DOCNO}" />
				<input type="hidden" id="JRNO" name="JRNO" value="${JRNO}" />
				<input type="hidden" id="DTLDay" name="DTLDay" value="${DTLDay}" />
				<input type="hidden" id="KSDOCNO" name="KSDOCNO" value="${KSDOCNO}" />
				<input type="hidden" id="MenuType" name="MenuType" value="${MenuType}" />
				<input type="hidden" id="RetURL" name="RetURL" value="${RetURL}" />
				<input type="hidden" id="SEQNO" name="SEQNO" value="" />
				<input type="hidden" id="CLS1" name="CLS1" value="XRAY" />
				<input type="hidden" id="msg" name="msg" value="${msg}" />
				<!-- contents-->
				<div class="contents_table">
					<!-- 공통정보-->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">공통정보</p>
						</div>
						<table class="aniinfo_search" >
							<caption>공통정보</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:30%;">
								<col style="width:10%;">
							</colgroup>
                            <tbody>
                            	<c:choose>
                            	<c:when test="${MenuType == 'J'}">
								<tr>
									<th scope="row">진료번호</th><td>[${jinryoINFO.JJJ_JRTYPE}]${jinryoINFO.JJJ_DOCNO}</td>
								</tr>
								<tr>
									<th scope="row">진단명</th><td>${jinryoINFO.JJJ_JRDZZNAME}</td>
								</tr>
								<tr>
									<th scope="row">임상증상</th><td>${jinryoINFO.JJJ_JRCMNT}</td>
								</tr>
								</c:when>
								<c:otherwise>
								<tr>
									<th scope="row">부검번호</th><td>[부검]${jinryoINFO.PBR_DOCNO}</td>
								</tr>
								<tr>
									<th scope="row">진단명</th><td>${jinryoINFO.PBR_BUDZZNAME}</td>
								</tr>
								<tr>
									<th scope="row">병리검사결과</th><td>${jinryoINFO.PBR_KSRESLT}</td>
								</tr>
								</c:otherwise>
								</c:choose>
						   </tbody>
						</table>
					</div>
					<!-- //문서정보-->
					
					<!-- 동물정보 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">동물정보</p>
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
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.MAC_NAME}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.MAC_ENAME}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.MAI_ANICODE}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.SEXNAME}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.VVRMNAME}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.MAI_BIRTHDAY}(${m_AniTmp.CURAGE})</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.DAIO_IODATE}</td>
									<td style="text-align: center;line-height: 1.5;vertical-align: middle;">${m_AniTmp.DAIO_PLACE}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //동물정보-->
					
					<!-- 기본검사내용 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<p class="sub_title">기본검사내용</p>
						</div>
						<table class="aniinfo_search table_view4" >
							<caption>기본검사내용</caption>
							<colgroup>
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
                            <tbody>
								<tr>
									<th scope="row">검사일자</th>
									<td><p><input type="text" class="calendar1" id="cal_1" name = "cal_1" value="${DTLDay}">
									<th scope="row">검사구분</th>
									<td>
										<c:choose>
										<c:when test="${MenuType == 'J'}">
											진료
										</c:when>
										<c:otherwise>
											부검
										</c:otherwise>
										</c:choose>
									</td>
								</tr>
						   </tbody>
						</table>
					</div>
					<!-- //기본검사내용 -->
					
					<!-- 향후계획 -->
					<div class="aniinfo_add_box">
						<div class="table_title_box">
							<span class="table_title"><a href="#" id="btn_plus2"><img src="/images/btn_plus.gif" alt=""></a><a href="#" id="btn_minus2"><img src="/images/btn_minus.gif" alt=""></a>상세검사내용</span>
						</div>								
						<table class="aniinfo_add table_view2">
							<caption>상세검사내용</caption>
							<colgroup>
							<col style="width:25%;">
							<col style="width:75%;">
							</colgroup>
							<tbody>
							<c:choose>
							<c:when test="${PMS0406 == 'Y'}">
						    <tr>
						    	<th scope="row">검사결과/특이사항</th>
						    	<td style="text-align: left;padding-left: 10px;"><input name='JJDKXR_RSLT' type='text' class='textfield' value='${KS09INFO.JJDKXR_RSLT}'><label for='JJDKXR_RSLT'></label></td>
						    </tr>
						    <tr>
						    	<th scope="row">첨부자료1</th>
						    	<td style="text-align: left;padding-left: 10px;" class="filebox">
						    		<input type="text" id="filePath1" name="filePath1" class="upload-name" value="${fileNAME1}" disabled="disabled" style="width:40%;">
									<c:choose>
										<c:when test="${not empty fileNAME1}">
											<label for="biz_file1" style="display: none;">첨부하기</label> 
											<input type="file" id="biz_file1" name="biz_file1" class="upload-hidden" style="display: none;">
											<a href="javascript:delete_File('${fileSEQ1}', '1');" class="btn_search">삭제하기</a>
											<a href="javascript:DownFile('${fileSEQ1}', '1');" class="btn_search">다운로드</a>
										</c:when>
										<c:otherwise>
											<label for="biz_file1">첨부하기</label>
											<input type="file" id="biz_file1" name="biz_file1" class="upload-hidden">
										</c:otherwise>
									</c:choose>
						    	</td>
						    </tr>
						    <tr>
						    	<th scope="row">첨부자료2</th>
						    	<td style="text-align: left;padding-left: 10px;" class="filebox">
						    		<input type="text" id="filePath2" name="filePath2" class="upload-name" value="${fileNAME2}" disabled="disabled" style="width:40%;">
									<c:choose>
										<c:when test="${not empty fileNAME2}">
											<label for="biz_file2" style="display: none;">첨부하기</label> 
											<input type="file" id="biz_file2" name="biz_file2" class="upload-hidden" style="display: none;">
											<a href="javascript:delete_File('${fileSEQ2}', '2');" class="btn_search">삭제하기</a>
											<a href="javascript:DownFile('${fileSEQ2}', '2');" class="btn_search">다운로드</a>
										</c:when>
										<c:otherwise>
											<label for="biz_file2">첨부하기</label>
											<input type="file" id="biz_file2" name="biz_file2" class="upload-hidden">
										</c:otherwise>
									</c:choose>
						    	</td>
						    </tr>
						    <tr>
						    	<th scope="row">첨부자료3</th>
						    	<td style="text-align: left;padding-left: 10px;" class="filebox">
									<input type="text" id="filePath3" name="filePath3" class="upload-name" value="${fileNAME3}" disabled="disabled" style="width:40%;">
									<c:choose>
										<c:when test="${not empty fileNAME3}">
											<label for="biz_file3" style="display: none;">첨부하기</label> 
											<input type="file" id="biz_file3" name="biz_file3" class="upload-hidden" style="display: none;">
											<a href="javascript:delete_File('${fileSEQ3}', '3');" class="btn_search">삭제하기</a>
											<a href="javascript:DownFile('${fileSEQ3}', '3');" class="btn_search">다운로드</a>
										</c:when>
										<c:otherwise>
											<label for="biz_file3">첨부하기</label>
											<input type="file" id="biz_file3" name="biz_file3" class="upload-hidden">
										</c:otherwise>
									</c:choose>
								</td>
						    </tr>
						    </c:when>
							<c:otherwise>
							<tr>
						    	<th scope="row">검사결과/특이사항</th>
						    	<td style="text-align: left;padding-left: 10px;">${KS09INFO.JJDKXR_RSLT}</td>
						    </tr>
						    <tr>
						    	<th scope="row">첨부자료1</th>
						    	<td style="text-align: left;padding-left: 10px;" class="filebox">
						    		<input type="text" id="filePath1" name="filePath1" class="upload-name" value="${fileNAME1}" disabled="disabled" style="width:40%;">
						    	</td>
						    </tr>
						    <tr>
						    	<th scope="row">첨부자료2</th>
						    	<td style="text-align: left;padding-left: 10px;" class="filebox">
						    		<input type="text" id="filePath2" name="filePath2" class="upload-name" value="${fileNAME2}" disabled="disabled" style="width:40%;">
						    	</td>
						    </tr>
						    <tr>
						    	<th scope="row">첨부자료3</th>
						    	<td style="text-align: left;padding-left: 10px;" class="filebox">
									<input type="text" id="filePath3" name="filePath3" class="upload-name" value="${fileNAME3}" disabled="disabled" style="width:40%;">
								</td>
						    </tr>
							</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="btn_area">
							<c:if test="${PMS0406 == 'Y'}">
							<a href="javascript:prc_delete();" class="popent_btn btn_type2">삭제</a>
							<a href="javascript:prc_Save();" class="popcancel_btn btn_type2">저장</a>
							</c:if>
							<a href="javascript:prc_Return();" class="popcancel_btn btn_type2">돌아가기</a>
							</div>
						</div>
				<!-- //contents-->
				</div>
				</form>
			</section>
			<!-- //right-->
		</div>
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
